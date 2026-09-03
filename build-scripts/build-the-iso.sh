#!/usr/bin/env bash
#
# Xray_OS ISO Build Script
# 
# Usage:
#   ./build-the-iso.sh [OPTIONS]
#
# Options:
#   -d, --desktop <name>        Desktop environment: xfce | plasma | gnome | sonicde (default: xfce)
#   -l, --login-manager <name>  Login manager: sddm | plasma-login-manager | gdm | lightdm | sonic-login-manager (default: sddm)
#   -a, --audio <server>        Audio subsystem: pipewire | pulseaudio (default: pipewire)
#   -v, --version <string>      ISO version tag (default: v26.02.16.01)
#   --iso-name <string>         ISO base name (default: xray)
#   --xlibre                    Enable xlibre display protocol packages
#   --no-xlibre                 Disable xlibre (use xorg) (default)
#   --chaotic                   Enable Chaotic-AUR repositories (default)
#   --no-chaotic                Disable Chaotic-AUR repositories
#   --clean-cache               Clean pacman cache before build
#   --remove-build              Remove build directory after successful ISO generation
#   -y, --yes, --no-confirm     Non-interactive mode (skip countdowns and prompts)
#   -h, --help                  Show this help message and exit
#

set -euo pipefail

##################################################################################
# Environment & Path Resolution
##################################################################################

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
ARCHISO_SRC="${PROJECT_DIR}/archiso"

##################################################################################
# Terminal Colors & Styling
##################################################################################

if [[ -t 1 ]] && command -v tput >/dev/null 2>&1; then
    RED="$(tput setaf 1 2>/dev/null || true)"
    GREEN="$(tput setaf 2 2>/dev/null || true)"
    YELLOW="$(tput setaf 3 2>/dev/null || true)"
    BLUE="$(tput setaf 4 2>/dev/null || true)"
    MAGENTA="$(tput setaf 5 2>/dev/null || true)"
    CYAN="$(tput setaf 6 2>/dev/null || true)"
    BOLD="$(tput bold 2>/dev/null || true)"
    RESET="$(tput sgr0 2>/dev/null || true)"
else
    RED="" GREEN="" YELLOW="" BLUE="" MAGENTA="" CYAN="" BOLD="" RESET=""
fi

##################################################################################
# Logging Helpers
##################################################################################

log_section() {
    echo
    echo "${GREEN}##################################################################${RESET}"
    echo "${BOLD}${GREEN}$1${RESET}"
    echo "${GREEN}##################################################################${RESET}"
    echo
}

log_phase() {
    local phase_num="$1"
    local phase_title="$2"
    echo
    echo "${GREEN}##################################################################${RESET}"
    echo "${BOLD}${GREEN}Phase ${phase_num} : ${phase_title}${RESET}"
    echo "${GREEN}##################################################################${RESET}"
    echo
}

log_info() {
    echo "${CYAN}[INFO]${RESET} $1"
}

log_warn() {
    echo "${YELLOW}[WARN]${RESET} $1"
}

log_error() {
    echo "${RED}[ERROR]${RESET} $1" >&2
}

log_success() {
    echo "${GREEN}[SUCCESS]${RESET} $1"
}

##################################################################################
# Error Trap
##################################################################################

on_error() {
    local lineno="$1"
    local cmd="$2"
    local exit_code="$3"
    echo
    echo "${RED}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${RESET}" >&2
    echo "${BOLD}${RED}[FATAL ERROR] Command failed on line ${lineno} with exit code ${exit_code}${RESET}" >&2
    echo "${RED}Command: ${cmd}${RESET}" >&2
    echo "${RED}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${RESET}" >&2
    echo
}
trap 'on_error "$LINENO" "$BASH_COMMAND" "$?"' ERR

##################################################################################
# ACL State & Restoration
##################################################################################

ACL_BACKUP_FILE=""
HAS_ACLS=false
SUDO_KEEP_ALIVE_PID=""

restore_acls() {
    if [[ -n "${ACL_BACKUP_FILE:-}" && -f "${ACL_BACKUP_FILE:-}" ]]; then
        log_info "Restoring default ACLs on home directory from backup..."
        setfacl --restore="$ACL_BACKUP_FILE" 2>/dev/null || true
        rm -f "$ACL_BACKUP_FILE"
        log_info "ACLs restored."
    fi
}

cleanup_exit() {
    if [[ -n "${SUDO_KEEP_ALIVE_PID:-}" ]]; then
        kill "$SUDO_KEEP_ALIVE_PID" 2>/dev/null || true
    fi
    restore_acls
}
trap cleanup_exit EXIT INT TERM

##################################################################################
# Helper Functions
##################################################################################

show_help() {
    cat <<EOF
${BOLD}Xray_OS ISO Builder${RESET}

${BOLD}USAGE:${RESET}
  ./build-the-iso.sh [OPTIONS]

${BOLD}OPTIONS:${RESET}
  -d, --desktop <name>        Desktop environment: xfce | plasma | gnome | sonicde (default: xfce)
  -l, --login-manager <name>  Login manager: sddm | plasma-login-manager | gdm | lightdm | sonic-login-manager (default: sddm)
  -a, --audio <server>        Audio subsystem: pipewire | pulseaudio (default: pipewire)
  -v, --version <string>      ISO version string (default: v26.02.16.01)
  --iso-name <string>         ISO base name (default: xray)
  --beta                      Mark build as beta (appends '-beta' to ISO name)
  --no-beta                   Do not mark as beta (default)
  --xlibre                    Replace Xorg with xlibre display packages
  --no-xlibre                 Do not use xlibre (default)
  --chaotic                   Enable Chaotic-AUR repositories (default)
  --no-chaotic                Disable Chaotic-AUR repositories
  --clean-cache               Run pacman cache cleaning before build
  --remove-build              Remove build folder upon successful completion
  -y, --yes, --no-confirm     Skip interactive wait timers
  -h, --help                  Show this help message and exit

EOF
}

clean_cache() {
    local choice="$1"
    if [[ "$choice" == "yes" ]]; then
        log_info "Cleaning pacman package cache from /var/cache/pacman/pkg/..."
        sudo pacman -Scc --noconfirm
    else
        log_info "Skipping pacman cache cleaning."
    fi
}

remove_buildfolder() {
    local choice="$1"
    if [[ -z "${buildFolder:-}" ]]; then
        log_error "\$buildFolder is not set."
        return 1
    fi

    # Safety check against dangerous deletions
    if [[ "$buildFolder" == "/" || "$buildFolder" == "$HOME" || "$buildFolder" == "/home" ]]; then
        log_error "Refusing to delete unsafe directory: $buildFolder"
        return 1
    fi

    if [[ "$choice" == "yes" ]]; then
        if [[ -d "$buildFolder" ]]; then
            log_info "Unmounting any active chroot mounts in ($buildFolder)..."
            if command -v findmnt >/dev/null 2>&1; then
                findmnt -rnlo TARGET "$buildFolder" 2>/dev/null | sort -r | while IFS= read -r mnt; do
                    if [[ -n "$mnt" && "$mnt" != "$buildFolder" ]]; then
                        sudo umount -lf "$mnt" 2>/dev/null || true
                    fi
                done
            fi
            awk -v dir="$buildFolder" '$2 ~ "^" dir {print $2}' /proc/mounts 2>/dev/null | sort -r | while IFS= read -r mnt; do
                if [[ -n "$mnt" ]]; then
                    sudo umount -lf "$mnt" 2>/dev/null || true
                fi
            done

            log_info "Deleting build folder ($buildFolder)..."
            sudo rm -rf "$buildFolder"
            log_success "Build folder deleted."
        else
            log_info "No build folder found at $buildFolder. Nothing to delete."
        fi
    else
        log_info "Skipping build folder removal."
    fi
}

safe_download() {
    local url="$1"
    local dest="$2"
    local description="$3"

    log_info "Downloading latest ${description}..."
    local dest_dir
    dest_dir="$(dirname -- "$dest")"
    mkdir -p "$dest_dir"

    local temp_dest="${dest}.download.$$"
    if curl -fSL --connect-timeout 10 --retry 3 "$url" -o "$temp_dest" 2>/dev/null || wget -q -T 10 -t 3 "$url" -O "$temp_dest" 2>/dev/null; then
        mv -f "$temp_dest" "$dest"
        log_success "Successfully updated ${description}."
    else
        rm -f "$temp_dest"
        if [[ -f "$dest" ]]; then
            log_warn "Failed to download from ${url}. Retaining existing local copy of ${description}."
        else
            log_error "Failed to download required asset ${description} from ${url}."
            return 1
        fi
    fi
}

##################################################################################
# Default Configuration Settings
##################################################################################

desktop="xfce"
login_manager="sddm"
audio="pipewire"
xrayVersion="v26.02.16.01"
iso_name="xray"
beta=false

chaoticsrepo=true
xlibre=true
sonicde=false
installation_config_calamares=true
nvidia_driver="open"

clean_cache_opt="no"
remove_build_opt="no"
non_interactive=false

buildFolder="${HOME}/xray-build"
outFolder="${HOME}/xray-Out"

##################################################################################
# Parse CLI Options
##################################################################################

while [[ $# -gt 0 ]]; do
    case "$1" in
        -d|--desktop)
            desktop="${2:-}"
            shift 2
            ;;
        -l|--login-manager)
            login_manager="${2:-}"
            shift 2
            ;;
        -a|--audio)
            audio="${2:-}"
            shift 2
            ;;
        -v|--version)
            xrayVersion="${2:-}"
            shift 2
            ;;
        --iso-name)
            iso_name="${2:-}"
            shift 2
            ;;
        --beta)
            beta=true
            shift
            ;;
        --no-beta)
            beta=false
            shift
            ;;
        --xlibre)
            xlibre=true
            shift
            ;;
        --no-xlibre)
            xlibre=false
            shift
            ;;
        --chaotic)
            chaoticsrepo=true
            shift
            ;;
        --no-chaotic)
            chaoticsrepo=false
            shift
            ;;
        --clean-cache)
            clean_cache_opt="yes"
            shift
            ;;
        --remove-build)
            remove_build_opt="yes"
            shift
            ;;
        -y|--yes|--no-confirm)
            non_interactive=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            log_error "Unknown parameter: $1"
            show_help
            exit 1
            ;;
    esac
done

# Ensure script is not executed directly as root
if [[ ${EUID:-$(id -u)} -eq 0 ]]; then
    echo "Error: Do not run this script directly as root or with 'sudo ./build-the-iso.sh'." >&2
    echo "Run as a regular user; sudo will be invoked where root permissions are required." >&2
    exit 1
fi

# Validate choices
case "$desktop" in
    xfce|plasma|gnome|sonicde) ;;
    *)
        log_error "Invalid desktop: '$desktop'. Valid options: xfce | plasma | gnome | sonicde"
        exit 1
        ;;
esac

case "$login_manager" in
    sddm|plasma-login-manager|gdm|lightdm|sonic-login-manager) ;;
    *)
        log_error "Invalid login manager: '$login_manager'. Valid options: sddm | plasma-login-manager | gdm | lightdm | sonic-login-manager"
        exit 1
        ;;
esac

case "$audio" in
    pipewire|pulseaudio) ;;
    *)
        log_error "Invalid audio option: '$audio'. Valid options: pipewire | pulseaudio"
        exit 1
        ;;
esac

if [[ "$beta" == true ]]; then
    if [[ "$iso_name" != *beta* && "$iso_name" != *Beta* ]]; then
        iso_name="${iso_name}-beta"
    fi
fi

isoLabel="${iso_name}-${xrayVersion}-x86_64.iso"

##################################################################################
# Interactive Notice & BTRFS Check
##################################################################################

log_section "Xray_OS ISO Build Tool"
echo "Credits: Erik Dubois (ArcoLinux/Buildra/Kiro), Angel G., Xray_OS Team"
echo

# Pre-authenticate sudo credentials
log_info "Verifying sudo permissions..."
sudo -v

# Keep sudo credentials alive in background
( while true; do sudo -v; sleep 60; done; ) 2>/dev/null &
SUDO_KEEP_ALIVE_PID=$!

# BTRFS Notice
if lsblk -f 2>/dev/null | grep -q "btrfs"; then
    log_warn "Btrfs filesystem detected. Ensure sufficient free disk space and subvolume quota."
    if [[ "$non_interactive" == "false" ]]; then
        echo "Press CTRL+C within 5 seconds to abort..."
        for i in {5..1}; do
            echo -ne "Continuing in $i seconds...\r"
            sleep 1
        done
        echo
    fi
fi

##################################################################################
# Phase 1: Environment & Repository Setup
##################################################################################

log_phase "1" "Setting Parameters & Repositories"

log_info "Desktop Environment : $desktop"
log_info "Login Manager       : $login_manager"
log_info "Audio System        : $audio"
log_info "ISO Base Name       : $iso_name"
log_info "Beta Build          : $beta"
log_info "ISO Version Tag     : $xrayVersion"
log_info "Expected ISO Output : $isoLabel"
log_info "Build Directory     : $buildFolder"
log_info "Output Directory    : $outFolder"
log_info "Chaotic-AUR Enabled : $chaoticsrepo"
log_info "xlibre Enabled      : $xlibre"
echo

if [[ "$chaoticsrepo" == "true" ]]; then
    if pacman -Q chaotic-keyring &>/dev/null && pacman -Q chaotic-mirrorlist &>/dev/null; then
        log_success "Chaotic-AUR keyring and mirrorlist are installed on host."
    else
        local_keyring_script="${SCRIPT_DIR}/get-pacman-repos-keys-and-mirrors.sh"
        if [[ -f "$local_keyring_script" ]]; then
            log_info "Installing Chaotic-AUR keyring and mirrorlist using $local_keyring_script..."
            bash "$local_keyring_script"
        else
            log_error "Chaotic-AUR setup script not found at $local_keyring_script"
            exit 1
        fi
    fi
fi

##################################################################################
# Phase 1.5: Home Directory ACL Management
##################################################################################

log_phase "1.5" "Checking Home Directory ACLs"

if getfacl ~ 2>/dev/null | grep -q "^default:"; then
    log_info "Default ACLs detected on $HOME — creating temporary backup to prevent inheritance..."
    ACL_BACKUP_FILE="$(mktemp /tmp/home_acl_backup_XXXXXX.txt)"
    getfacl -d ~ > "$ACL_BACKUP_FILE" 2>/dev/null || true
    setfacl -k ~ 2>/dev/null || true
    HAS_ACLS=true
    log_success "Default ACLs temporarily stripped from $HOME."
else
    log_info "No default ACLs found on $HOME — skipping ACL modification."
fi

##################################################################################
# Phase 2: Host Dependencies Verification
##################################################################################

log_phase "2" "Verifying Host Dependencies"

required_pkgs=("archiso" "grub")
for pkg in "${required_pkgs[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        log_info "Dependency '$pkg' is already installed."
    else
        log_info "Installing missing dependency '$pkg'..."
        sudo pacman -S --needed --noconfirm "$pkg"
    fi
done

##################################################################################
# Phase 3: Build Folder Preparation
##################################################################################

log_phase "3" "Preparing Build Workspace"

if [[ ! -d "$ARCHISO_SRC" ]]; then
    log_error "Archiso source profile directory not found at: $ARCHISO_SRC"
    exit 1
fi

remove_buildfolder yes

log_info "Copying Archiso profile from $ARCHISO_SRC to $buildFolder/archiso..."
mkdir -p "$buildFolder"
cp -a "$ARCHISO_SRC" "$buildFolder/archiso"

##################################################################################
# Phase 4: GPG Keys & Extra Repositories
##################################################################################

log_phase "4" "Configuring Pacman Keyring & Extra Repositories"

log_info "Initializing host pacman keyring..."
sudo pacman-key --init

if [[ "$xlibre" == "true" ]]; then
    if ! sudo pacman-key -f B97F7C613F359424 &>/dev/null; then
        log_info "Importing xlibre GPG key..."
        curl -sS https://xlibre-arch.github.io/xlibre-archlinux.asc | sudo pacman-key --add -
        sudo pacman-key --recv-keys B97F7C613F359424 || true
        sudo pacman-key --lsign-key B97F7C613F359424 || true
    fi

    pacman_conf_target="$buildFolder/archiso/airootfs/etc/pacman.conf"
    if [[ -f "$pacman_conf_target" ]] && ! grep -q '\[xlibre\]' "$pacman_conf_target"; then
        log_info "Adding [xlibre] repository to build pacman.conf..."
        printf '\n[xlibre]\nServer = https://packages.xlibre.net/arch/stable/$arch\n' | sudo tee -a "$pacman_conf_target" >/dev/null
    fi
fi

##################################################################################
# Phase 5: Fetch Remote Assets & Customize Packages
##################################################################################

log_phase "5" "Updating Assets & Customizing Package Lists"

# Fetch latest .bashrc
safe_download "https://gitlab.com/xr-os/xray-bashrc/-/raw/main/etc/skel/.bashrc" \
    "$buildFolder/archiso/airootfs/etc/skel/.bashrc" \
    "skel .bashrc"

# Fetch latest mirrorlist
safe_download "https://gitlab.com/xr-os/xray-mirrorlists/-/raw/main/etc/pacman.d/mirrorlist" \
    "$buildFolder/archiso/airootfs/etc/pacman.d/mirrorlist" \
    "pacman mirrorlist"

# Fetch latest generic repos
safe_download "https://gitlab.com/xr-os/xray-generic-mirrorlists/-/raw/main/etc/pacman.d/xray-generic-repos" \
    "$buildFolder/archiso/airootfs/etc/pacman.d/xray-generic-repos" \
    "xray generic repos"

# Fetch latest plymouth config
safe_download "https://gitlab.com/xr-os/xray-plymouth-config/-/raw/main/etc/plymouth/plymouthd.conf" \
    "$buildFolder/archiso/airootfs/etc/plymouth/plymouthd.conf" \
    "plymouth configuration"

# Reset packages.x86_64 from source
log_info "Refreshing package manifest from $ARCHISO_SRC/packages.x86_64..."
cp -f "$ARCHISO_SRC/packages.x86_64" "$buildFolder/archiso/packages.x86_64"
PACKAGES_FILE="$buildFolder/archiso/packages.x86_64"

# Calamares installer configuration
if [[ "$installation_config_calamares" == "true" ]]; then
    log_info "Configuring Calamares installer packages and desktop launchers..."
    sed -i 's|^xray-installation-config-|xray-installation-config-calamares-|g' "$PACKAGES_FILE"

    # Ensure desktop directories exist in airootfs
    mkdir -p "$buildFolder/archiso/airootfs/etc/skel/Desktop"
    mkdir -p "$buildFolder/archiso/airootfs/home/liveuser/Desktop"
    mkdir -p "$buildFolder/archiso/airootfs/usr/share/applications"

    # Find installer desktop file source
    calamares_desktop_src=""
    for src_candidate in \
        "$ARCHISO_SRC/airootfs/usr/share/applications/xray-installer.desktop" \
        "$ARCHISO_SRC/airootfs/etc/skel/Desktop/xray-installer.desktop" \
        "/mnt/803910ca-b81c-4ed2-8ae6-9c1fbb26ffea/Development/Xray_OS/repositories/xray-calamares/xray-installer.desktop"; do
        if [[ -f "$src_candidate" ]]; then
            calamares_desktop_src="$src_candidate"
            break
        fi
    done

    if [[ -n "$calamares_desktop_src" ]]; then
        cp -f "$calamares_desktop_src" "$buildFolder/archiso/airootfs/etc/skel/Desktop/xray-installer.desktop"
        cp -f "$calamares_desktop_src" "$buildFolder/archiso/airootfs/home/liveuser/Desktop/xray-installer.desktop"
        cp -f "$calamares_desktop_src" "$buildFolder/archiso/airootfs/usr/share/applications/xray-installer.desktop"
        rm -f "$buildFolder/archiso/airootfs/etc/skel/Desktop/calamares.desktop"
        rm -f "$buildFolder/archiso/airootfs/home/liveuser/Desktop/calamares.desktop"
        rm -f "$buildFolder/archiso/airootfs/usr/share/applications/calamares.desktop"
        chmod 755 "$buildFolder/archiso/airootfs/etc/skel/Desktop/xray-installer.desktop" 2>/dev/null || true
        chmod 755 "$buildFolder/archiso/airootfs/home/liveuser/Desktop/xray-installer.desktop" 2>/dev/null || true
        chmod 755 "$buildFolder/archiso/airootfs/usr/share/applications/xray-installer.desktop" 2>/dev/null || true
        log_success "xray-installer.desktop installed to /etc/skel/Desktop and /home/liveuser/Desktop"
    else
        log_warn "Could not locate xray-installer.desktop source file."
    fi
fi

# Desktop Environment Package Customizations
log_info "Applying package customizations for desktop: $desktop"

case "$desktop" in
    "xfce")
        # Strip Plasma
        sed -i '/^plasma/d; /^dolphin/d; /^dolphin-plugins/d; /^kio-admin/d; /^kdegraphics-thumbnailers/d' "$PACKAGES_FILE"
        sed -i '/^ark/d; /^kcalc/d; /^gwenview/d; /^spectacle/d; /^kdeconnect/d; /^kwalletmanager/d; /^konsole/d' "$PACKAGES_FILE"
        sed -i '/^tolitica-plasma-theme/d; /^xray-kde-dark/d; /^xray-kde-settings/d; /^arch-kde-theme/d; /^dtos-kde-theme/d; /^viper-kde-theme/d' "$PACKAGES_FILE"
        sed -i '/^kwin-x11/d; /^kwayland-integration/d' "$PACKAGES_FILE"

        # Strip GNOME
        sed -i '/^gnome/d; /^gnome-extra/d; /^xray-gnome-settings/d' "$PACKAGES_FILE"

        # Strip SonicDE
        sed -i '/^sonic/d; /^xray-sonicde-settings/d' "$PACKAGES_FILE"

        # Set wallpapers
        sed -i 's/^xray-wallpapers$/xray-xfce-wallpapers/' "$PACKAGES_FILE"
        ;;

    "plasma")
        # Strip XFCE
        sed -i '/^xfce4/d; /^xray-xfce-settings/d; /^gvfs/d; /^flameshot/d; /^vlc/d; /^xcape/d; /^arandr/d; /^catfish/d' "$PACKAGES_FILE"
        sed -i '/^evince/d; /^file-roller/d; /^gnome-disk-utility/d; /^gnome-keyring/d; /^gnome-screenshot/d; /^nomacs/d; /^playerctl/d; /^polkit-gnome/d; /^qt5ct/d; /^gittyup/d; /^hardcode-fixer-git/d; /^mugshot/d; /^autorandr/d; /^volumeicon/d; /^surfn-icons-git/d; /^numix-icon-theme-git/d; /^numix-circle-icon-theme-git/d; /^sardi-icons/d' "$PACKAGES_FILE"

        # Strip GNOME
        sed -i '/^gnome/d; /^gnome-extra/d; /^xray-gnome-settings/d' "$PACKAGES_FILE"

        # Strip SonicDE
        sed -i '/^sonic/d; /^xray-sonicde-settings/d' "$PACKAGES_FILE"

        # Set wallpapers
        sed -i 's/^xray-xfce-wallpapers$/xray-wallpapers/' "$PACKAGES_FILE"
        ;;

    "sonicde")
        # Strip XFCE
        sed -i '/^xfce4/d; /^xray-xfce-settings/d; /^gvfs/d; /^flameshot/d; /^vlc/d; /^xcape/d; /^arandr/d; /^catfish/d' "$PACKAGES_FILE"
        sed -i '/^evince/d; /^file-roller/d; /^gnome-disk-utility/d; /^gnome-keyring/d; /^gnome-screenshot/d; /^nomacs/d; /^playerctl/d; /^polkit-gnome/d; /^qt5ct/d; /^gittyup/d; /^hardcode-fixer-git/d; /^mugshot/d; /^autorandr/d; /^volumeicon/d; /^surfn-icons-git/d; /^numix-icon-theme-git/d; /^numix-circle-icon-theme-git/d; /^sardi-icons/d' "$PACKAGES_FILE"

        # Strip GNOME
        sed -i '/^gnome/d; /^gnome-extra/d; /^xray-gnome-settings/d' "$PACKAGES_FILE"

        # Strip Plasma
        sed -i '/^plasma/d; /^kwin-x11/d; /^xray-kde-settings/d; /^xray-kde-dark/d' "$PACKAGES_FILE"

        # Set wallpapers
        sed -i 's/^xray-xfce-wallpapers$/xray-wallpapers/' "$PACKAGES_FILE"
        ;;

    "gnome")
        # Strip XFCE
        sed -i '/^gvfs/d; /^flameshot/d; /^xcape/d; /^arandr/d; /^catfish/d; /^evince/d; /^file-roller/d; /^nomacs/d; /^playerctl/d; /^qt5ct/d; /^gittyup/d; /^hardcode-fixer-git/d; /^mugshot/d; /^autorandr/d; /^volumeicon/d; /^xray-xfce-settings/d' "$PACKAGES_FILE"

        # Strip Plasma
        sed -i '/^plasma/d; /^dolphin/d; /^dolphin-plugins/d; /^kio-admin/d; /^kdegraphics-thumbnailers/d; /^ark/d; /^kcalc/d; /^gwenview/d; /^spectacle/d; /^kdeconnect/d; /^kwalletmanager/d; /^konsole/d' "$PACKAGES_FILE"
        sed -i '/^tolitica-plasma-theme/d; /^xray-kde-dark/d; /^xray-kde-settings/d; /^arch-kde-theme/d; /^dtos-kde-theme/d; /^viper-kde-theme/d; /^kwin-x11/d; /^kwayland-integration/d' "$PACKAGES_FILE"

        # Strip SonicDE
        sed -i '/^sonic/d; /^xray-sonicde-settings/d' "$PACKAGES_FILE"

        # Set wallpapers
        sed -i 's/^xray-wallpapers$/xray-gnome-wallpapers/' "$PACKAGES_FILE"
        ;;
esac

# Display Manager Configuration
log_info "Configuring login manager: $login_manager"
dm_service=""

case "$login_manager" in
    "sddm")
        sed -i '/^plasma-login-manager/d; /^gdm/d; /^lightdm/d; /^sonic-login-manager/d; /^sonic-silver-sddm/d' "$PACKAGES_FILE"
        dm_service="sddm.service"
        ;;
    "plasma-login-manager")
        sed -i '/^sddm/d; /^gdm/d; /^lightdm/d; /^sonic-login-manager/d; /^xray-sddm-simplicity-git/d; /^sonic-silver-sddm/d' "$PACKAGES_FILE"
        dm_service="plasmalogin.service"
        ;;
    "gdm")
        sed -i '/^sddm/d; /^plasma-login-manager/d; /^lightdm/d; /^sonic-login-manager/d; /^xray-sddm-simplicity-git/d; /^sonic-silver-sddm/d' "$PACKAGES_FILE"
        dm_service="gdm.service"
        ;;
    "lightdm")
        sed -i '/^sddm/d; /^plasma-login-manager/d; /^gdm/d; /^sonic-login-manager/d; /^xray-sddm-simplicity-git/d; /^sonic-silver-sddm/d' "$PACKAGES_FILE"
        dm_service="lightdm.service"
        ;;
    "sonic-login-manager")
        sed -i '/^sddm/d; /^plasma-login-manager/d; /^gdm/d; /^lightdm/d; /^xray-sddm-simplicity-git/d; /^sonic-silver-sddm/d' "$PACKAGES_FILE"
        dm_service="soniclogin.service"
        ;;
esac

if [[ -n "$dm_service" ]]; then
    mkdir -p "$buildFolder/archiso/airootfs/etc/systemd/system"
    sudo ln -sf "/usr/lib/systemd/system/${dm_service}" "$buildFolder/archiso/airootfs/etc/systemd/system/display-manager.service"
fi

# Display Manager Autologin Configuration per Desktop Environment
log_info "Configuring display manager autologin configuration for desktop: $desktop"
ignore_source_dir="${ARCHISO_SRC}/.ignore"

# Remove any stray .ignore directory copied into the temporary build folder
rm -rf "$buildFolder/archiso/.ignore"

if [[ "$desktop" == "xfce" ]]; then
    if [[ -d "${ignore_source_dir}/sddm-xfce/sddm.conf.d" ]]; then
        log_info "Applying sddm.conf.d from ${ignore_source_dir} -> $buildFolder/archiso/airootfs/etc/sddm.conf.d"
        mkdir -p "$buildFolder/archiso/airootfs/etc"
        rm -rf "$buildFolder/archiso/airootfs/etc/plasmalogin.conf.d"
        cp -a "${ignore_source_dir}/sddm-xfce/sddm.conf.d" "$buildFolder/archiso/airootfs/etc/"
    else
        log_warn "Source directory ${ignore_source_dir}/sddm-xfce/sddm.conf.d not found."
    fi
elif [[ "$desktop" == "plasma" ]]; then
    if [[ -d "${ignore_source_dir}/plasmalogin.conf.d" ]]; then
        log_info "Applying plasmalogin.conf.d from ${ignore_source_dir} -> $buildFolder/archiso/airootfs/etc/plasmalogin.conf.d"
        mkdir -p "$buildFolder/archiso/airootfs/etc"
        rm -rf "$buildFolder/archiso/airootfs/etc/sddm.conf.d"
        cp -a "${ignore_source_dir}/plasmalogin.conf.d" "$buildFolder/archiso/airootfs/etc/"
    else
        log_warn "Source directory ${ignore_source_dir}/plasmalogin.conf.d not found."
    fi
fi

# Display Protocols (xlibre)
if [[ "$xlibre" == "true" ]]; then
    log_info "Replacing Xorg packages with xlibre packages where available..."
    NO_XLIBRE_EQUIV=(
        "xorg-xinit" "xorg-xkill" "xorg-xrandr" "xorg-xrdb" "xorg-xwayland"
        "xorg-xprop" "xorg-xset" "xorg-xmodmap" "xorg-xev" "xorg-xinfo"
        "xorg-xdpyinfo" "xorg-xgamma" "xorg-xsetroot" "xorg-iceauth"
        "xorg-mkfontdir" "xorg-mkfontscale" "xorg-sessreg" "xorg-smproxy"
        "xorg-x11perf" "xorg-xauth" "xorg-xbacklight" "xorg-xcmsdb"
        "xorg-xcursorgen" "xorg-xdg-user-dirs" "xorg-xdriinfo" "xorg-xfs"
        "xorg-xhost" "xorg-xinput" "xorg-xkbcomp" "xorg-xkbevd" "xorg-xkbutils"
        "xorg-xlsatoms" "xorg-xlsclients" "xorg-xmessage" "xorg-xpr"
        "xorg-xprehashprinterlist" "xorg-xrefresh" "xorg-xvinfo" "xorg-xwd"
        "xorg-xwininfo" "xorg-xwud"
    )

    TEMP_PACKAGES="$(mktemp)"
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]] && { echo "$pkg" >> "$TEMP_PACKAGES"; continue; }
        skip=false
        for excluded in "${NO_XLIBRE_EQUIV[@]}"; do
            if [[ "$pkg" == "$excluded" ]]; then
                skip=true
                break
            fi
        done
        [[ "$skip" == false ]] && echo "$pkg" >> "$TEMP_PACKAGES"
    done < "$PACKAGES_FILE"
    mv "$TEMP_PACKAGES" "$PACKAGES_FILE"

    sed -i 's/^xorg-server$/xlibre-xserver/' "$PACKAGES_FILE"
    sed -i 's/xf86-input-/xlibre-input-/g' "$PACKAGES_FILE"
    sed -i 's/xf86-video-/xlibre-video-/g' "$PACKAGES_FILE"
    sed -i 's/^#xlibre-/xlibre-/g' "$PACKAGES_FILE"
    grep -q '^xlibre-xserver-common$' "$PACKAGES_FILE" || echo "xlibre-xserver-common" >> "$PACKAGES_FILE"
fi

# Audio Protocol Configuration
log_info "Configuring audio packages for: $audio"
if [[ "$audio" == "pulseaudio" ]]; then
    sed -i 's/^pipewire-/pulseaudio-/g' "$PACKAGES_FILE"
    sed -i 's/^pipewire-alsa-/pulseaudio-alsa/g' "$PACKAGES_FILE"
    sed -i 's/^#[[:space:]]*pulseaudio-bluetooth/pulseaudio-bluetooth/' "$PACKAGES_FILE"
    sed -i '/^pipewire-pulse/d; /^gst-plugin-pipewire/d' "$PACKAGES_FILE"
elif [[ "$audio" == "pipewire" ]]; then
    sed -i '/^pulseaudio/d; /^pulseaudio-alsa/d; /^pulseaudio-bluetooth/d' "$PACKAGES_FILE"
fi

##################################################################################
# Phase 6: Release Metadata & Profiledef Synchronization
##################################################################################

log_phase "6" "Synchronizing Release Metadata & Profiledef"

date_build="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
log_info "Recording ISO build timestamp: $date_build"

# Update /etc/dev-rel
echo "ISO_BUILD=${date_build}" | sudo tee "$buildFolder/archiso/airootfs/etc/dev-rel" >/dev/null

# Update os-release & xray-release BUILD_ID
if [[ -f "$buildFolder/archiso/airootfs/etc/os-release" ]]; then
    sudo sed -i "s|^BUILD_ID=.*|BUILD_ID=\"${xrayVersion}\"|" "$buildFolder/archiso/airootfs/etc/os-release"
fi

if [[ -f "$buildFolder/archiso/airootfs/etc/xray-release" ]]; then
    sudo sed -i "s|^DISTRIB_RELEASE=.*|DISTRIB_RELEASE=\"${xrayVersion}\"|" "$buildFolder/archiso/airootfs/etc/xray-release"
fi

# Synchronize profiledef.sh
profiledef_path="$buildFolder/archiso/profiledef.sh"
if [[ -f "$profiledef_path" ]]; then
    log_info "Updating $profiledef_path with iso_name='${iso_name}' and iso_version='${xrayVersion}'..."
    sed -i "s|^iso_name=.*|iso_name=\"${iso_name}\"|" "$profiledef_path"
    sed -i "s|^iso_version=.*|iso_version=\"${xrayVersion}\"|" "$profiledef_path"
fi

# Run optional pacman cache clean
clean_cache "$clean_cache_opt"

##################################################################################
# Phase 7: Building the ISO with mkarchiso
##################################################################################

log_phase "7" "Building ISO with mkarchiso"

mkdir -p "$outFolder"
work_dir="$buildFolder/work"
mkdir -p "$work_dir"

log_info "Executing: sudo mkarchiso -v -w '$work_dir' -o '$outFolder' '$buildFolder/archiso/'"
sudo mkarchiso -v -w "$work_dir" -o "$outFolder" "$buildFolder/archiso/"

##################################################################################
# Phase 8: Checksums & Package List Extraction
##################################################################################

log_phase "8" "Generating Checksums & Preserving Manifests"

cd "$outFolder"

# Locate the generated ISO file
generated_iso=""
if [[ -f "$outFolder/$isoLabel" ]]; then
    generated_iso="$isoLabel"
else
    # Fallback to finding the newest ISO in outFolder
    newest_iso="$(find "$outFolder" -maxdepth 1 -name "*.iso" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -n 1 | awk '{print $2}')"
    if [[ -n "$newest_iso" && -f "$newest_iso" ]]; then
        generated_iso="$(basename "$newest_iso")"
        log_warn "Generated ISO filename is '$generated_iso' (expected '$isoLabel')."
    fi
fi

if [[ -n "$generated_iso" && -f "$outFolder/$generated_iso" ]]; then
    log_info "Generating checksums for: $generated_iso"
    
    log_info "Computing sha1sum..."
    sha1sum "$generated_iso" | tee "${generated_iso}.sha1"
    
    log_info "Computing sha256sum..."
    sha256sum "$generated_iso" | tee "${generated_iso}.sha256"
    
    log_info "Computing md5sum..."
    md5sum "$generated_iso" | tee "${generated_iso}.md5"
    
    log_success "Checksum files created."
else
    log_error "Could not find generated ISO in $outFolder!"
fi

# Copy package list manifest
pkglist_found=false
for candidate in \
    "$work_dir/iso/arch/pkglist.x86_64.txt" \
    "$buildFolder/iso/arch/pkglist.x86_64.txt" \
    "$work_dir/x86_64/airootfs/root/pkglist.x86_64.txt"
do
    if [[ -f "$candidate" ]]; then
        log_info "Copying pkglist manifest from $candidate..."
        cp -f "$candidate" "$outFolder/${generated_iso:-$isoLabel}.pkglist.txt"
        pkglist_found=true
        break
    fi
done

if [[ "$pkglist_found" == "false" ]]; then
    # Search recursively in work directory
    candidate="$(find "$buildFolder" -name "pkglist.x86_64.txt" -type f 2>/dev/null | head -n 1)"
    if [[ -n "$candidate" && -f "$candidate" ]]; then
        log_info "Found pkglist manifest at $candidate..."
        cp -f "$candidate" "$outFolder/${generated_iso:-$isoLabel}.pkglist.txt"
    else
        log_warn "pkglist.x86_64.txt not found in build workspace."
    fi
fi

##################################################################################
# Phase 9: Workspace Cleanup & ACL Restoration
##################################################################################

log_phase "9" "Post-Build Cleanup"

remove_buildfolder "$remove_build_opt"

if [[ "$HAS_ACLS" == "true" ]]; then
    restore_acls
fi

log_section "ISO Build Complete!"
log_success "Target Output Directory: $outFolder"
if [[ -n "${generated_iso:-}" && -f "$outFolder/$generated_iso" ]]; then
    log_success "ISO Artifact           : $outFolder/$generated_iso"
fi
echo
