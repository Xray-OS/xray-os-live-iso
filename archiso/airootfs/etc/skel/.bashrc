#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh-themes/vita-atomic.omp.json)"
# [[ $- == *i* ]] && source /usr/share/blesh/ble.sh

####################
# PACMAN ALIASES
####################
# Credits to Leo AI (Brave) for this friendly aliases
# Translated to Bash by Gemini

# --- SYNC OPERATIONS (-S) ---

# Install package(s) from repositories. Example: install-pkg firefox vlc. Man: man pacman -S
install-pkg() { sudo pacman -S "$@"; }

# Refresh package database only. Example: refresh-db. Man: man pacman -Sy
refresh-db() { sudo pacman -Sy "$@"; }

# Upgrade out-of-date packages using existing DB. Example: upgrade-local. Man: man pacman -Su
upgrade-local() { sudo pacman -Su "$@"; }

# Refresh DB and upgrade all packages. Example: full-upgrade. Man: man pacman -Syu
full-upgrade() { sudo pacman -Syu "$@"; }

# Force refresh of all package databases. Example: force-refresh. Man: man pacman -Syy
force-refresh() { sudo pacman -Syy "$@"; }

# Force refresh and full upgrade. Example: force-upgrade. Man: man pacman -Syyu
force-upgrade() { sudo pacman -Syyu "$@"; }

# Search remote repositories for packages. Example: search-remote nvidia. Man: man pacman -Ss
search-remote() { pacman -Ss "$@"; }

# Display detailed info for a remote package. Example: info-remote linux. Man: man pacman -Si
info-remote() { pacman -Si "$@"; }

# List all packages in a repository. Example: list-repo core. Man: man pacman -Sl
list-repo() { pacman -Sl "$@"; }

# List packages belonging to a group. Example: list-groups gnome. Man: man pacman -Sg
list-groups() { pacman -Sg "$@"; }

# Remove uninstalled packages from cache. Example: clean-old. Man: man pacman -Sc
clean-old() { sudo pacman -Sc "$@"; }

# Remove ALL files from cache and DBs. Example: clean-all. Man: man pacman -Scc
clean-all() { sudo pacman -Scc "$@"; }

# Download packages without installing. Example: download-only linux. Man: man pacman -Sw
download-only() { pacman -Sw "$@"; }

# List remote package names only. Example: list-names-remote python. Man: man pacman -Ssq
list-names-remote() { pacman -Ssq "$@"; }


# --- QUERY OPERATIONS (-Q) ---

# List all installed packages with versions. Example: list-installed. Man: man pacman -Q
list-installed() { pacman -Q "$@"; }

# List explicitly installed packages. Example: list-explicit. Man: man pacman -Qe
list-explicit() { pacman -Qe "$@"; }

# List packages installed as dependencies. Example: list-deps. Man: man pacman -Qd
list-deps() { pacman -Qd "$@"; }

# List foreign packages (AUR). Example: list-foreign. Man: man pacman -Qm
list-foreign() { pacman -Qm "$@"; }

# List installed package names only. Example: list-names | grep kde. Man: man pacman -Qq
list-names() { pacman -Qq "$@"; }

# List installed packages with available updates. Example: list-updates. Man: man pacman -Qu
list-updates() { pacman -Qu "$@"; }

# List packages not required by others. Example: list-potential-orphans. Man: man pacman -Qt
list-potential-orphans() { pacman -Qt "$@"; }

# List orphaned packages safe to remove. Example: list-orphans. Man: man pacman -Qtd
list-orphans() { pacman -Qtd "$@"; }

# Search locally installed packages. Example: search-local firefox. Man: man pacman -Qs
search-local() { pacman -Qs "$@"; }

# Display detailed info for an installed package. Example: info-local nginx. Man: man pacman -Qi
info-local() { pacman -Qi "$@"; }

# Display info plus backup file status. Example: info-backup. Man: man pacman -Qii
info-backup() { pacman -Qii "$@"; }

# List files owned by an installed package. Example: list-files vlc. Man: man pacman -Ql
list-files() { pacman -Ql "$@"; }

# Find which package owns a specific file. Example: who-owns /usr/bin/pacman. Man: man pacman -Qo
who-owns() { pacman -Qo "$@"; }

# Check installed package files for existence. Example: check-integrity glibc. Man: man pacman -Qk
check-integrity() { pacman -Qk "$@"; }

# Check integrity (perms, size, timestamps). Example: check-full-integrity glibc. Man: man pacman -Qkk
check-full-integrity() { pacman -Qkk "$@"; }

# View changelog for an installed package. Example: show-changelog linux. Man: man pacman -Qc
show-changelog() { pacman -Qc "$@"; }

# Show groups an installed package belongs to. Example: show-groups firefox. Man: man pacman -Qg
show-groups() { pacman -Qg "$@"; }

# Query a local .pkg.tar.zst file directly. Example: info-file ./package.pkg.tar.zst. Man: man pacman -Qp
info-file() { pacman -Qp "$@"; }


# --- REMOVE OPERATIONS (-R) ---

# Remove package(s), keep deps/config. Example: remove-pkg vlc. Man: man pacman -R
remove-pkg() { sudo pacman -R "$@"; }

# Remove package(s) and unused dependencies. Example: remove-recursive vlc. Man: man pacman -Rs
remove-recursive() { sudo pacman -Rs "$@"; }

# Remove package(s) and config files. Example: remove-config vlc. Man: man pacman -Rn
remove-config() { sudo pacman -Rn "$@"; }

# Remove package, unused deps, and config. Example: remove-complete vlc. Man: man pacman -Rns
remove-complete() { sudo pacman -Rns "$@"; }

# Remove package and anything depending on it. Example: remove-cascade plasma. Man: man pacman -Rc
remove-cascade() { sudo pacman -Rc "$@"; }

# Cascade remove including unused dependencies. Example: remove-cascade-deep plasma. Man: man pacman -Rsc
remove-cascade-deep() { sudo pacman -Rsc "$@"; }

# Remove packages not required by others. Example: remove-unneeded. Man: man pacman -Ru
remove-unneeded() { sudo pacman -Ru "$@"; }


# --- UPGRADE/LOCAL INSTALL (-U) ---

# Install/upgrade from a local file or URL. Example: install-local ./chrome.pkg.tar.zst. Man: man pacman -U
install-local() { sudo pacman -U "$@"; }

# Install local file allowing downgrades. Example: allow-downgrade ./linux-5.15.pkg.tar.zst. Man: man pacman -Uu
allow-downgrade() { sudo pacman -Uu "$@"; }


# --- FILE DATABASE OPERATIONS (-F) ---

# Search which package provides a file. Example: find-file bin/ls. Man: man pacman -F
find-file() { pacman -F "$@"; }

# Refresh the files database. Example: refresh-files. Man: man pacman -Fy
refresh-files() { sudo pacman -Fy "$@"; }

# Search for files using extended regex. Example: find-file-regex "bin/ls$". Man: man pacman -Fx
find-file-regex() { pacman -Fx "$@"; }

# List files in a remote package. Example: list-files-remote core/linux. Man: man pacman -Fl
list-files-remote() { pacman -Fl "$@"; }

# List filenames only. Example: list-files-quiet core/linux. Man: man pacman -Fq
list-files-quiet() { pacman -Fq "$@"; }


# --- DATABASE & DEPTEST (-D, -T) ---

# Check database for internal consistency. Example: check-db. Man: man pacman -Dk
check-db() { sudo pacman -Dk "$@"; }

# Mark package(s) as installed dependencies. Example: mark-as-dep vlc. Man: man pacman -D --asdeps
mark-as-dep() { sudo pacman -D --asdeps "$@"; }

# Mark package(s) as explicitly installed. Example: mark-as-explicit vlc. Man: man pacman -D --asexplicit
mark-as-explicit() { sudo pacman -D --asexplicit "$@"; }

# Check if specified dependencies are satisfied. Example: check-deps vlc gtk3. Man: man pacman -T
check-deps() { pacman -T "$@"; }

#######################
# OTHER USEFUL ALISES
#######################
alias clean-db='sudo rm -rf /var/lib/pacman/db.lck'

#######################
# FETC
#######################
fastfetch
