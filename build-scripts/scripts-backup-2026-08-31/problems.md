./build-the-iso.sh
tput: unknown terminfo capability '='
tput: unknown terminfo capability '='
tput: unknown terminfo capability '='
##################################################################
First run the version script
##################################################################

################################################################## 
Message (Credits to Erik from Angel G.)

Do not run this file as root or add sudo in front
Run this script as a user

You can add a personal local repo to the iso build if you want
https://www.youtube.com/watch?v=TqFuLknCsUE

ERICK DUBOIS STUFF:
You can learn to create your own iso on the basis of Kiro (Yes I used Kiro at the beginning as a template)
That project is called Buildra
https://youtu.be/3jdKH6bLgUE
https://youtu.be/mH52To8DvlI
################################################################## 


################################################################## 
Message

This script may cause issues on a Btrfs filesystem
Make backups before continuing
Continue at your own risk

Press CTRL + C to stop the script now

Continuing in 0 seconds...  

################################################################## 
Phase 1 : 
- Setting General parameters
################################################################## 

################################################################## 
Chaotic keyring and mirrorlist are both installed
################################################################## 

################################################################## 
Phase 1.5 :
- Backing up home directory ACLs
################################################################## 

No default ACLs found in home directory - skipping ACL management


################################################################## 
Phase 2 :
- Checking if archiso/grub is installed
- Saving current archiso version to readme
################################################################## 

archiso is already installed

grub is already installed

################################################################## 
Overview
################################################################## 
Building the desktop                   : plasma
Building version                       : v26.02.16.01
Iso label                              : vita-v26.02.16.01-x86_64.iso
Build folder                           : /home/retroTech/vita-build
Out folder                             : /home/retroTech/vita-Out
################################################################## 


################################################################## 
Phase 3 :
- Deleting the build folder if one exists
- Copying the Archiso folder to build folder
################################################################## 

##################################################################
No build folder found. Nothing to delete.
##################################################################

Copying the Archiso folder to build work

################################################################## 
Phase 4 :
- Importing xlibre key if enabled
################################################################## 

################################################################## 
Phase 5 :
- Getting the latest Vita-OS mirrorlists in /etc/pacman.d/
- Removing the old packages.x86_64 file from build folder
- Copying the new packages.x86_64 file to the build folder
################################################################## 

Deleting any possible outdated mirrorlists in /etc/pacman.d

Getting the lastest mirrorlists in /etc/pacman.d

--2026-07-19 00:48:49--  https://gitlab.com/vita-linux/vita-mirrorlists/-/raw/main/etc/pacman.d/mirrorlist
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving gitlab.com (gitlab.com)... 172.65.251.78, 2606:4700:90:0:f22e:fbec:5bed:a9b9
Connecting to gitlab.com (gitlab.com)|172.65.251.78|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 23018 (22K) [text/plain]
Saving to: ‘/home/retroTech/vita-build/archiso/airootfs/etc/pacman.d/mirrorlist’

/home/retroTech/vita-build/ar 100%[===============================================>]  22,48K  --.-KB/s    in 0,003s  

2026-07-19 00:48:49 (8,32 MB/s) - ‘/home/retroTech/vita-build/archiso/airootfs/etc/pacman.d/mirrorlist’ saved [23018/23018]

--2026-07-19 00:48:49--  https://gitlab.com/vita-linux/vita-generic-mirrorlists/-/raw/main/etc/pacman.d/vita-generic-repos
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving gitlab.com (gitlab.com)... 172.65.251.78, 2606:4700:90:0:f22e:fbec:5bed:a9b9
Connecting to gitlab.com (gitlab.com)|172.65.251.78|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 62 [text/plain]
Saving to: ‘/home/retroTech/vita-build/archiso/airootfs/etc/pacman.d/vita-generic-repos’

/home/retroTech/vita-build/ar 100%[===============================================>]      62  --.-KB/s    in 0s      

2026-07-19 00:48:50 (237 MB/s) - ‘/home/retroTech/vita-build/archiso/airootfs/etc/pacman.d/vita-generic-repos’ saved [62/62]

Deleting any possible outdated plymouth config in /etc/plymouth

Getting the lastest plymouth config in /etc/plymouth

--2026-07-19 00:48:50--  https://gitlab.com/vita-linux/vita-plymouth-config/-/raw/main/etc/plymouth/plymouthd.conf
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving gitlab.com (gitlab.com)... 172.65.251.78, 2606:4700:90:0:f22e:fbec:5bed:a9b9
Connecting to gitlab.com (gitlab.com)|172.65.251.78|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 27 [text/plain]
Saving to: ‘/home/retroTech/vita-build/archiso/airootfs/etc/plymouth/plymouthd.conf’

/home/retroTech/vita-build/ar 100%[===============================================>]      27  --.-KB/s    in 0s      

2026-07-19 00:48:50 (139 MB/s) - ‘/home/retroTech/vita-build/archiso/airootfs/etc/plymouth/plymouthd.conf’ saved [27/27]

Removing the old packages.x86_64 file from build folder

Copying the new packages.x86_64 file to the build folder

################################################################## 
Commenting out Xfce4 packages for Plasma build
################################################################## 
################################################################## 
Configuring display manager: plasma-login-manager
################################################################## 
[sudo] password for retroTech: 
################################################################## 
Commenting out specific pulseaudio audio pkgs
################################################################## 
################################################################## 
Converting 'vita-installation-config' to 'vita-installation-config-calamares'
################################################################## 
==> WARNING: /mnt is not a mountpoint. This may have undesirable side effects.
mount: /mnt/proc: mount point does not exist.
       dmesg(1) may have more information after failed mount system call.
==> ERROR: failed to setup chroot /mnt

################################################################## 
Phase 6 : 
- Adding time to /etc/dev-rel
- Clean cache
################################################################## 

Adding time to /etc/dev-rel
Iso build on : dom 19 jul 2026 00:49:21 -04
sed: can't read /home/retroTech/vita-build/archiso/airootfs/etc/dev-rel: No such file or directory

Skipping cache cleaning.

################################################################## 
Phase 7 :
- Building the iso - this can take a while - be patient
################################################################## 

[mkarchiso] INFO: Validating options...
[mkarchiso] INFO: Done!
[mkarchiso] INFO: mkarchiso configuration settings
[mkarchiso] INFO:              Architecture:   x86_64
[mkarchiso] INFO:         Working directory:   /home/retroTech/vita-build
[mkarchiso] INFO:    Installation directory:   arch
[mkarchiso] INFO:                Build date:   2026-07-19T00:49-0400
[mkarchiso] INFO:          Output directory:   /home/retroTech/vita-Out
[mkarchiso] INFO:        Current build mode:   iso
[mkarchiso] INFO:               Build modes:   iso
[mkarchiso] INFO:                   GPG key:   None
[mkarchiso] INFO:                GPG signer:   None
[mkarchiso] INFO: Code signing certificates:   None
[mkarchiso] INFO:                   Profile:   /home/retroTech/vita-build/archiso
[mkarchiso] INFO: Pacman configuration file:   /home/retroTech/vita-build/archiso/pacman.conf
[mkarchiso] INFO:           Image file name:   Vita-OS-2026.07.19-x86_64.iso
[mkarchiso] INFO:          ISO volume label:   VT_202607
[mkarchiso] INFO:             ISO publisher:   Vita-OS <https://gitlab.com/vita-linux>
[mkarchiso] INFO:           ISO application:   Vita-OS Live/Rescue CD
[mkarchiso] INFO:                Boot modes:   bios.syslinux uefi.grub
[mkarchiso] INFO:             Packages File:   /home/retroTech/vita-build/archiso/packages.x86_64
[mkarchiso] INFO:                  Packages:   amd-ucode arch-install-scripts b43-fwcutter base bcachefs-tools brltty broadcom-wl btrfs-progs clonezilla cloud-init cryptsetup darkhttpd ddrescue dhcpcd diffutils dmidecode dmraid dosfstools e2fsprogs edk2-shell efibootmgr exfatprogs f2fs-tools fatresize fsarchiver gpart gpm gptfdisk grml-zsh-config grub hdparm hyperv intel-ucode irssi iw jfsutils kitty-terminfo ldns less lftp libfido2 libusb-compat linux-atm linux-firmware linux-firmware-marvell lsscsi lvm2 lynx man-db man-pages mc mdadm memtest86+ memtest86+-efi mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils mtools nano nbd ndisc6 nfs-utils nilfs-utils nmap ntfs-3g nvme-cli open-iscsi open-vm-tools openssh partclone parted partimage pcsclite ppp pptpclient pv qemu-guest-agent refind reflector rsync rxvt-unicode-terminfo screen sdparm sg3_utils smartmontools sof-firmware squashfs-tools sudo syslinux systemd-liberated-git systemd-liberated-libs-git systemd-liberated-resolvconf-git systemd-liberated-sysvcompat-git systemd-liberated-tests-git systemd-liberated-ukify-git tcpdump terminus-font testdisk tmux tpm2-tss udftools usbmuxd usbutils vim virtualbox-guest-utils-nox wireless_tools wvdial zsh vita-installation-config vita-settings vita-terminal-config vita-fish-settings vita-alacritty-config vita-ghostty-config vita-wallpapers calamares vita-calamares-config os-prober make libadwaita ntp plasma vita-kde-settings dolphin dolphin-plugins kio-admin ffmpegthumbs kdegraphics-thumbnailers ark kcalc kdeconnect kdenetwork-filesharing gwenview spectacle kate kamoso partitionmanager plasma-x11-session okular filelight kwalletmanager libappindicator kwin-x11 kwayland-integration konsole alacritty plasma-login-manager pipewire pipewire-pulse pipewire-alsa gst-plugin-pipewire pavucontrol alsa-firmware alsa-plugins alsa-lib alsa-utils gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gstreamer gst-plugin-va libdvdcss libde265 snapper snapper-support snapper-tools btrfs-assistant btrfsmaintenance yay pamac-aur bluez bluez-libs bluez-utils brave-origin-bin git-lfs git base-devel meld cmake gcc rustup wget curl yad sublime-text-4 archlinux-tools linux-vita linux-vita-headers fish oh-my-posh-bin vitafetch bash bash-completion zsh-completions zsh-autosuggestions zsh-syntax-highlighting vita-hack-fonts noto-fonts-emoji ttf-meslo-nerd ttf-firacode-nerd ttf-fira-code ttf-meslo-nerd-font-powerlevel10k adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-cn-fonts adobe-source-sans-fonts awesome-terminal-fonts noto-fonts ttf-dejavu ttf-droid ttf-hack ttf-roboto ttf-roboto-mono ttf-ubuntu-font-family firewalld firewall-applet avahi mobile-broadband-provider-info bind dnsmasq ethtool iwd modemmanager net-tools netctl networkmanager network-manager-applet networkmanager-openconnect networkmanager-openvpn nss-mdns openconnect openvpn vpnc whois wireless-regdb wpa_supplicant xl2tpd vita-gpu-scripts xorg-server xorg-xinit xorg-xkill xorg-xrandr xorg-xrdb xf86-input-elographics xf86-input-evdev xf86-input-vmmouse xf86-input-wacom xf86-video-amdgpu xf86-video-fbdev xorg-xwayland qt6-wayland wayland cups cups-filters cups-pdf ghostscript gsfonts system-config-printer tumbler ffmpegthumbnailer freetype2 libgsf libopenraw poppler-glib poppler-qt5 mkinitcpio-openswap haruna audacious dotnet-sdk clang chaotic-mirrorlist chaotic-keyring vita-keyring unace unrar unzip mintstick font-manager simple-scan plymouth variety lsb-release grub-btrfs downgrade packagekit-qt6 xfsprogs xdg-user-dirs-gtk xdg-utils nohang ananicy-cpp vita-os-ananicy-rules vita-kde-dark vita7z-kde-theme vita-liquid-boot-animation dracula-icons-git bibata-cursor-theme capitaine-cursors vimix-cursors apple_cursor vita-ui-elements
[mkarchiso] INFO: Copying custom pacman.conf to work directory...
[mkarchiso] INFO: Using pacman CacheDir: /var/cache/pacman/pkg/ 
[mkarchiso] INFO: Copying custom airootfs files...
[mkarchiso] INFO: Done!
[mkarchiso] INFO: Installing packages to '/home/retroTech/vita-build/x86_64/airootfs/'...
==> Creating install root at /home/retroTech/vita-build/x86_64/airootfs
==> Installing packages to /home/retroTech/vita-build/x86_64/airootfs
:: Synchronizing package databases...
 core                                      126.0 KiB   101 KiB/s 00:01 [----------------------------------------] 100%
 extra                                       8.3 MiB  2.93 MiB/s 00:03 [----------------------------------------] 100%
 multilib                                  126.7 KiB   101 KiB/s 00:01 [----------------------------------------] 100%
 vita-extra                                  2.1 KiB  5.34 KiB/s 00:00 [----------------------------------------] 100%
 vita-core                                   9.2 KiB  25.1 KiB/s 00:00 [----------------------------------------] 100%
 chaotic-aur                               662.3 KiB   337 KiB/s 00:02 [----------------------------------------] 100%
 kiro_repo                                1630.0   B  7.44 KiB/s 00:00 [----------------------------------------] 100%
 nemesis_repo                               63.9 KiB   260 KiB/s 00:00 [----------------------------------------] 100%
:: There are 70 members in group plasma:
:: Repository extra
   1) aurorae  2) bluedevil  3) breeze  4) breeze-cursors  5) breeze-gtk  6) breeze-plymouth  7) discover  8) drkonqi
   9) flatpak-kcm  10) kactivitymanagerd  11) kde-cli-tools  12) kde-gtk-config  13) kdecoration
   14) kdeplasma-addons  15) kgamma  16) kglobalacceld  17) kinfocenter  18) kmenuedit  19) knighttime  20) kpipewire
   21) krdp  22) kscreen  23) kscreenlocker  24) ksshaskpass  25) ksystemstats  26) kwallet-pam  27) kwayland
   28) kwin  29) kwin-x11  30) kwrited  31) layer-shell-qt  32) libkscreen  33) libksysguard  34) libplasma
   35) milou  36) ocean-sound-theme  37) oxygen  38) oxygen-cursors  39) oxygen-sounds  40) plasma-activities
   41) plasma-activities-stats  42) plasma-bigscreen  43) plasma-browser-integration  44) plasma-desktop
   45) plasma-disks  46) plasma-firewall  47) plasma-integration  48) plasma-keyboard  49) plasma-login-manager
   50) plasma-nm  51) plasma-pa  52) plasma-sdk  53) plasma-systemmonitor  54) plasma-thunderbolt  55) plasma-vault
   56) plasma-welcome  57) plasma-workspace  58) plasma-workspace-wallpapers  59) plasma5support  60) plymouth-kcm
   61) polkit-kde-agent  62) powerdevil  63) print-manager  64) qqc2-breeze-style  65) sddm-kcm  66) spectacle
   67) systemsettings  68) union  69) wacomtablet  70) xdg-desktop-portal-kde

Enter a selection (default=all): 
:: There are 4 members in group archlinux-tools:
:: Repository extra
   1) arch-rebuild-order  2) arch-repro-status  3) arch-signoff  4) pacquery

Enter a selection (default=all): 
resolving dependencies...
:: There are 2 providers available for libxtables.so=12-64:
:: Repository core
   1) iptables  2) iptables-legacy

Enter a number (default=1): 
:: There are 2 providers available for libgl:
:: Repository extra
   1) libglvnd
:: Repository chaotic-aur
   2) nvidia-340xx-utils

Enter a number (default=1): 
:: There are 2 providers available for qt6-multimedia-backend:
:: Repository extra
   1) qt6-multimedia-ffmpeg  2) qt6-multimedia-gstreamer

Enter a number (default=1): 
:: There are 2 providers available for jack:
:: Repository extra
   1) jack2  2) pipewire-jack

Enter a number (default=1): 
:: There are 128 providers available for tessdata:
:: Repository extra
   1) tesseract-data-afr  2) tesseract-data-amh  3) tesseract-data-ara  4) tesseract-data-asm  5) tesseract-data-aze
   6) tesseract-data-aze_cyrl  7) tesseract-data-bel  8) tesseract-data-ben  9) tesseract-data-bod
   10) tesseract-data-bos  11) tesseract-data-bre  12) tesseract-data-bul  13) tesseract-data-cat
   14) tesseract-data-ceb  15) tesseract-data-ces  16) tesseract-data-chi_sim  17) tesseract-data-chi_sim_vert
   18) tesseract-data-chi_tra  19) tesseract-data-chi_tra_vert  20) tesseract-data-chr  21) tesseract-data-cos
   22) tesseract-data-cym  23) tesseract-data-dan  24) tesseract-data-dan_frak  25) tesseract-data-deu
   26) tesseract-data-deu_frak  27) tesseract-data-div  28) tesseract-data-dzo  29) tesseract-data-ell
   30) tesseract-data-eng  31) tesseract-data-enm  32) tesseract-data-epo  33) tesseract-data-equ
   34) tesseract-data-est  35) tesseract-data-eus  36) tesseract-data-fao  37) tesseract-data-fas
   38) tesseract-data-fil  39) tesseract-data-fin  40) tesseract-data-fra  41) tesseract-data-frk
   42) tesseract-data-frm  43) tesseract-data-fry  44) tesseract-data-gla  45) tesseract-data-gle
   46) tesseract-data-glg  47) tesseract-data-grc  48) tesseract-data-guj  49) tesseract-data-hat
   50) tesseract-data-heb  51) tesseract-data-hin  52) tesseract-data-hrv  53) tesseract-data-hun
   54) tesseract-data-hye  55) tesseract-data-iku  56) tesseract-data-ind  57) tesseract-data-isl
   58) tesseract-data-ita  59) tesseract-data-ita_old  60) tesseract-data-jav  61) tesseract-data-jpn
   62) tesseract-data-jpn_vert  63) tesseract-data-kan  64) tesseract-data-kat  65) tesseract-data-kat_old
   66) tesseract-data-kaz  67) tesseract-data-khm  68) tesseract-data-kir  69) tesseract-data-kmr
   70) tesseract-data-kor  71) tesseract-data-kor_vert  72) tesseract-data-lao  73) tesseract-data-lat
   74) tesseract-data-lav  75) tesseract-data-lit  76) tesseract-data-ltz  77) tesseract-data-mal
   78) tesseract-data-mar  79) tesseract-data-mkd  80) tesseract-data-mlt  81) tesseract-data-mon
   82) tesseract-data-mri  83) tesseract-data-msa  84) tesseract-data-mya  85) tesseract-data-nep
   86) tesseract-data-nld  87) tesseract-data-nor  88) tesseract-data-oci  89) tesseract-data-ori
   90) tesseract-data-pan  91) tesseract-data-pol  92) tesseract-data-por  93) tesseract-data-pus
   94) tesseract-data-que  95) tesseract-data-ron  96) tesseract-data-rus  97) tesseract-data-san
   98) tesseract-data-sin  99) tesseract-data-slk  100) tesseract-data-slk_frak  101) tesseract-data-slv
   102) tesseract-data-snd  103) tesseract-data-spa  104) tesseract-data-spa_old  105) tesseract-data-sqi
   106) tesseract-data-srp  107) tesseract-data-srp_latn  108) tesseract-data-sun  109) tesseract-data-swa
   110) tesseract-data-swe  111) tesseract-data-syr  112) tesseract-data-tam  113) tesseract-data-tat
   114) tesseract-data-tel  115) tesseract-data-tgk  116) tesseract-data-tgl  117) tesseract-data-tha
   118) tesseract-data-tir  119) tesseract-data-ton  120) tesseract-data-tur  121) tesseract-data-uig
   122) tesseract-data-ukr  123) tesseract-data-urd  124) tesseract-data-uzb  125) tesseract-data-uzb_cyrl
   126) tesseract-data-vie  127) tesseract-data-yid  128) tesseract-data-yor

Enter a number (default=1): 
:: There are 3 providers available for phonon-qt6-backend:
:: Repository extra
   1) phonon-qt6-vlc
:: Repository chaotic-aur
   2) phonon-qt6-gstreamer-git  3) phonon-qt6-mpv

Enter a number (default=1): 
looking for conflicting packages...

Package (1299)                                 New Version                  Net Change

extra/a52dec                                   0.8.0-3                        0.13 MiB
extra/aalib                                    1.4rc5-19                      0.28 MiB
extra/abseil-cpp                               20260526.0-2                   7.06 MiB
extra/accountsservice                          26.27.3-1                      0.95 MiB
core/acl                                       2.4.0-1                        0.34 MiB
extra/adwaita-cursors                          50.0-1                        11.41 MiB
extra/adwaita-fonts                            50.0-1                         7.29 MiB
extra/adwaita-icon-theme                       50.0-1                         1.19 MiB
extra/adwaita-icon-theme-legacy                46.2-3                         2.23 MiB
extra/aha                                      0.5.1-3                        0.03 MiB
extra/alsa-card-profiles                       1:1.6.8-1                      0.19 MiB
extra/alsa-topology-conf                       1.2.5.1-4                      0.33 MiB
extra/alsa-ucm-conf                            1.2.16.1-1                     0.68 MiB
extra/aom                                      3.14.1-1                       9.25 MiB
extra/appstream                                1.1.3-1                       17.49 MiB
extra/appstream-glib                           0.8.3-4                        3.66 MiB
extra/appstream-qt                             1.1.3-1                        0.56 MiB
extra/archlinux-appstream-data                 20260606-1                    22.50 MiB
core/archlinux-keyring                         20260707.1-1                   1.73 MiB
extra/at-spi2-core                             2.60.5-1                       4.04 MiB
extra/attica                                   6.28.0-1                       0.84 MiB
core/attr                                      2.6.0-1                        0.23 MiB
extra/audacious-plugins                        4.6.1-2                        6.98 MiB
core/audit                                     4.1.4-2                        1.01 MiB
core/autoconf                                  2.73-1                         2.25 MiB
core/automake                                  1.18.1-1                       1.64 MiB
extra/baloo                                    6.28.0-1                       2.53 MiB
extra/baloo-widgets                            26.04.3-1                      0.50 MiB
extra/bc                                       1.08.2-1                       0.17 MiB
core/binutils                                  2.46.1+r3+g046eeeef4721-1     44.00 MiB
core/bison                                     3.8.2-8                        2.52 MiB
extra/blas                                     3.12.1-2                       0.74 MiB
extra/bluez-qt                                 6.28.0-1                       1.34 MiB
extra/bolt                                     0.9.11-1                       0.42 MiB
extra/boost-libs                               1.91.0-1                      48.98 MiB
extra/breeze-icons                             6.28.0-1                      82.78 MiB
core/brotli                                    1.2.0-1                        1.03 MiB
extra/bubblewrap                               0.11.2-1                       0.09 MiB
core/bzip2                                     1.0.8-6                        0.14 MiB
core/ca-certificates                           20240618-1                     0.00 MiB
core/ca-certificates-mozilla                   3.125-1                        0.99 MiB
core/ca-certificates-utils                     20240618-1                     0.01 MiB
extra/cairo                                    1.18.4-1                       1.59 MiB
extra/cairomm-1.16                             1.18.1-1                       0.41 MiB
extra/cblas                                    3.12.1-2                       0.34 MiB
extra/cdparanoia                               10.2-10                        0.19 MiB
extra/cfitsio                                  1:4.6.4-1                      2.11 MiB
extra/chromaprint                              1.6.0-3                        0.13 MiB
extra/cifs-utils                               7.5-1                          0.28 MiB
extra/clinfo                                   3.0.25.02.14-1                 0.13 MiB
extra/colord                                   1.4.8-1                        5.12 MiB
extra/colord-sane                              1.4.8-1                        0.03 MiB
extra/compiler-rt                              22.1.8-1                      54.94 MiB
extra/composefs                                1.0.8-1                        0.15 MiB
extra/confuse                                  3.3-5                          0.14 MiB
extra/convertlit                               1.8-13                         0.11 MiB
core/coreutils                                 9.11-2                        17.47 MiB
extra/cpio                                     2.15-3                         0.98 MiB
extra/cppdap                                   1.58.0-3                       1.61 MiB
core/cracklib                                  2.10.3-1                       0.91 MiB
extra/cxx-rust-cssparser                       1.0.0-1                        3.86 MiB
extra/dav1d                                    1.5.4-1                        1.85 MiB
core/db5.3                                     5.3.28-7                       6.48 MiB
core/dbus                                      1.16.2-1                       0.98 MiB
core/dbus-broker                               37-3                           0.35 MiB
core/dbus-broker-units                         37-3                           0.00 MiB
extra/dbus-glib                                0.114-1                        0.75 MiB
core/dbus-units                                37-3                           0.00 MiB
extra/dconf                                    0.49.0-1                       0.45 MiB
extra/ddcutil                                  2.2.7-1                        2.50 MiB
core/debugedit                                 5.3-1                          0.13 MiB
extra/default-cursors                          3-1                            0.00 MiB
extra/desktop-file-utils                       0.28-1                         0.18 MiB
core/device-mapper                             2.03.41-1                      0.81 MiB
core/ding-libs                                 0.7.0-1                        0.28 MiB
extra/discount                                 3.0.1.3-1                      0.19 MiB
extra/djvulibre                                3.5.30.1-1                     3.13 MiB
core/dnssec-anchors                            20250524-1                     0.00 MiB
extra/dotnet-host                              10.0.10.sdk110-1               0.48 MiB
extra/dotnet-runtime                           10.0.10.sdk110-1              73.58 MiB
extra/dotnet-targeting-pack                    10.0.10.sdk110-1              50.87 MiB
extra/double-conversion                        3.4.0-1                        0.19 MiB
extra/drbl                                     5.9.11-1                       6.57 MiB
extra/duktape                                  2.7.0-7                        0.78 MiB
extra/ebook-tools                              0.2.2-9                        0.08 MiB
extra/ecryptfs-utils                           111-9                          0.52 MiB
extra/editorconfig-core-c                      0.12.11-1                      0.11 MiB
core/efivar                                    39-2                           0.53 MiB
core/elfutils                                  0.195-1                        3.63 MiB
extra/ell                                      0.83-1                         0.65 MiB
extra/enchant                                  2.8.15-2                       0.27 MiB
extra/espeak-ng                                1.52.0-1                      18.05 MiB
extra/exiv2                                    0.28.8-2                      15.52 MiB
core/expat                                     2.8.2-1                        0.49 MiB
extra/faac                                     1.50-1                         0.16 MiB
extra/faad2                                    2.11.2-1                       0.64 MiB
core/fakeroot                                  1:1.37.2-2                     0.14 MiB
extra/ffmpeg                                   2:8.1.2-10                    47.98 MiB
extra/fftw                                     3.3.11-1                       8.83 MiB
core/file                                      5.48-1                        10.53 MiB
core/filesystem                                2025.10.12-1                   0.02 MiB
core/findutils                                 4.11.0-1                       1.87 MiB
extra/firewall-config                          2.5.0-1                        1.03 MiB
extra/flac                                     1.5.0-1                        1.14 MiB
extra/flatpak                                  1:1.18.0-1                     8.09 MiB
core/flex                                      2.6.4-6                        0.84 MiB
extra/fluidsynth                               2.5.6-1                        0.76 MiB
extra/fmt                                      12.2.0-1                       0.74 MiB
extra/fontconfig                               2:2.18.2-1                     1.32 MiB
extra/frameworkintegration                     6.28.0-1                       0.25 MiB
extra/freeglut                                 3.8.0-1                        0.41 MiB
extra/freerdp                                  2:3.30.0-1                     9.29 MiB
extra/fribidi                                  1.0.16-2                       0.24 MiB
extra/fuse-common                              3.18.2-1                       0.00 MiB
extra/fuse2                                    2.9.9-5                        0.44 MiB
extra/fuse3                                    3.18.2-1                       0.48 MiB
extra/fzf                                      0.74.0-1                       4.87 MiB
core/gawk                                      5.4.1-1                        4.09 MiB
core/gc                                        8.2.12-1                       0.76 MiB
core/gcc-libs                                  16.1.1+r346+g4e03491b401d-4    0.00 MiB
extra/gcr                                      3.41.2-2                       3.84 MiB
extra/gcr-4                                    4.4.0.1-1                      3.00 MiB
extra/gd                                       2.3.3-9                        0.64 MiB
extra/gdb                                      17.2-1                        31.93 MiB
extra/gdb-common                               17.2-1                         1.13 MiB
core/gdbm                                      1.26-2                         0.72 MiB
extra/gdk-pixbuf2                              2.44.7-1                       3.00 MiB
core/gettext                                   1.0-2                         20.79 MiB
extra/giflib                                   6.1.3-1                        0.33 MiB
extra/glib-networking                          1:2.80.1-1                     0.65 MiB
core/glib2                                     2.88.2-1                      38.00 MiB
core/glibc                                     2.43+r37+gfdf10644d6ee-1      50.33 MiB
extra/glibmm-2.68                              2.88.1-1                       6.27 MiB
extra/glslang                                  1:1.4.350.1-1                 13.52 MiB
extra/glu                                      9.0.3-3                        0.37 MiB
extra/glycin                                   2.1.5-2                       17.49 MiB
core/gmp                                       6.3.0-3                        1.01 MiB
core/gnulib-l10n                               20241231-1                     0.61 MiB
core/gnupg                                     2.4.9-2                       10.41 MiB
core/gnutls                                    3.8.13-2                       8.11 MiB
extra/gobject-introspection-runtime            1.86.0-2                       0.15 MiB
extra/gocryptfs                                2.6.1-1                        8.01 MiB
extra/gperftools                               2.18.1-1                       2.01 MiB
core/gpgme                                     2.1.2-1                        0.77 MiB
extra/gpgmepp                                  2.1.0-1                        0.59 MiB
extra/graphene                                 1.10.8-2                       0.98 MiB
extra/graphite                                 1:1.3.15-1                     0.20 MiB
core/grep                                      3.12-2                         0.88 MiB
core/groff                                     1.24.1-1                       9.01 MiB
extra/gsettings-desktop-schemas                50.1-1                         6.08 MiB
extra/gsettings-system-schemas                 50.1-1                         0.02 MiB
extra/gsm                                      1.0.24-1                       0.10 MiB
extra/gspell                                   1.14.4-1                       0.45 MiB
extra/gssdp                                    1.6.6-1                        0.24 MiB
core/gssproxy                                  0.9.2-3                        0.24 MiB
extra/gst-plugin-qml6                          1.28.5-2                       0.21 MiB
extra/gst-plugins-bad-libs                     1.28.5-2                      14.73 MiB
extra/gst-plugins-base-libs                    1.28.5-2                      12.84 MiB
extra/gtest                                    1.17.0-2                       1.63 MiB
extra/gtk-update-icon-cache                    1:4.22.4-1                     0.04 MiB
extra/gtk3                                     1:3.24.52-1                   52.96 MiB
extra/gtk4                                     1:4.22.4-1                    51.53 MiB
extra/gtkmm-4.0                                4.22.0-2                       9.98 MiB
extra/gtksourceview3                           1:3.24.11+r30+gd880929f-1      3.91 MiB
extra/gtksourceview4                           4.8.4-2                        7.39 MiB
core/guile                                     3.0.11-1                      54.49 MiB
extra/gumbo-parser                             0.13.2-1                       0.37 MiB
extra/gupnp                                    1:1.6.10-1                     0.70 MiB
extra/gupnp-igd                                1.6.0-2                        0.11 MiB
core/gzip                                      1.14-2                         0.16 MiB
extra/harfbuzz                                 14.2.1-1                       4.77 MiB
extra/harfbuzz-icu                             14.2.1-1                       0.02 MiB
extra/hicolor-icon-theme                       0.18-1                         0.05 MiB
extra/hidapi                                   0.15.0-1                       0.13 MiB
extra/highway                                  1.4.0-1                       10.04 MiB
extra/hunspell                                 1.7.3-1                        1.63 MiB
core/hwdata                                    0.409-1                        9.99 MiB
extra/hwloc                                    2.14.0-1                       1.71 MiB
extra/hyphen                                   2.8.9-1                        0.04 MiB
extra/i2c-tools                                4.4-4                          0.32 MiB
core/iana-etc                                  20260530-1                     4.02 MiB
core/icu                                       78.3-1                        43.23 MiB
extra/iio-sensor-proxy                         3.9-1                          0.12 MiB
extra/ijs                                      0.35-7                         0.12 MiB
extra/imagemagick                              7.1.2.27-1                    24.36 MiB
extra/imath                                    3.2.2-6                       26.55 MiB
extra/imlib2                                   1.12.6-2                       1.48 MiB
core/iproute2                                  7.1.0-1                        3.08 MiB
core/iptables                                  1:1.8.13-1                     2.35 MiB
core/iputils                                   20250605-1                     0.65 MiB
extra/iso-codes                                4.20.1-1                      22.30 MiB
extra/jack2                                    1.9.22-2                       1.84 MiB
core/jansson                                   2.15.0-1                       0.27 MiB
extra/jasper                                   4.2.9-1                        0.66 MiB
extra/jbig2dec                                 0.20-2                         0.15 MiB
extra/jbigkit                                  2.1-8                          0.16 MiB
extra/jemalloc                                 1:5.3.1-2                      1.26 MiB
extra/jq                                       1.8.2-1                        0.47 MiB
core/json-c                                    0.19-1                         0.19 MiB
extra/json-glib                                1.10.8-1                       1.01 MiB
extra/jsoncpp                                  1.9.6-3                        0.77 MiB
extra/kaccounts-integration                    26.04.3-1                      0.61 MiB
extra/karchive                                 6.28.0-1                       0.82 MiB
extra/kauth                                    6.28.0-1                       0.43 MiB
core/kbd                                       2.10.0-1                       3.29 MiB
extra/kbookmarks                               6.28.0-1                       0.52 MiB
extra/kcmutils                                 6.28.0-1                       1.26 MiB
extra/kcodecs                                  6.28.0-1                       0.67 MiB
extra/kcolorpicker                             0.3.1-6                        0.08 MiB
extra/kcolorscheme                             6.28.0-1                       0.16 MiB
extra/kcompletion                              6.28.0-1                       0.40 MiB
extra/kconfig                                  6.28.0-1                       2.32 MiB
extra/kconfigwidgets                           6.28.0-1                       1.38 MiB
extra/kcontacts                                1:6.28.0-1                     1.42 MiB
extra/kcoreaddons                              6.28.0-1                       3.14 MiB
extra/kcrash                                   6.28.0-1                       0.07 MiB
extra/kdbusaddons                              6.28.0-1                       0.24 MiB
extra/kdeclarative                             6.28.0-1                       0.77 MiB
extra/kded                                     6.28.0-1                       0.12 MiB
extra/kdegraphics-mobipocket                   26.04.3-1                      0.05 MiB
extra/kdesu                                    6.28.0-1                       0.24 MiB
extra/kdnssd                                   6.28.0-1                       0.27 MiB
extra/kdsingleapplication                      1.2.1-1                        0.08 MiB
extra/kdsoap                                   2.3.0-1                        1.34 MiB
extra/kdsoap-ws-discovery-client               0.4.0-3                        0.73 MiB
core/keyutils                                  1.6.3-4                        0.20 MiB
extra/kfilemetadata                            6.28.0-1                       1.38 MiB
extra/kglobalaccel                             6.28.0-1                       0.30 MiB
extra/kguiaddons                               6.28.0-1                       0.76 MiB
extra/kholidays                                1:6.28.0-1                     1.08 MiB
extra/ki18n                                    6.28.0-1                      17.83 MiB
extra/kiconthemes                              6.28.0-1                       0.60 MiB
extra/kidletime                                6.28.0-1                       0.21 MiB
extra/kimageannotator                          0.7.2-2                        1.69 MiB
extra/kimageformats                            6.28.0-1                       2.91 MiB
extra/kio                                      6.28.0-1                      19.37 MiB
extra/kio-extras                               26.04.3-1                      7.34 MiB
extra/kio-fuse                                 5.1.1-2                        0.18 MiB
extra/kirigami                                 6.28.0-1                       6.05 MiB
extra/kirigami-addons                          1.13.0-1                       6.94 MiB
extra/kitemmodels                              6.28.0-1                       0.54 MiB
extra/kitemviews                               6.28.0-1                       0.39 MiB
extra/kjobwidgets                              6.28.0-1                       0.73 MiB
core/kmod                                      34.2-1                         0.33 MiB
extra/knewstuff                                6.28.0-1                       3.02 MiB
extra/knotifications                           6.28.0-1                       0.50 MiB
extra/knotifyconfig                            6.28.0-1                       0.20 MiB
extra/kpackage                                 6.28.0-1                       0.68 MiB
extra/kparts                                   6.28.0-1                       0.51 MiB
extra/kpeople                                  6.28.0-1                       0.66 MiB
extra/kpmcore                                  26.04.3-1                      4.56 MiB
extra/kpty                                     6.28.0-1                       0.15 MiB
extra/kquickcharts                             6.28.0-1                       0.69 MiB
extra/kquickimageeditor                        0.6.2.1-2                      1.28 MiB
core/krb5                                      1.22.2-1                       4.72 MiB
extra/krunner                                  6.28.0-1                       0.49 MiB
extra/kservice                                 6.28.0-1                       0.67 MiB
extra/kstatusnotifieritem                      6.28.0-1                       0.46 MiB
extra/ksvg                                     6.28.0-1                       0.52 MiB
extra/ktexteditor                              6.28.0-1                      14.00 MiB
extra/ktextwidgets                             6.28.0-1                       1.41 MiB
extra/kunitconversion                          6.28.0-1                      11.96 MiB
extra/kuserfeedback                            6.28.0-1                       2.01 MiB
extra/kwallet                                  6.28.0-1                       2.71 MiB
extra/kwayland5                                5.116.0-2                      2.60 MiB
extra/kwidgetsaddons                           6.28.0-1                       7.50 MiB
extra/kwindowsystem                            6.28.0-1                       0.82 MiB
extra/kwindowsystem5                           5.116.0-2                      0.70 MiB
extra/kxmlgui                                  6.28.0-1                       3.83 MiB
extra/l-smash                                  2.14.5-4                       1.02 MiB
extra/lame                                     3.101.r6531-2                  1.10 MiB
extra/lapack                                   3.12.1-2                      15.06 MiB
extra/lbzip2                                   2.5-6                          0.14 MiB
extra/lcms2                                    2.19.1-1                       0.69 MiB
extra/ldb                                      2:4.24.4-1                     2.17 MiB
core/leancrypto                                1.8.0-1                        6.32 MiB
extra/leptonica                                1.87.0-1                       3.50 MiB
extra/libaccounts-glib                         1.27-3                         0.96 MiB
extra/libaccounts-qt                           1.17-2                         0.19 MiB
core/libaio                                    0.3.113-4                      0.04 MiB
core/libarchive                                3.8.8-2                        1.27 MiB
core/libasan                                   16.1.1+r346+g4e03491b401d-4    1.88 MiB
extra/libass                                   0.17.5-1                       0.30 MiB
core/libassuan                                 3.0.0-1                        0.23 MiB
extra/libasyncns                               1:0.8+r3+g68cd5af-3            0.05 MiB
extra/libatasmart                              0.19-8                         0.10 MiB
core/libatomic                                 16.1.1+r346+g4e03491b401d-4    0.04 MiB
extra/libavc1394                               0.5.4-7                        0.12 MiB
extra/libavif                                  1.4.2-1                        0.87 MiB
extra/libavtp                                  0.2.0-3                        0.05 MiB
extra/libb2                                    0.98.1-3                       0.13 MiB
extra/libblake3                                1.8.4-1                        0.12 MiB
extra/libblockdev                              3.5.0-2                        3.63 MiB
extra/libblockdev-crypto                       3.5.0-2                        0.08 MiB
extra/libblockdev-fs                           3.5.0-2                        0.14 MiB
extra/libblockdev-loop                         3.5.0-2                        0.02 MiB
extra/libblockdev-mdraid                       3.5.0-2                        0.04 MiB
extra/libblockdev-nvme                         3.5.0-2                        0.08 MiB
extra/libblockdev-part                         3.5.0-2                        0.04 MiB
extra/libblockdev-smart                        3.5.0-2                        0.12 MiB
extra/libblockdev-swap                         3.5.0-2                        0.02 MiB
extra/libbluray                                1.4.1-1                        1.23 MiB
core/libbpf                                    1.7.0-1                        0.82 MiB
extra/libbs2b                                  3.1.0-10                       0.07 MiB
extra/libbsd                                   0.12.2-2                       0.33 MiB
extra/libbytesize                              2.12-3                         0.09 MiB
extra/libcaca                                  0.99.beta20-7                  2.58 MiB
extra/libcanberra                              1:0.30+r2+gc0620e4-6           0.37 MiB
core/libcap                                    2.78-1                         2.08 MiB
core/libcap-ng                                 0.9.3-1                        0.16 MiB
extra/libcbor                                  0.14.0-1                       0.18 MiB
extra/libcddb                                  1.3.2-9                        0.16 MiB
extra/libcdio                                  2.3.0-1                        0.88 MiB
extra/libcdio-paranoia                         10.2+2.0.2-2                   0.16 MiB
extra/libcloudproviders                        0.4.0-1                        0.32 MiB
extra/libcolord                                1.4.8-1                        1.24 MiB
extra/libcue                                   2.3.0-2                        0.05 MiB
extra/libcups                                  2:2.4.19-1                     0.77 MiB
extra/libcupsfilters                           2.1.1-4                        1.70 MiB
extra/libdaemon                                0.14-6                         0.06 MiB
extra/libdatrie                                0.2.14-1                       0.49 MiB
extra/libdbusmenu-glib                         18.10.20180917-1               0.67 MiB
extra/libdbusmenu-gtk3                         18.10.20180917-1               0.22 MiB
extra/libdc1394                                2.2.7-2                        1.49 MiB
extra/libdca                                   0.0.7-3                        0.22 MiB
extra/libdecor                                 0.2.5-1                        0.16 MiB
extra/libdeflate                               1.25-1                         0.14 MiB
extra/libdisplay-info                          0.3.0-1                        0.39 MiB
extra/libdmtx                                  0.7.8-1                        0.12 MiB
extra/libdnet                                  1.18.2-1                       0.16 MiB
extra/libdovi                                  3.3.2-2                        0.50 MiB
extra/libdrm                                   2.4.134-1                      1.28 MiB
extra/libdv                                    1.0.0-12                       0.20 MiB
extra/libdvdnav                                7.0.0-1                        0.16 MiB
extra/libdvdread                               7.1.0-1                        0.42 MiB
extra/libebml                                  1.4.5-3                        0.26 MiB
extra/libebur128                               1.2.6-2                        0.05 MiB
core/libedit                                   20260512_3.1-1                 0.27 MiB
extra/libei                                    1.6.0-1                        0.42 MiB
core/libelf                                    0.195-1                        3.23 MiB
extra/libepoxy                                 1.5.10-3                       2.64 MiB
extra/libevdev                                 1.13.6-1                       0.21 MiB
core/libevent                                  2.1.13-2                       1.21 MiB
extra/libexif                                  0.6.26-1                       3.12 MiB
extra/libexsid                                 2.1-1                          0.02 MiB
extra/libfakekey                               0.3-4                          0.02 MiB
extra/libfdk-aac                               2.0.3-2                        1.46 MiB
core/libffi                                    3.7.1-1                        0.11 MiB
extra/libfontenc                               1.1.9-1                        0.03 MiB
extra/libfreeaptx                              0.2.2-1                        0.06 MiB
extra/libftdi                                  1.5-10                         0.51 MiB
extra/libfyaml                                 0.9.6-2                        1.27 MiB
core/libgcc                                    16.1.1+r346+g4e03491b401d-4    0.18 MiB
core/libgcrypt                                 1.12.2-1                       1.93 MiB
extra/libgexiv2                                0.14.6-2                       1.11 MiB
core/libgfortran                               16.1.1+r346+g4e03491b401d-4    3.51 MiB
extra/libgirepository                          1.86.0-2                       1.52 MiB
extra/libglvnd                                 1.7.0-3                        3.34 MiB
extra/libgme                                   0.6.5-1                        0.33 MiB
extra/libgnomekbd                              1:3.28.1-2                     0.68 MiB
core/libgomp                                   16.1.1+r346+g4e03491b401d-4    0.43 MiB
core/libgpg-error                              1.61-1                         1.14 MiB
extra/libgphoto2                               2.5.34-1                       8.07 MiB
extra/libgudev                                 238-3                          0.38 MiB
extra/libgusb                                  0.4.9-2                        0.35 MiB
extra/libhandy                                 1.8.3-2                        2.42 MiB
extra/libheif                                  1.23.1-1                       2.74 MiB
core/libhwasan                                 16.1.1+r346+g4e03491b401d-4    0.72 MiB
extra/libice                                   1.1.2-1                        0.36 MiB
extra/libidn                                   1.44-1                         0.86 MiB
core/libidn2                                   2.3.8-1                        0.37 MiB
extra/libiec61883                              1.2.0-9                        0.12 MiB
extra/libieee1284                              0.2.11-19                      0.12 MiB
extra/libimagequant                            4.4.1-2                        0.60 MiB
extra/libimobiledevice                         1.4.0-2                        6.19 MiB
extra/libimobiledevice-glue                    1.3.2-1                        0.10 MiB
core/libinih                                   62-2                           0.06 MiB
extra/libinput                                 1.31.3-1                       0.79 MiB
core/libisl                                    0.28-1                         5.90 MiB
extra/libjpeg-turbo                            3.2.0-2                        2.65 MiB
extra/libjxl                                   0.12.0-1                       6.78 MiB
extra/libkdcraw                                26.04.3-1                      0.13 MiB
extra/libkexiv2                                26.04.3-1                      0.46 MiB
core/libksba                                   1.8.0-1                        0.34 MiB
extra/liblc3                                   1.1.3-2                        0.28 MiB
extra/libldac                                  2.0.2.6-1                      0.10 MiB
core/libldap                                   2.6.13-1                       0.66 MiB
extra/liblouis                                 3.38.0-1                      13.68 MiB
extra/liblqr                                   0.4.3-1                        0.08 MiB
extra/liblrdf                                  0.6.1-5                        0.05 MiB
core/liblsan                                   16.1.1+r346+g4e03491b401d-4    0.55 MiB
extra/libltc                                   1.3.2-2                        0.74 MiB
core/libmakepkg-dropins                        20-1                           0.01 MiB
extra/libmalcontent                            0.14.0-4                       0.41 MiB
extra/libmanette                               0.2.13-2                       0.40 MiB
extra/libmatroska                              1.7.1-2                        0.70 MiB
extra/libmaxminddb                             1.13.3-1                       0.04 MiB
extra/libmbim                                  1.34.0-1                       3.62 MiB
extra/libmd                                    1.2.0-1                        0.13 MiB
extra/libmicrodns                              0.2.0-2                        0.04 MiB
extra/libmm-glib                               1.24.2-1                       7.42 MiB
extra/libmms                                   0.6.4-6                        0.07 MiB
extra/libmng                                   2.0.3-4                        0.66 MiB
core/libmnl                                    1.0.5-2                        0.03 MiB
extra/libmodplug                               0.8.9.0-7                      0.37 MiB
core/libmpc                                    1.4.1-1                        0.19 MiB
extra/libmpcdec                                1:0.1+r475-6                   0.09 MiB
extra/libmpeg2                                 0.5.1-11                       0.23 MiB
extra/libmspack                                1:1.11-2                       0.17 MiB
extra/libmtp                                   1.1.23-1                       5.36 MiB
extra/libmysofa                                1.3.4-1                        1.26 MiB
extra/libndp                                   1.9-1                          0.06 MiB
core/libnetfilter_conntrack                    1.1.1-1                        0.16 MiB
extra/libnewt                                  0.52.25-2                      0.28 MiB
core/libnfnetlink                              1.0.2-2                        0.05 MiB
core/libnftnl                                  1.3.1-1                        0.25 MiB
core/libnghttp2                                1.69.0-1                       0.39 MiB
core/libnghttp3                                1.17.0-1                       0.27 MiB
core/libngtcp2                                 1.24.0-1                       0.74 MiB
extra/libnice                                  0.1.23-1                       1.81 MiB
core/libnl                                     3.12.0-1                       2.12 MiB
extra/libnm                                    1.56.1-2                       6.39 MiB
extra/libnma                                   1.10.6-3                       0.48 MiB
extra/libnma-common                            1.10.6-3                       1.07 MiB
extra/libnma-gtk4                              1.10.6-3                       0.46 MiB
extra/libnotify                                0.8.8-1                        0.17 MiB
core/libnsl                                    2.0.1-2                        0.07 MiB
extra/libntfs-3g                               2026.7.7-1                     0.62 MiB
extra/libnvme                                  1.16.2-1                       1.73 MiB
core/libobjc                                   16.1.1+r346+g4e03491b401d-4    0.09 MiB
extra/libogg                                   1.3.6-1                        0.44 MiB
extra/libopenmpt                               0.8.7-1                        2.53 MiB
extra/libotr                                   4.1.1-6                        0.27 MiB
core/libp11-kit                                0.26.4-1                       3.32 MiB
extra/libpackagekit-glib                       1.3.6-1                        1.91 MiB
nemesis_repo/libpamac-aur                      11.7.4-2                       4.12 MiB
extra/libpaper                                 2.2.8-1                        0.16 MiB
core/libpcap                                   1.10.6-1                       0.65 MiB
extra/libpciaccess                             0.19-1                         0.06 MiB
extra/libpgm                                   5.3.128-4                      0.35 MiB
core/libpipeline                               1.5.8-1                        0.09 MiB
extra/libpipewire                              1:1.6.8-1                      2.00 MiB
extra/libplacebo                               7.360.1-3                      1.61 MiB
extra/libplist                                 2.7.0-3                        0.52 MiB
extra/libpng                                   1.6.58-2                       0.58 MiB
extra/libppd                                   2.1.1-2                        0.96 MiB
extra/libproxy                                 0.5.12-1                       0.10 MiB
core/libpsl                                    0.21.5-2                       0.22 MiB
extra/libpulse                                 17.0+r98+gb096704c0-1          1.46 MiB
extra/libpwquality                             1.4.5-7                        0.43 MiB
extra/libqaccessibilityclient-qt6              0.6.0-4                        0.32 MiB
extra/libqalculate                             5.12.0-1                      16.06 MiB
extra/libqmi                                   1.38.0-1                      21.52 MiB
extra/libqrtr-glib                             1.4.0-1                        0.13 MiB
core/libquadmath                               16.1.1+r346+g4e03491b401d-4    0.30 MiB
extra/libraqm                                  0.10.5-1                       0.18 MiB
extra/libraw                                   0.22.2-1                       2.89 MiB
extra/libraw1394                               2.1.2-4                        0.16 MiB
extra/libresidfp                               1.1.2-1                        0.10 MiB
extra/librsvg                                  2:2.62.3-1                    10.26 MiB
extra/libsamplerate                            0.2.2-3                        1.55 MiB
core/libsasl                                   2.1.28-5                       0.50 MiB
core/libseccomp                                2.6.0-1                        0.31 MiB
core/libsecret                                 0.21.7-1                       1.16 MiB
extra/libshout                                 1:2.4.6-5                      0.20 MiB
extra/libsidplayfp                             3.0.2-1                        0.40 MiB
extra/libsigc++                                2.12.2-1                       1.14 MiB
extra/libsigc++-3.0                            3.8.1-1                        0.25 MiB
extra/libsixel                                 1.10.5-1                       0.40 MiB
extra/libsm                                    1.2.6-1                        0.26 MiB
extra/libsndfile                               1.2.2-4                        0.93 MiB
extra/libsodium                                1.0.22-1                       0.64 MiB
extra/libsonic                                 0.2.0-2                        0.04 MiB
extra/libsoup3                                 3.6.6-2                        1.96 MiB
extra/libsoxr                                  0.1.3-5                        0.21 MiB
extra/libspectre                               0.2.12-2                       0.08 MiB
extra/libspeechd                               0.12.1-3                       0.09 MiB
extra/libsrtp                                  1:2.8.0-1                      0.17 MiB
extra/libssc                                   0.4.4-1                        0.26 MiB
extra/libssh                                   0.12.0-1                       0.71 MiB
core/libssh2                                   1.11.1-6                       0.49 MiB
core/libstdc++                                 16.1.1+r346+g4e03491b401d-4    2.80 MiB
extra/libstemmer                               3.1.1-1                        0.64 MiB
extra/libsysprof-capture                       50.0-2                         0.27 MiB
core/libtasn1                                  4.21.0-1                       0.27 MiB
extra/libtatsu                                 1.0.5-1                        0.05 MiB
extra/libteam                                  1.32-3                         0.33 MiB
extra/libthai                                  0.1.30-1                       1.24 MiB
extra/libtheora                                1.2.0-1                        2.34 MiB
extra/libtiff                                  4.7.2-1                        1.32 MiB
core/libtirpc                                  1.3.7-1                        0.42 MiB
extra/libtommath                               1.3.0-2                        0.12 MiB
core/libtool                                   2.6.1-2                        2.34 MiB
extra/libtorrent-rasterbar                     1:2.1.0-3                     13.32 MiB
core/libtsan                                   16.1.1+r346+g4e03491b401d-4    1.45 MiB
core/libubsan                                  16.1.1+r346+g4e03491b401d-4    0.50 MiB
extra/libunibreak                              7.0-1                          0.15 MiB
core/libunistring                              1.4.2-1                        2.73 MiB
extra/libunwind                                1.8.2-1                        0.29 MiB
extra/liburcu                                  0.15.6-1                       0.73 MiB
extra/liburing                                 2.15-1                         0.47 MiB
core/libusb                                    1.0.30-1                       0.23 MiB
extra/libusbmuxd                               2.1.1-2                        0.08 MiB
extra/libutempter                              1.2.3-1                        0.03 MiB
extra/libuv                                    1.52.1-1                       0.64 MiB
extra/libva                                    2.24.1-1                       1.00 MiB
extra/libvdpau                                 1.5-4                          0.28 MiB
core/libverto                                  0.3.2-6                        0.07 MiB
extra/libvlc                                   3.0.23_2-9                     2.21 MiB
extra/libvorbis                                1.3.7-4                        0.83 MiB
extra/libvpl                                   2.17.0-1                       0.99 MiB
extra/libvpx                                   1.16.0-3                       3.68 MiB
extra/libwacom                                 2.19.0-1                       1.60 MiB
extra/libwbclient                              2:4.24.4-1                     0.12 MiB
extra/libwebp                                  1.6.0-2                        1.04 MiB
extra/libwireplumber                           0.5.15-1                       1.66 MiB
extra/libx11                                   1.8.13-1                       9.78 MiB
extra/libxau                                   1.0.12-1                       0.02 MiB
extra/libxaw                                   1.0.16-2                       1.65 MiB
extra/libxcb                                   1.17.0-1                       3.87 MiB
extra/libxcomposite                            0.4.7-1                        0.02 MiB
core/libxcrypt                                 4.5.2-1                        0.19 MiB
extra/libxcursor                               1.2.3-1                        0.07 MiB
extra/libxcvt                                  0.1.3-1                        0.04 MiB
extra/libxdamage                               1.1.7-1                        0.02 MiB
extra/libxdmcp                                 1.1.5-2                        0.13 MiB
extra/libxext                                  1.3.7-1                        0.30 MiB
extra/libxfce4util                             4.20.1-1                       1.06 MiB
extra/libxfixes                                6.0.2-1                        0.04 MiB
extra/libxfont2                                2.0.8-1                        0.24 MiB
extra/libxft                                   2.3.9-1                        0.13 MiB
extra/libxi                                    1.8.3-1                        0.49 MiB
extra/libxinerama                              1.1.6-1                        0.02 MiB
extra/libxkbcommon                             1.13.2-1                       1.05 MiB
extra/libxkbcommon-x11                         1.13.2-1                       0.10 MiB
extra/libxkbfile                               1.2.0-1                        0.19 MiB
extra/libxklavier                              5.4-7                          0.35 MiB
core/libxml2                                   2.15.3-1                       3.00 MiB
extra/libxmlb                                  0.3.28-1                       1.21 MiB
extra/libxmu                                   1.3.1-1                        0.34 MiB
extra/libxpm                                   3.5.19-1                       0.16 MiB
extra/libxpresent                              1.0.2-1                        0.03 MiB
extra/libxrandr                                1.5.5-1                        0.07 MiB
extra/libxrender                               0.9.12-1                       0.09 MiB
extra/libxshmfence                             1.3.3-1                        0.02 MiB
extra/libxslt                                  1.1.45-2                       0.78 MiB
extra/libxss                                   1.2.5-1                        0.03 MiB
extra/libxt                                    1.3.1-1                        2.02 MiB
extra/libxtst                                  1.2.5-1                        0.11 MiB
extra/libxv                                    1.0.13-1                       0.06 MiB
extra/libxxf86vm                               1.1.7-1                        0.03 MiB
extra/libyaml                                  0.2.5-3                        0.18 MiB
extra/libyuv                                   r2426+464c51a03-1              1.82 MiB
extra/libzip                                   1.11.4-1                       0.47 MiB
core/licenses                                  20240728-1                     1.54 MiB
extra/lilv                                     0.28.0-1                       0.20 MiB
core/linux                                     7.1.3.arch2-2                147.65 MiB
core/linux-api-headers                         7.1-1                          6.95 MiB
core/linux-firmware-amdgpu                     20260622-1                    26.54 MiB
core/linux-firmware-atheros                    20260622-1                    51.17 MiB
core/linux-firmware-broadcom                   20260622-1                    12.94 MiB
core/linux-firmware-cirrus                     20260622-1                     2.80 MiB
core/linux-firmware-intel                      20260622-1                   128.82 MiB
core/linux-firmware-mediatek                   20260622-1                    36.99 MiB
core/linux-firmware-nvidia                     20260622-1                   103.55 MiB
core/linux-firmware-other                      20260622-1                    30.19 MiB
core/linux-firmware-radeon                     20260622-1                     2.30 MiB
core/linux-firmware-realtek                    20260622-1                     6.83 MiB
core/linux-firmware-whence                     20260622-1                     0.43 MiB
extra/lirc                                     1:0.10.2-6                     3.70 MiB
extra/litehtml0.9                              0.9-2                          0.87 MiB
extra/llvm-libs                                22.1.8-2                     163.70 MiB
extra/lm_sensors                               1:3.6.2-1                      0.48 MiB
extra/lmdb                                     0.9.35-1                       0.40 MiB
extra/lrzip                                    0.660-1                        0.39 MiB
extra/lua                                      5.5.0-2                        1.57 MiB
extra/lua54                                    5.4.8-6                        1.50 MiB
extra/luajit                                   2.1.1784360928+14d8a7a-1       0.82 MiB
extra/lv2                                      1.18.10-2                      0.98 MiB
core/lz4                                       1:1.10.0-2                     0.44 MiB
core/lzo                                       2.10-5                         0.38 MiB
extra/lzop                                     1.04-4                         0.19 MiB
core/m4                                        1.4.21-2                       0.71 MiB
extra/md4c                                     0.5.3-1                        0.20 MiB
extra/media-player-info                        26-1                           0.18 MiB
extra/mesa                                     1:26.1.5-1                    52.69 MiB
extra/mesa-utils                               9.0.0-7                        0.76 MiB
core/minizip                                   1:1.3.2-3                      0.10 MiB
extra/mjpegtools                               2.2.1-4                        2.21 MiB
core/mkinitcpio-busybox                        1.36.1-1                       0.51 MiB
extra/modemmanager-qt                          6.28.0-1                       0.95 MiB
core/mpdecimal                                 4.0.1-3                        0.32 MiB
core/mpfr                                      4.2.2-1                        1.01 MiB
extra/mpg123                                   1.33.5-1                       1.18 MiB
extra/mpv                                      1:0.41.0-3                     6.20 MiB
extra/mpvqt                                    1.2.0-1                        0.11 MiB
extra/mtdev                                    1.1.7-1                        0.05 MiB
extra/mujs                                     1.3.9-1                        1.12 MiB
core/ncurses                                   6.6-2                          4.09 MiB
extra/neon                                     0.37.1-1                       0.78 MiB
extra/net-snmp                                 5.9.5.2-1                      8.56 MiB
core/nettle                                    4.0-1                          1.03 MiB
extra/networkmanager-qt                        6.28.0-1                       1.75 MiB
extra/networkmanager-vpn-plugin-openconnect    1.2.10-4                       0.07 MiB
extra/networkmanager-vpn-plugin-openvpn        1.12.5-1                       0.16 MiB
core/nfsidmap                                  2.9.1-1                        0.17 MiB
extra/nftables                                 1:1.1.6-3                      1.11 MiB
extra/nm-connection-editor                     1.36.0-2                       4.46 MiB
core/npth                                      1.8-1                          0.08 MiB
core/nspr                                      4.39-1                         0.71 MiB
core/nss                                       3.125-1                        5.25 MiB
extra/ntfsprogs                                2026.7.7-1                     0.83 MiB
extra/numactl                                  2.0.19-1                       0.24 MiB
extra/oath-toolkit                             2.6.14-4                       1.12 MiB
extra/ocl-icd                                  2.3.4-1                        0.48 MiB
extra/onetbb                                   2023.1.0-1                     2.01 MiB
extra/oniguruma                                6.9.10-1                       0.88 MiB
extra/open-isns                                0.103-1                        0.63 MiB
extra/openal                                   1.25.2-1                       2.77 MiB
extra/openbsd-netcat                           1.238_1-1                      0.05 MiB
extra/opencore-amr                             0.1.6-2                        0.29 MiB
extra/opencv                                   5.0.0-6                      112.81 MiB
extra/openexr                                  3.4.13-2                       4.51 MiB
extra/openh264                                 2.6.0-2                        2.22 MiB
extra/openjpeg2                                2.5.4-1                       13.37 MiB
extra/openjph                                  0.30.1-1                       0.76 MiB
core/openssl                                   3.6.3-1                       12.24 MiB
extra/openxr                                   1.1.60-1                      10.65 MiB
extra/opus                                     1.6.1-1                        4.16 MiB
extra/opusfile                                 0.12-4                         0.21 MiB
extra/orc                                      0.4.42-1                       1.36 MiB
extra/ostree                                   2026.2-1                       4.36 MiB
extra/oxygen-icons                             1:6.28.0-1                    34.56 MiB
core/p11-kit                                   0.26.4-1                       1.14 MiB
extra/packagekit                               1.3.6-1                        3.18 MiB
core/pacman                                    7.1.0.r9.g54d9411-2            5.04 MiB
extra/pacman-contrib                           1.13.1-1                       0.13 MiB
core/pacman-mirrorlist                         20260610-1                     0.03 MiB
extra/pahole                                   1:1.31-2                       0.93 MiB
core/pam                                       1.7.2-2                        2.92 MiB
core/pambase                                   20260616-1                     0.00 MiB
extra/pango                                    1:1.58.0-1                     2.38 MiB
extra/pangomm-2.48                             2.56.2-1                       0.57 MiB
core/patch                                     2.8-1                          0.17 MiB
extra/pbzip2                                   1.1.13-5                       0.08 MiB
extra/pcaudiolib                               1.3-1                          0.02 MiB
core/pciutils                                  3.15.0-1                       0.41 MiB
core/pcre                                      8.45-4                         3.50 MiB
core/pcre2                                     10.47-1                        7.00 MiB
core/perl                                      5.42.2-1                      70.11 MiB
extra/perl-error                               0.17030-3                      0.04 MiB
extra/perl-mailtools                           2.22-3                         0.10 MiB
extra/perl-timedate                            2.35-1                         0.15 MiB
extra/phonon-qt6                               4.12.0-6                       1.67 MiB
extra/phonon-qt6-vlc                           0.12.0-6                       0.34 MiB
extra/pigz                                     2.8-2                          0.17 MiB
core/pinentry                                  1.3.3-1                        0.66 MiB
extra/pipewire-audio                           1:1.6.8-1                      6.79 MiB
extra/pipewire-session-manager                 1:1.6.8-1                      0.00 MiB
extra/pixman                                   0.46.4-1                       0.74 MiB
extra/pixz                                     1.0.7-5                        0.04 MiB
extra/pkcs11-helper                            1.31.0-1                       0.31 MiB
core/pkgconf                                   3.0.3-1                        0.33 MiB
extra/plasma-nano                              6.7.3-1                        0.21 MiB
extra/polkit                                   127-3                          1.95 MiB
extra/polkit-qt6                               0.201.1-1                      0.35 MiB
extra/poppler                                  26.07.0-1                      6.74 MiB
extra/poppler-data                             0.4.12-2                      12.34 MiB
extra/poppler-qt6                              26.07.0-1                      0.87 MiB
core/popt                                      1.19-2                         0.23 MiB
extra/portaudio                                1:19.7.0-4                     0.33 MiB
extra/prison                                   6.28.0-1                       0.28 MiB
core/procps-ng                                 4.0.6-3                        2.55 MiB
extra/protobuf                                 35.1-1                        18.82 MiB
extra/protobuf-c                               1.5.2-12                       0.42 MiB
core/psmisc                                    23.7-2                         0.76 MiB
extra/pulseaudio-qt                            1.8.1-1                        0.49 MiB
extra/purpose                                  6.28.0-1                       2.13 MiB
extra/pyalpm                                   0.11.1-1                       0.23 MiB
core/python                                    3.14.6-1                      73.41 MiB
extra/python-attrs                             26.1.0-1                       0.63 MiB
extra/python-beautifulsoup4                    4.15.0-1                       1.22 MiB
extra/python-cairo                             1.29.0-2                       0.43 MiB
core/python-capng                              0.9.3-1                        0.10 MiB
extra/python-certifi                           2026.06.17-1                   0.02 MiB
extra/python-cffi                              2.1.0-1                        1.40 MiB
extra/python-charset-normalizer                3.4.7-1                        0.96 MiB
extra/python-click                             8.3.3-1                        1.38 MiB
extra/python-configobj                         5.0.9-6                        0.40 MiB
extra/python-cryptography                      49.0.0-1                       6.53 MiB
extra/python-dateutil                          2.9.0-8                        1.03 MiB
extra/python-dbus                              1.4.0-2                        0.62 MiB
extra/python-firewall                          2.5.0-1                        4.16 MiB
extra/python-gobject                           3.56.3-1                       1.51 MiB
extra/python-httplib2                          0.32.0-1                       0.28 MiB
extra/python-idna                              3.18-1                         0.64 MiB
extra/python-jinja                             1:3.1.6-3                      2.04 MiB
extra/python-jsonpatch                         1.33-6                         0.11 MiB
extra/python-jsonpointer                       3.1.1-1                        0.04 MiB
extra/python-jsonschema                        4.26.0-1                       1.39 MiB
extra/python-jsonschema-specifications         2025.9.1-2                     0.05 MiB
extra/python-lxml                              6.1.1-1                        5.91 MiB
extra/python-markupsafe                        3.0.3-1                        0.09 MiB
extra/python-netifaces                         0.11.0-9                       0.04 MiB
extra/python-oauthlib                          3.3.1-2                        1.53 MiB
extra/python-packaging                         26.2-1                         1.23 MiB
extra/python-pefile                            2024.8.26-2                    0.98 MiB
extra/python-pillow                            12.3.0-1                       4.88 MiB
extra/python-psutil                            7.2.2-1                        1.14 MiB
extra/python-pycparser                         3.00-1                         0.71 MiB
extra/python-pycups                            2.0.4-4                        0.18 MiB
extra/python-pycurl                            7.47.0-1                       0.54 MiB
extra/python-pygdbmi                           0.11.0.0-6                     0.15 MiB
extra/python-pyparsing                         3.3.2-1                        1.55 MiB
extra/python-pyparted                          3.13.0-6                       0.51 MiB
extra/python-pyqt6                             6.11.0-2                      25.70 MiB
extra/python-pyqt6-sip                         13.11.1-1                      0.14 MiB
extra/python-pyserial                          3.5-8                          0.69 MiB
extra/python-referencing                       0.37.0-3                       0.41 MiB
extra/python-requests                          2.34.2-1                       0.76 MiB
extra/python-rpds-py                           2026.6.3-1                     0.70 MiB
extra/python-sentry_sdk                        2.65.0-1                       6.66 MiB
extra/python-setproctitle                      1.3.7-2                        0.04 MiB
extra/python-six                               1.17.0-3                       0.12 MiB
extra/python-soupsieve                         2.8.4-1                        0.51 MiB
extra/python-typing_extensions                 4.16.0-1                       0.53 MiB
extra/python-unidecode                         1.4.0-3                        1.42 MiB
extra/python-urllib3                           2.7.0-1                        1.43 MiB
extra/python-xapp                              3.0.3-1                        0.38 MiB
extra/python-yaml                              6.0.3-2                        0.96 MiB
extra/qca-qt6                                  2.3.10-7                       3.44 MiB
extra/qcoro                                    0.13.0-2                       0.72 MiB
extra/qpdf                                     12.3.2-2                       3.37 MiB
extra/qqc2-desktop-style                       6.28.0-1                       2.95 MiB
extra/qrencode                                 4.1.1-4                        0.11 MiB
extra/qt5-base                                 5.15.19+kde+r96-1             63.71 MiB
extra/qt5-declarative                          5.15.19+kde+r23-1             23.65 MiB
extra/qt5-translations                         5.15.19-1                     14.71 MiB
extra/qt5-wayland                              5.15.19+kde+r55-1              6.09 MiB
extra/qt5-x11extras                            5.15.19-1                      0.04 MiB
extra/qt6-5compat                              6.11.1-1                       2.17 MiB
extra/qt6-base                                 6.11.1-1                      66.63 MiB
extra/qt6-connectivity                         6.11.1-1                       2.06 MiB
extra/qt6-declarative                          6.11.1-3                     119.84 MiB
extra/qt6-imageformats                         6.11.1-1                       0.36 MiB
extra/qt6-location                             6.11.1-1                       3.27 MiB
extra/qt6-multimedia                           6.11.1-1                       6.69 MiB
extra/qt6-multimedia-ffmpeg                    6.11.1-1                       2.90 MiB
extra/qt6-positioning                          6.11.1-1                       1.80 MiB
extra/qt6-quick3d                              6.11.1-1                      21.22 MiB
extra/qt6-quicktimeline                        6.11.1-1                       0.44 MiB
extra/qt6-sensors                              6.11.1-1                       1.18 MiB
extra/qt6-shadertools                          6.11.1-1                       5.68 MiB
extra/qt6-speech                               6.11.1-1                       0.61 MiB
extra/qt6-svg                                  6.11.1-1                       1.03 MiB
extra/qt6-tools                                6.11.1-3                      22.24 MiB
extra/qt6-translations                         6.11.1-1                      15.36 MiB
extra/qt6-virtualkeyboard                      6.11.1-1                       6.22 MiB
extra/qt6-webchannel                           6.11.1-1                       0.52 MiB
extra/qt6-webengine                            6.11.1-4                     282.18 MiB
extra/qt6-websockets                           6.11.1-1                       0.43 MiB
extra/qt6-webview                              6.11.1-1                       0.41 MiB
extra/qtkeychain-qt6                           0.17.0-1                       0.27 MiB
extra/raptor                                   2.0.16-9                       1.99 MiB
extra/rav1e                                    0.8.1-3                        7.49 MiB
extra/re2                                      2:2025.11.05-5                 0.62 MiB
core/readline                                  8.3.003-1                      1.50 MiB
extra/rhash                                    1.4.6-1                        0.34 MiB
extra/ripgrep                                  15.2.0-1                       4.29 MiB
extra/ripgrep-all                              0.10.10-1                     17.49 MiB
core/rpcbind                                   1.2.9-1                        0.10 MiB
extra/rtmpdump                                 1:2.6-2                        0.26 MiB
extra/rubberband                               4.0.0-2                        1.52 MiB
extra/samba                                    2:4.24.4-1                    63.54 MiB
extra/sane                                     1.4.0-4                       18.74 MiB
extra/sbc                                      2.2-1                          0.21 MiB
extra/sddm                                     0.21.0-7                       5.34 MiB
extra/sdl2-compat                              2.32.70-1                      3.09 MiB
extra/sdl3                                     3.4.12-1                       6.97 MiB
extra/sdl3_ttf                                 3.2.2-3                        0.24 MiB
core/sed                                       4.10-1                         0.78 MiB
extra/serd                                     0.32.10-1                      0.17 MiB
extra/shaderc                                  2026.2-2                       0.68 MiB
core/shadow                                    4.19.4.arch1-1                 3.77 MiB
extra/shared-mime-info                         2.5.1-2                        5.83 MiB
extra/signon-kwallet-extension                 26.04.3-1                      0.03 MiB
extra/signon-plugin-oauth2                     0.25-4                         0.23 MiB
extra/signon-ui                                0.17+20231016-4                0.25 MiB
extra/signond                                  8.61-4                         1.36 MiB
extra/slang                                    2.3.3-4                        3.36 MiB
extra/smbclient                                2:4.24.4-1                    28.98 MiB
extra/snap-pac                                 3.0.1-3                        0.04 MiB
extra/snappy                                   1.2.2-3                        0.09 MiB
extra/sndio                                    1.10.0-1                       0.28 MiB
extra/socat                                    1.8.1.3-1                      0.57 MiB
extra/solid                                    6.28.0-1                       2.11 MiB
extra/sonnet                                   6.28.0-1                       1.67 MiB
extra/sord                                     0.16.22-1                      0.12 MiB
extra/sound-theme-freedesktop                  0.8-6                          0.45 MiB
extra/soundtouch                               2.4.1-1                        0.20 MiB
extra/source-highlight                         3.1.9-18                       3.24 MiB
extra/spandsp                                  0.0.6-7                        1.59 MiB
extra/spdlog                                   1.17.0-2                       0.69 MiB
extra/speex                                    1.2.1-2                        0.62 MiB
extra/speexdsp                                 1.2.1-2                        0.54 MiB
extra/spirv-tools                              1:1.4.350.1-1                  7.94 MiB
core/sqlite                                    3.53.3-1                      16.79 MiB
extra/sratom                                   0.6.22-1                       0.05 MiB
extra/srt                                      1.5.5-1                        1.56 MiB
extra/sshfs                                    3.7.6-1                        0.09 MiB
extra/stoken                                   0.92-6                         0.17 MiB
extra/svt-av1                                  4.1.0-1                        5.24 MiB
extra/svt-hevc                                 1.5.1-4                        2.24 MiB
extra/syndication                              6.28.0-1                       0.72 MiB
extra/syntax-highlighting                      6.28.0-1                      10.08 MiB
extra/sysfsutils                               2.1.1-2                        0.09 MiB
extra/taglib                                   2.3-1                          2.34 MiB
extra/talloc                                   2.4.4-1                        0.17 MiB
core/tar                                       1.35-2                         2.80 MiB
extra/tdb                                      1.4.15-1                       0.23 MiB
extra/tesseract                                5.5.2-1                        4.58 MiB
extra/tesseract-data-afr                       2:4.1.0-5                      7.49 MiB
extra/tesseract-data-osd                       2:4.1.0-5                     10.07 MiB
extra/tevent                                   1:0.17.1-2                     0.21 MiB
core/texinfo                                   7.3-1                         12.67 MiB
core/thin-provisioning-tools                   1.3.3-1                        2.72 MiB
extra/threadweaver                             6.28.0-1                       0.26 MiB
extra/tinysparql                               3.11.1-1                       3.88 MiB
extra/tslib                                    1.24-1                         0.47 MiB
extra/twolame                                  0.4.0-4                        0.24 MiB
core/tzdata                                    2026c-1                        1.64 MiB
extra/uchardet                                 0.0.8-4                        0.20 MiB
extra/udisks2                                  2.11.1-2                       7.86 MiB
extra/upower                                   1.91.3-1                       0.85 MiB
extra/uriparser                                1.0.2-1                        0.28 MiB
core/util-linux                                2.42.2-1                      19.70 MiB
core/util-linux-libs                           2.42.2-1                       1.39 MiB
extra/v4l-utils                                1.32.0-2                      11.31 MiB
extra/vapoursynth                              77-2                           3.25 MiB
extra/verdict                                  1.4.5-2                        0.26 MiB
extra/vid.stab                                 1.1.1-3                        0.14 MiB
extra/vim-runtime                              9.2.0804-1                    38.50 MiB
extra/vlc-plugin-a52dec                        3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-alsa                          3.0.23_2-9                     0.05 MiB
extra/vlc-plugin-archive                       3.0.23_2-9                     0.02 MiB
extra/vlc-plugin-dav1d                         3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-dbus                          3.0.23_2-9                     0.09 MiB
extra/vlc-plugin-dbus-screensaver              3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-faad2                         3.0.23_2-9                     0.02 MiB
extra/vlc-plugin-flac                          3.0.23_2-9                     0.03 MiB
extra/vlc-plugin-gnutls                        3.0.23_2-9                     0.03 MiB
extra/vlc-plugin-inflate                       3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-journal                       3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-jpeg                          3.0.23_2-9                     0.02 MiB
extra/vlc-plugin-matroska                      3.0.23_2-9                     0.49 MiB
extra/vlc-plugin-mpg123                        3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-ogg                           3.0.23_2-9                     0.13 MiB
extra/vlc-plugin-opus                          3.0.23_2-9                     0.03 MiB
extra/vlc-plugin-png                           3.0.23_2-9                     0.02 MiB
extra/vlc-plugin-shout                         3.0.23_2-9                     0.02 MiB
extra/vlc-plugin-speex                         3.0.23_2-9                     0.04 MiB
extra/vlc-plugin-tag                           3.0.23_2-9                     0.10 MiB
extra/vlc-plugin-theora                        3.0.23_2-9                     0.03 MiB
extra/vlc-plugin-twolame                       3.0.23_2-9                     0.01 MiB
extra/vlc-plugin-vorbis                        3.0.23_2-9                     0.03 MiB
extra/vlc-plugin-vpx                           3.0.23_2-9                     0.02 MiB
extra/vlc-plugin-xml                           3.0.23_2-9                     0.01 MiB
extra/vlc-plugins-base                         3.0.23_2-9                     7.76 MiB
extra/vmaf                                     3.2.0-1                        7.09 MiB
extra/volume_key                               0.3.12-12                      0.68 MiB
extra/vte-common                               0.84.0-1                       0.19 MiB
extra/vte3                                     0.84.0-1                       1.70 MiB
extra/vulkan-icd-loader                        1.4.350.1-1                    0.61 MiB
extra/vulkan-tools                             1.4.350.1-1                    1.89 MiB
extra/wavpack                                  5.9.0-1                        0.90 MiB
extra/wayland-utils                            1.3.0-1                        0.06 MiB
extra/webkit2gtk-4.1                           2.52.5-2                     133.52 MiB
extra/webkitgtk-6.0                            2.52.5-2                     130.77 MiB
extra/webrtc-audio-processing-1                1.3-5                          1.46 MiB
core/which                                     2.25-1                         0.03 MiB
extra/wildmidi                                 0.4.6-1                        0.17 MiB
extra/wireplumber                              0.5.15-1                       1.22 MiB
extra/woff2                                    1.0.2-6                        0.17 MiB
extra/wvstreams                                4.6.1-21                       7.98 MiB
extra/x264                                     3:0.165.r3222.b35605a-2        3.79 MiB
extra/x265                                     4.2-2                         21.38 MiB
extra/xapp                                     3.2.2-1                        1.88 MiB
extra/xapp-symbolic-icons                      1.1.0-1                        0.95 MiB
extra/xcb-proto                                1.17.0-4                       1.03 MiB
extra/xcb-util                                 0.4.1-2                        0.03 MiB
extra/xcb-util-cursor                          0.1.6-1                        0.03 MiB
extra/xcb-util-image                           0.4.1-3                        0.05 MiB
extra/xcb-util-keysyms                         0.4.1-5                        0.02 MiB
extra/xcb-util-renderutil                      0.3.10-2                       0.03 MiB
extra/xcb-util-wm                              0.4.2-2                        0.21 MiB
extra/xdg-dbus-proxy                           0.1.7-1                        0.06 MiB
extra/xdg-desktop-portal                       1.22.1-2                       1.83 MiB
extra/xdg-desktop-portal-gtk                   1.15.3-1                       0.42 MiB
extra/xdg-user-dirs                            0.20-1                         0.17 MiB
extra/xf86-input-libinput                      1.5.0-1                        0.10 MiB
extra/xkeyboard-config                         2.48-1                        10.24 MiB
extra/xmlsec                                   1.3.12-1                       3.80 MiB
extra/xorg-fonts-encodings                     1.1.0-2                        0.61 MiB
extra/xorg-server-common                       21.1.24-1                      0.12 MiB
extra/xorg-setxkbmap                           1.3.5-1                        0.03 MiB
extra/xorg-xauth                               1.1.5-1                        0.05 MiB
extra/xorg-xdpyinfo                            1.4.0-1                        0.03 MiB
extra/xorg-xkbcomp                             1.5.0-1                        0.21 MiB
extra/xorg-xmessage                            1.0.7-2                        0.03 MiB
extra/xorg-xmodmap                             1.0.11-2                       0.05 MiB
extra/xorg-xprop                               1.2.8-1                        0.05 MiB
extra/xorgproto                                2025.1-1                       1.47 MiB
extra/xsettingsd                               1.0.4-1                        0.07 MiB
extra/xvidcore                                 1.3.7-4                        0.66 MiB
extra/xxhash                                   0.8.3-1                        0.39 MiB
core/xz                                        5.8.3-1                        2.97 MiB
extra/yaml-cpp                                 0.9.0-1                        0.46 MiB
extra/yyjson                                   0.12.0-1                       0.65 MiB
extra/zbar                                     0.23.93-7                      0.77 MiB
extra/zeromq                                   4.3.5-3                        3.03 MiB
extra/zimg                                     3.0.6-2                        0.70 MiB
extra/zint                                     2.16.0-2                       0.94 MiB
extra/zix                                      0.8.2-1                        0.13 MiB
core/zlib                                      1:1.3.2-3                      0.22 MiB
extra/zlib-ng                                  2.3.3-1                        0.28 MiB
core/zstd                                      1.5.7-3                        1.54 MiB
extra/zvbi                                     0.2.44-1                       1.07 MiB
extra/zxing-cpp                                3.1.0-1                        1.83 MiB
extra/adobe-source-han-sans-cn-fonts           2.005-2                       55.96 MiB
extra/adobe-source-han-sans-jp-fonts           2.005-2                       30.53 MiB
extra/adobe-source-han-sans-kr-fonts           2.005-2                       31.04 MiB
extra/adobe-source-sans-fonts                  3.052-2                        8.17 MiB
extra/alacritty                                0.17.0-1                       8.30 MiB
extra/alsa-firmware                            1.2.4-4                       14.12 MiB
extra/alsa-lib                                 1.2.16.1-1                     1.75 MiB
extra/alsa-plugins                             1:1.2.12-5                     0.38 MiB
extra/alsa-utils                               1.2.16-1                       2.47 MiB
core/amd-ucode                                 20260622-1                     0.59 MiB
extra/ananicy-cpp                              1.2.0-1                        0.51 MiB
vita-extra/apple_cursor                        2.0.1-1                       40.37 MiB
extra/arch-install-scripts                     31-1                           0.04 MiB
extra/arch-rebuild-order                       0.4.5-1                        0.72 MiB
extra/arch-repro-status                        1.4.3-3                        4.44 MiB
extra/arch-signoff                             0.5.2-7                        0.06 MiB
extra/ark                                      26.04.3-1                      5.05 MiB
extra/audacious                                4.6.1-1                        2.39 MiB
extra/aurorae                                  6.7.3-1                        0.62 MiB
extra/avahi                                    1:0.9rc5-1                     2.04 MiB
extra/awesome-terminal-fonts                   1.1.0-5                        0.37 MiB
core/b43-fwcutter                              019-6                          0.04 MiB
core/base                                      3-3                            0.00 MiB
core/base-devel                                1-2                            0.00 MiB
core/bash                                      5.3.15-1                       9.59 MiB
extra/bash-completion                          2.18.0-1                       0.99 MiB
extra/bcachefs-tools                           3:1.38.8-2                     7.77 MiB
chaotic-aur/bibata-cursor-theme                2.0.7-1.1                    321.65 MiB
extra/bind                                     9.20.24-1                      7.13 MiB
extra/bluedevil                                1:6.7.3-1                      2.58 MiB
extra/bluez                                    5.87-2                         1.73 MiB
extra/bluez-libs                               5.87-2                         0.31 MiB
extra/bluez-utils                              5.87-2                         3.69 MiB
chaotic-aur/brave-origin-bin                   1:1.92.141-1                 414.01 MiB
extra/breeze                                   6.7.3-1                       41.16 MiB
extra/breeze-cursors                           6.7.3-1                       29.25 MiB
extra/breeze-gtk                               6.7.3-1                        1.16 MiB
extra/breeze-plymouth                          6.7.3-1                        0.16 MiB
extra/brltty                                   6.9.1-3                        9.52 MiB
extra/broadcom-wl                              6.30.223.271-712               1.61 MiB
extra/btrfs-assistant                          2.2-5                          0.50 MiB
core/btrfs-progs                               7.1-1                          6.75 MiB
extra/btrfsmaintenance                         0.5.2-3                        0.06 MiB
vita-core/calamares                            3.4.2-2                       11.30 MiB
extra/capitaine-cursors                        4-3                           40.73 MiB
chaotic-aur/chaotic-keyring                    20251028-1                     0.02 MiB
chaotic-aur/chaotic-mirrorlist                 20260428-1                     0.01 MiB
extra/clang                                    22.1.8-1                     254.42 MiB
extra/clonezilla                               5.16.16-1                      3.40 MiB
extra/cloud-init                               26.1-1                         8.48 MiB
extra/cmake                                    4.4.0-1                      101.47 MiB
core/cryptsetup                                2.8.6-1                        3.29 MiB
extra/cups                                     2:2.4.19-1                    12.78 MiB
extra/cups-filters                             2.0.1-2                        1.18 MiB
extra/cups-pdf                                 3.0.3-1                        0.19 MiB
core/curl                                      8.21.0-1                       2.22 MiB
extra/darkhttpd                                1.17-1                         0.05 MiB
extra/ddrescue                                 1.30-2                         0.28 MiB
extra/dhcpcd                                   10.3.2-1                       0.48 MiB
core/diffutils                                 3.12-2                         1.50 MiB
extra/discover                                 6.7.3-1                        7.30 MiB
extra/dmidecode                                3.7-1                          0.20 MiB
core/dmraid                                    1.0.0.rc16.3-15                0.31 MiB
extra/dnsmasq                                  2.93-1                         1.10 MiB
extra/dolphin                                  26.04.3-1                     15.49 MiB
extra/dolphin-plugins                          26.04.3-1                      2.95 MiB
core/dosfstools                                4.2-5                          0.40 MiB
extra/dotnet-sdk                               10.0.10.sdk110-1             357.93 MiB
chaotic-aur/downgrade                          12.0.2-1                       0.08 MiB
chaotic-aur/dracula-icons-git                  1:1.0.0.r24.gde2a8ed-1        16.82 MiB
extra/drkonqi                                  6.7.3-1                        3.41 MiB
core/e2fsprogs                                 1.47.4-1                       5.28 MiB
extra/edk2-shell                               202605-1                       6.69 MiB
core/efibootmgr                                18-4                           0.08 MiB
extra/ethtool                                  1:7.1-1                        0.94 MiB
extra/exfatprogs                               1.4.2-1                        0.34 MiB
extra/f2fs-tools                               1.16.0-3                       0.57 MiB
extra/fatresize                                1.1.0-2                        0.02 MiB
extra/ffmpegthumbnailer                        2.3.0-1                        0.27 MiB
extra/ffmpegthumbs                             26.04.3-1                      0.09 MiB
extra/filelight                                26.04.3-1                      1.49 MiB
extra/firewall-applet                          2.5.0-1                        0.22 MiB
extra/firewalld                                2.5.0-1                        2.09 MiB
extra/fish                                     4.8.1-1                       18.19 MiB
extra/flatpak-kcm                              6.7.3-1                        0.75 MiB
extra/font-manager                             0.9.4-3                       11.34 MiB
extra/freetype2                                2.14.3-1                       1.66 MiB
extra/fsarchiver                               0.8.9-1                        0.25 MiB
core/gcc                                       16.1.1+r346+g4e03491b401d-4  220.16 MiB
extra/ghostscript                              10.07.1-1                     44.03 MiB
extra/git                                      2.55.0-1                      31.33 MiB
extra/git-lfs                                  3.7.1-1                       12.54 MiB
extra/gpart                                    0.3-6                          0.06 MiB
core/gpm                                       1.20.7.r38.ge82d1a6-6          0.38 MiB
extra/gptfdisk                                 1.0.10-2                       0.72 MiB
extra/grml-zsh-config                          0.19.28-1                      0.14 MiB
core/grub                                      2:2.14-1                      41.49 MiB
extra/grub-btrfs                               4.14-1                         0.10 MiB
extra/gsfonts                                  20200910-6                     3.11 MiB
extra/gst-libav                                1.28.5-2                       0.25 MiB
extra/gst-plugin-pipewire                      1:1.6.8-1                      0.17 MiB
extra/gst-plugin-va                            1.28.5-2                       0.55 MiB
extra/gst-plugins-bad                          1.28.5-2                       3.80 MiB
extra/gst-plugins-base                         1.28.5-2                       0.63 MiB
extra/gst-plugins-good                         1.28.5-2                       7.41 MiB
extra/gst-plugins-ugly                         1.28.5-2                       0.55 MiB
extra/gstreamer                                1.28.5-2                      11.91 MiB
extra/gwenview                                 26.04.3-1                     11.39 MiB
extra/haruna                                   1.8.1-1                        5.17 MiB
core/hdparm                                    9.65-3                         0.18 MiB
extra/hyperv                                   7.1.3-1                        0.22 MiB
extra/intel-ucode                              20260512-1                    30.70 MiB
extra/irssi                                    1.4.5-5                        2.14 MiB
core/iw                                        6.17-1                         0.28 MiB
extra/iwd                                      3.12-1                         2.18 MiB
core/jfsutils                                  1.1.15-9                       0.93 MiB
extra/kactivitymanagerd                        6.7.3-1                        0.73 MiB
extra/kamoso                                   26.04.3-1                      0.63 MiB
extra/kate                                     26.04.3-1                     35.41 MiB
extra/kcalc                                    26.04.3-1                      2.95 MiB
extra/kde-cli-tools                            6.7.3-1                        3.81 MiB
extra/kde-gtk-config                           6.7.3-1                        0.32 MiB
extra/kdeconnect                               26.04.3-1                      6.82 MiB
extra/kdecoration                              6.7.3-1                        0.38 MiB
extra/kdegraphics-thumbnailers                 26.04.3-1                      0.15 MiB
extra/kdenetwork-filesharing                   26.04.3-1                      1.28 MiB
extra/kdeplasma-addons                         6.7.3-1                       18.56 MiB
extra/kgamma                                   6.7.3-1                        0.37 MiB
extra/kglobalacceld                            6.7.3-1                        0.40 MiB
extra/kinfocenter                              6.7.3-1                        3.11 MiB
extra/kio-admin                                26.04.3-1                      0.31 MiB
extra/kitty-terminfo                           0.48.0-1                       0.00 MiB
extra/kmenuedit                                6.7.3-1                        1.93 MiB
extra/knighttime                               6.7.3-1                        0.19 MiB
extra/konsole                                  26.04.3-1                      9.76 MiB
extra/kpipewire                                6.7.3-1                        0.62 MiB
extra/krdp                                     6.7.3-1                        0.81 MiB
extra/kscreen                                  6.7.3-1                        3.39 MiB
extra/kscreenlocker                            6.7.3-1                        1.02 MiB
extra/ksshaskpass                              6.7.3-1                        0.13 MiB
extra/ksystemstats                             6.7.3-1                        1.59 MiB
extra/kwallet-pam                              6.7.3-1                        0.03 MiB
extra/kwalletmanager                           26.04.3-1                      2.77 MiB
extra/kwayland                                 6.7.3-1                        1.22 MiB
extra/kwayland-integration                     6.7.3-1                        0.14 MiB
extra/kwin                                     6.7.3-1                       31.99 MiB
extra/kwin-x11                                 6.7.3-1                       25.77 MiB
extra/kwrited                                  6.7.3-1                        0.04 MiB
extra/layer-shell-qt                           6.7.3-1                        0.14 MiB
core/ldns                                      1.9.2-1                        1.92 MiB
core/less                                      1:704-1                        0.32 MiB
extra/lftp                                     4.9.3-2                        2.26 MiB
extra/libadwaita                               1:1.9.2-1                      5.16 MiB
extra/libappindicator                          12.10.1-1                      0.34 MiB
extra/libde265                                 1.1.1-1                        0.94 MiB
extra/libdvdcss                                1.5.0-1                        0.05 MiB
extra/libfido2                                 1.17.0-1                       0.47 MiB
extra/libgsf                                   1.14.58-1                      1.48 MiB
extra/libkscreen                               6.7.3-1                        1.16 MiB
extra/libksysguard                             6.7.3-1                        3.45 MiB
extra/libopenraw                               0.3.7-2                        3.08 MiB
extra/libplasma                                6.7.3-1                        6.86 MiB
extra/libusb-compat                            0.1.9-1                        0.04 MiB
extra/linux-atm                                2.5.2-9                        1.17 MiB
core/linux-firmware                            20260622-1                     0.00 MiB
core/linux-firmware-marvell                    20260622-1                    79.45 MiB
vita-core/linux-vita                           7.1.1-1                      174.39 MiB
vita-core/linux-vita-headers                   7.1.1-1                      158.53 MiB
extra/lsb-release                              2.0.r55.a25a4fc-1              0.02 MiB
extra/lsscsi                                   0.32-2                         0.09 MiB
core/lvm2                                      2.03.41-1                      5.18 MiB
extra/lynx                                     2.9.3-1                        5.20 MiB
core/make                                      4.4.1-3                        1.66 MiB
core/man-db                                    2.13.1-2                       2.43 MiB
core/man-pages                                 6.18-1                         5.64 MiB
extra/mc                                       4.8.33-1                       7.07 MiB
core/mdadm                                     4.6-2                          1.02 MiB
extra/meld                                     3.24.0-1                       5.51 MiB
extra/memtest86+                               7.20-2                         0.15 MiB
extra/memtest86+-efi                           7.20-2                         0.15 MiB
extra/milou                                    6.7.3-1                        0.41 MiB
chaotic-aur/mintstick                          1.6.7-1                        0.23 MiB
core/mkinitcpio                                41-4                           0.21 MiB
extra/mkinitcpio-archiso                       73-1                           0.05 MiB
core/mkinitcpio-nfs-utils                      0.3-8                          0.06 MiB
chaotic-aur/mkinitcpio-openswap                0.1.1-1                        0.01 MiB
extra/mobile-broadband-provider-info           20251101-1                     0.50 MiB
extra/modemmanager                             1.24.2-1                       4.65 MiB
extra/mtools                                   1:4.0.49-1                     0.39 MiB
core/nano                                      9.1-1                          2.78 MiB
extra/nbd                                      3.27.1-4                       0.23 MiB
extra/ndisc6                                   1.0.8-1                        0.24 MiB
core/net-tools                                 2.10-3                         0.48 MiB
extra/netctl                                   1.29-2                         0.09 MiB
extra/network-manager-applet                   1.36.0-2                       0.59 MiB
extra/networkmanager                           1.56.1-2                      15.74 MiB
extra/networkmanager-openconnect               1.2.10-4                       3.00 MiB
extra/networkmanager-openvpn                   1.12.5-1                       1.47 MiB
core/nfs-utils                                 2.9.1-1                        1.31 MiB
core/nilfs-utils                               2.3.0-1                        0.38 MiB
extra/nmap                                     7.99-2                        26.15 MiB
chaotic-aur/nohang                             0.3.0-2                        0.26 MiB
extra/noto-fonts                               1:2026.07.01-1               106.81 MiB
extra/noto-fonts-emoji                         1:2.051-1                     10.18 MiB
extra/nss-mdns                                 0.15.1-2                       0.11 MiB
extra/ntfs-3g                                  2026.7.7-1                     0.17 MiB
extra/ntp                                      4.2.8.p18-6                    4.03 MiB
extra/nvme-cli                                 2.16-2                         2.01 MiB
extra/ocean-sound-theme                        6.7.3-1                        2.07 MiB
chaotic-aur/oh-my-posh-bin                     29.33.0-1                     19.23 MiB
extra/okular                                   26.04.3-1                     19.27 MiB
extra/open-iscsi                               2.1.12-1                       1.44 MiB
extra/open-vm-tools                            6:13.1.0-2                     4.75 MiB
extra/openconnect                              1:9.21-1                       4.87 MiB
core/openssh                                   10.4p1-2                       6.73 MiB
extra/openvpn                                  2.7.5-1                        1.77 MiB
extra/os-prober                                1.84-1                         0.06 MiB
extra/oxygen                                   6.7.3-1                       34.29 MiB
extra/oxygen-cursors                           6.7.3-1                       17.12 MiB
extra/oxygen-sounds                            6.7.3-1                        2.07 MiB
extra/packagekit-qt6                           1.1.4-2                        0.43 MiB
extra/pacquery                                 0.0.4-1                        0.69 MiB
nemesis_repo/pamac-aur                         11.7.4-3                       0.88 MiB
extra/partclone                                0.3.47-3                       1.80 MiB
extra/parted                                   3.7-1                          2.55 MiB
extra/partimage                                0.6.9-16                       0.73 MiB
extra/partitionmanager                         26.04.3-1                      6.76 MiB
extra/pavucontrol                              1:6.2-1                        1.04 MiB
extra/pcsclite                                 2.5.1-1                        0.31 MiB
extra/pipewire                                 1:1.6.8-1                      2.96 MiB
extra/pipewire-alsa                            1:1.6.8-1                      0.00 MiB
extra/pipewire-pulse                           1:1.6.8-1                      0.55 MiB
extra/plasma-activities                        6.7.3-1                        0.44 MiB
extra/plasma-activities-stats                  6.7.3-1                        0.29 MiB
extra/plasma-bigscreen                         6.7.3-1                        3.92 MiB
extra/plasma-browser-integration               6.7.3-1                        0.60 MiB
extra/plasma-desktop                           6.7.3-1                       40.10 MiB
extra/plasma-disks                             6.7.3-1                        0.61 MiB
extra/plasma-firewall                          6.7.3-1                        1.34 MiB
extra/plasma-integration                       6.7.3-1                        0.41 MiB
extra/plasma-keyboard                          6.7.3-1                        1.55 MiB
extra/plasma-login-manager                     6.7.3-1                        1.69 MiB
extra/plasma-nm                                6.7.3-1                       13.19 MiB
extra/plasma-pa                                6.7.3-1                        2.10 MiB
extra/plasma-sdk                               6.7.3-1                        3.20 MiB
extra/plasma-systemmonitor                     6.7.3-1                        2.62 MiB
extra/plasma-thunderbolt                       6.7.3-1                        0.54 MiB
extra/plasma-vault                             6.7.3-1                        1.24 MiB
extra/plasma-welcome                           6.7.3-1                        3.49 MiB
extra/plasma-workspace                         6.7.3-1                       55.57 MiB
extra/plasma-workspace-wallpapers              6.7.3-1                      255.05 MiB
extra/plasma-x11-session                       6.7.3-1                        0.00 MiB
extra/plasma5support                           6.7.3-1                        9.14 MiB
extra/plymouth                                 26.134.222-2                   2.19 MiB
extra/plymouth-kcm                             6.7.3-1                        0.31 MiB
extra/polkit-kde-agent                         6.7.3-1                        0.24 MiB
extra/poppler-glib                             26.07.0-1                      3.26 MiB
extra/poppler-qt5                              26.07.0-1                      0.91 MiB
extra/powerdevil                               6.7.3-1                        6.17 MiB
core/ppp                                       2.5.3-1                        0.92 MiB
core/pptpclient                                1.10.0-3                       0.10 MiB
extra/print-manager                            1:6.7.3-1                      2.71 MiB
extra/pv                                       1.11.0-1                       0.36 MiB
extra/qemu-guest-agent                         11.0.2-3                       1.05 MiB
extra/qqc2-breeze-style                        6.7.3-1                        2.74 MiB
extra/qt6-wayland                              6.11.1-1                       4.95 MiB
extra/refind                                   0.14.2-3                       1.89 MiB
extra/reflector                                2023-5                         0.15 MiB
extra/rsync                                    3.4.4-1                        0.71 MiB
extra/rustup                                   1.29.0-2                      11.36 MiB
extra/rxvt-unicode-terminfo                    9.31-9                         0.00 MiB
extra/screen                                   5.0.1-3                        0.76 MiB
extra/sddm-kcm                                 6.7.3-1                        0.59 MiB
core/sdparm                                    1.12-1                         0.47 MiB
extra/sg3_utils                                1.48-1                         3.22 MiB
extra/simple-scan                              50.0-1                         5.70 MiB
extra/smartmontools                            7.5-1                          2.07 MiB
extra/snapper                                  0.13.1-2                       3.53 MiB
chaotic-aur/snapper-support                    1.1.2-3.1                      0.00 MiB
chaotic-aur/snapper-tools                      1.3.2-1                        0.21 MiB
extra/sof-firmware                             2025.12.2-1                   42.80 MiB
extra/spectacle                                1:6.7.3-1                      6.18 MiB
extra/squashfs-tools                           4.7.5-1                        0.92 MiB
chaotic-aur/sublime-text-4                     4.4200-1                      51.12 MiB
core/sudo                                      1.9.17.p2-6                    7.85 MiB
core/syslinux                                  6.04.pre3.r3.g05ac953c-4       4.27 MiB
extra/system-config-printer                    1.5.18-6                       8.19 MiB
vita-core/systemd-liberated-git                262.r89994-1                 144.53 MiB
vita-core/systemd-liberated-libs-git           262.r89994-1                  18.15 MiB
vita-core/systemd-liberated-resolvconf-git     262.r89994-1                   0.00 MiB
vita-core/systemd-liberated-sysvcompat-git     262.r89994-1                   0.00 MiB
vita-core/systemd-liberated-tests-git          262.r89994-1                  74.84 MiB
vita-core/systemd-liberated-ukify-git          262.r89994-1                   0.10 MiB
extra/systemsettings                           6.7.3-1                        1.15 MiB
extra/tcpdump                                  4.99.6-1                       1.07 MiB
extra/terminus-font                            4.49.1-8                       3.03 MiB
extra/testdisk                                 7.2-4                          1.69 MiB
extra/tmux                                     3.7_b-1                        1.21 MiB
core/tpm2-tss                                  4.1.3-1                        3.27 MiB
extra/ttf-dejavu                               2.37+18+g9b5d1b2f-8            9.79 MiB
extra/ttf-droid                                20121017-11                   15.31 MiB
extra/ttf-fira-code                            6.2-4                          1.69 MiB
extra/ttf-firacode-nerd                        3.4.0-2                       45.57 MiB
extra/ttf-hack                                 3.003-7                        1.21 MiB
extra/ttf-meslo-nerd                           3.4.0-2                      194.60 MiB
chaotic-aur/ttf-meslo-nerd-font-powerlevel10k  2.3.3-1.1                      9.84 MiB
extra/ttf-roboto                               3.015-1                        8.98 MiB
extra/ttf-roboto-mono                          3.001-1                        1.26 MiB
extra/ttf-ubuntu-font-family                   1:0.83-2                       3.95 MiB
extra/tumbler                                  4.20.1-1                       0.86 MiB
extra/udftools                                 2.3-3                          0.39 MiB
extra/unace                                    2.5-11                         0.14 MiB
extra/union                                    6.7.3-1                        2.64 MiB
extra/unrar                                    1:7.2.7-1                      0.41 MiB
extra/unzip                                    6.0-23                         0.30 MiB
extra/usbmuxd                                  1.1.1-4                        0.09 MiB
core/usbutils                                  019-1                          0.37 MiB
extra/variety                                  0.9.0-1                        3.24 MiB
extra/vim                                      9.2.0804-1                     5.37 MiB
extra/vimix-cursors                            2020_02_24-6                   6.30 MiB
extra/virtualbox-guest-utils-nox               7.2.12-1                       1.88 MiB
vita-core/vita-alacritty-config                2-4                            0.00 MiB
vita-core/vita-calamares-config                1-9                           16.76 MiB
vita-core/vita-fish-settings                   1-4                            0.01 MiB
vita-core/vita-ghostty-config                  2-3                            0.00 MiB
vita-core/vita-gpu-scripts                     2-9                            0.03 MiB
vita-core/vita-hack-fonts                      1-2                            1.21 MiB
vita-core/vita-installation-config             3-2                            0.03 MiB
vita-core/vita-kde-dark                        1-7                            2.99 MiB
vita-core/vita-kde-settings                    3-1                            6.87 MiB
vita-core/vita-keyring                         20260530-1                     0.00 MiB
vita-core/vita-liquid-boot-animation           1-3                            1.30 MiB
vita-core/vita-os-ananicy-rules                1:1.1.44-1                     1.85 MiB
vita-core/vita-settings                        2-7                            0.05 MiB
vita-core/vita-terminal-config                 2-5                            0.01 MiB
vita-core/vita-ui-elements                     3-8                           10.63 MiB
vita-core/vita-wallpapers                      3-3                          625.50 MiB
vita-core/vita7z-kde-theme                     1-3                            0.82 MiB
vita-core/vitafetch                            2.64.2-2                       1.87 MiB
extra/vpnc                                     1:0.5.3.r557.r241-1            0.24 MiB
extra/wacomtablet                              6.7.3-1                        2.64 MiB
extra/wayland                                  1.25.0-1                       0.84 MiB
extra/wget                                     1.25.0-6                       5.70 MiB
extra/whois                                    5.6.6-1                        0.24 MiB
core/wireless-regdb                            2026.05.30-1                   0.02 MiB
extra/wireless_tools                           30.pre9-5                      0.34 MiB
core/wpa_supplicant                            2:2.11-5                       6.62 MiB
extra/wvdial                                   1.61-10                        0.18 MiB
extra/xdg-desktop-portal-kde                   6.7.3-1                        2.67 MiB
extra/xdg-user-dirs-gtk                        0.16-1                         0.19 MiB
extra/xdg-utils                                1.2.1-2                        0.30 MiB
extra/xf86-input-elographics                   1.4.4-2                        0.02 MiB
extra/xf86-input-evdev                         2.11.0-1                       0.07 MiB
extra/xf86-input-vmmouse                       13.2.0-2                       0.04 MiB
extra/xf86-input-wacom                         1.2.4-1                        0.23 MiB
extra/xf86-video-amdgpu                        25.0.0-1                       0.16 MiB
extra/xf86-video-fbdev                         0.5.1-1                        0.03 MiB
core/xfsprogs                                  7.0.1-1                        4.60 MiB
extra/xl2tpd                                   1.3.20-1                       0.13 MiB
extra/xorg-server                              21.1.24-1                      3.86 MiB
extra/xorg-xinit                               1.4.4-1                        0.04 MiB
extra/xorg-xkill                               1.0.7-1                        0.02 MiB
extra/xorg-xrandr                              1.5.4-1                        0.07 MiB
extra/xorg-xrdb                                1.2.3-1                        0.04 MiB
extra/xorg-xwayland                            24.1.13-1                      2.35 MiB
extra/yad                                      15.0-1                         0.61 MiB
chaotic-aur/yay                                13.0.1-1                      11.34 MiB
extra/zsh                                      5.9.2-1                        6.94 MiB
extra/zsh-autosuggestions                      0.7.1-1                        0.04 MiB
extra/zsh-completions                          0.36.0-1                       1.58 MiB
extra/zsh-syntax-highlighting                  0.8.0-2                        0.17 MiB

Total Installed Size:  9774.04 MiB

:: Proceed with installation? [Y/n] 
:: Retrieving packages...
 vita-keyring-20260530-1-any is up to date
(1299/1299) checking keys in keyring                                   [----------------------------------------] 100%
(1299/1299) checking package integrity                                 [----------------------------------------] 100%
(1299/1299) loading package files                                      [----------------------------------------] 100%
(1299/1299) checking for file conflicts                                [----------------------------------------] 100%
(1299/1299) checking available disk space                              [----------------------------------------] 100%
:: Processing package changes...
(   1/1299) installing amd-ucode                                       [----------------------------------------] 100%
(   2/1299) installing linux-api-headers                               [----------------------------------------] 100%
(   3/1299) installing tzdata                                          [----------------------------------------] 100%
Optional dependencies for tzdata
    bash: for tzselect [pending]
    glibc: for zdump, zic [pending]
(   4/1299) installing iana-etc                                        [----------------------------------------] 100%
(   5/1299) installing filesystem                                      [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/group installed as /home/retroTech/vita-build/x86_64/airootfs/etc/group.pacnew
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/gshadow installed as /home/retroTech/vita-build/x86_64/airootfs/etc/gshadow.pacnew
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/nsswitch.conf installed as /home/retroTech/vita-build/x86_64/airootfs/etc/nsswitch.conf.pacnew
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/passwd installed as /home/retroTech/vita-build/x86_64/airootfs/etc/passwd.pacnew
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/shadow installed as /home/retroTech/vita-build/x86_64/airootfs/etc/shadow.pacnew
(   6/1299) installing glibc                                           [----------------------------------------] 100%
Optional dependencies for glibc
    gd: for memusagestat [pending]
    perl: for mtrace [pending]
(   7/1299) installing libgcc                                          [----------------------------------------] 100%
(   8/1299) installing libstdc++                                       [----------------------------------------] 100%
(   9/1299) installing ncurses                                         [----------------------------------------] 100%
Optional dependencies for ncurses
    bash: for ncursesw6-config [pending]
(  10/1299) installing readline                                        [----------------------------------------] 100%
(  11/1299) installing bash                                            [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/skel/.bashrc installed as /home/retroTech/vita-build/x86_64/airootfs/etc/skel/.bashrc.pacnew
Optional dependencies for bash
    bash-completion: for tab completion [pending]
(  12/1299) installing gmp                                             [----------------------------------------] 100%
(  13/1299) installing mpfr                                            [----------------------------------------] 100%
(  14/1299) installing gawk                                            [----------------------------------------] 100%
(  15/1299) installing acl                                             [----------------------------------------] 100%
(  16/1299) installing attr                                            [----------------------------------------] 100%
(  17/1299) installing zlib                                            [----------------------------------------] 100%
(  18/1299) installing sqlite                                          [----------------------------------------] 100%
(  19/1299) installing util-linux-libs                                 [----------------------------------------] 100%
Optional dependencies for util-linux-libs
    python: python bindings to libmount [pending]
(  20/1299) installing e2fsprogs                                       [----------------------------------------] 100%
Optional dependencies for e2fsprogs
    lvm2: for e2scrub [pending]
    util-linux: for e2scrub [pending]
    smtp-forwarder: for e2scrub_fail script
(  21/1299) installing keyutils                                        [----------------------------------------] 100%
(  22/1299) installing gdbm                                            [----------------------------------------] 100%
(  23/1299) installing brotli                                          [----------------------------------------] 100%
(  24/1299) installing xz                                              [----------------------------------------] 100%
(  25/1299) installing lz4                                             [----------------------------------------] 100%
(  26/1299) installing zstd                                            [----------------------------------------] 100%
(  27/1299) installing openssl                                         [----------------------------------------] 100%
Optional dependencies for openssl
    ca-certificates [pending]
    perl [pending]
(  28/1299) installing libsasl                                         [----------------------------------------] 100%
(  29/1299) installing libldap                                         [----------------------------------------] 100%
(  30/1299) installing libevent                                        [----------------------------------------] 100%
Optional dependencies for libevent
    python: event_rpcgen.py [pending]
(  31/1299) installing libverto                                        [----------------------------------------] 100%
(  32/1299) installing lmdb                                            [----------------------------------------] 100%
(  33/1299) installing krb5                                            [----------------------------------------] 100%
(  34/1299) installing libcap-ng                                       [----------------------------------------] 100%
(  35/1299) installing audit                                           [----------------------------------------] 100%
Optional dependencies for audit
    audispd-plugins: for audit event dispatcher plugins
    audispd-plugins-zos: for z/OS audit event dispatcher plugin
(  36/1299) installing libxcrypt                                       [----------------------------------------] 100%
(  37/1299) installing libtirpc                                        [----------------------------------------] 100%
(  38/1299) installing libnsl                                          [----------------------------------------] 100%
(  39/1299) installing pambase                                         [----------------------------------------] 100%
(  40/1299) installing libasan                                         [----------------------------------------] 100%
(  41/1299) installing libatomic                                       [----------------------------------------] 100%
(  42/1299) installing libgfortran                                     [----------------------------------------] 100%
(  43/1299) installing libgomp                                         [----------------------------------------] 100%
(  44/1299) installing libhwasan                                       [----------------------------------------] 100%
(  45/1299) installing liblsan                                         [----------------------------------------] 100%
(  46/1299) installing libobjc                                         [----------------------------------------] 100%
(  47/1299) installing libquadmath                                     [----------------------------------------] 100%
(  48/1299) installing libtsan                                         [----------------------------------------] 100%
(  49/1299) installing libubsan                                        [----------------------------------------] 100%
(  50/1299) installing gcc-libs                                        [----------------------------------------] 100%
(  51/1299) installing libgpg-error                                    [----------------------------------------] 100%
(  52/1299) installing libgcrypt                                       [----------------------------------------] 100%
(  53/1299) installing systemd-liberated-libs-git                      [----------------------------------------] 100%
(  54/1299) installing pam                                             [----------------------------------------] 100%
(  55/1299) installing libcap                                          [----------------------------------------] 100%
(  56/1299) installing coreutils                                       [----------------------------------------] 100%
(  57/1299) installing bzip2                                           [----------------------------------------] 100%
(  58/1299) installing pcre2                                           [----------------------------------------] 100%
Optional dependencies for pcre2
    sh: for pcre2-config [installed]
(  59/1299) installing grep                                            [----------------------------------------] 100%
(  60/1299) installing findutils                                       [----------------------------------------] 100%
(  61/1299) installing libtasn1                                        [----------------------------------------] 100%
(  62/1299) installing libffi                                          [----------------------------------------] 100%
(  63/1299) installing libp11-kit                                      [----------------------------------------] 100%
(  64/1299) installing p11-kit                                         [----------------------------------------] 100%
(  65/1299) installing ca-certificates-utils                           [----------------------------------------] 100%
(  66/1299) installing ca-certificates-mozilla                         [----------------------------------------] 100%
(  67/1299) installing ca-certificates                                 [----------------------------------------] 100%
(  68/1299) installing libunistring                                    [----------------------------------------] 100%
(  69/1299) installing libidn2                                         [----------------------------------------] 100%
(  70/1299) installing libnghttp2                                      [----------------------------------------] 100%
(  71/1299) installing libnghttp3                                      [----------------------------------------] 100%
(  72/1299) installing nettle                                          [----------------------------------------] 100%
(  73/1299) installing leancrypto                                      [----------------------------------------] 100%
(  74/1299) installing gnutls                                          [----------------------------------------] 100%
Optional dependencies for gnutls
    tpm2-tss: support for TPM2 wrapped keys [pending]
(  75/1299) installing libngtcp2                                       [----------------------------------------] 100%
(  76/1299) installing libpsl                                          [----------------------------------------] 100%
(  77/1299) installing libssh2                                         [----------------------------------------] 100%
(  78/1299) installing curl                                            [----------------------------------------] 100%
(  79/1299) installing json-c                                          [----------------------------------------] 100%
(  80/1299) installing gnulib-l10n                                     [----------------------------------------] 100%
(  81/1299) installing icu                                             [----------------------------------------] 100%
(  82/1299) installing libxml2                                         [----------------------------------------] 100%
Optional dependencies for libxml2
    python: Python bindings [pending]
(  83/1299) installing gettext                                         [----------------------------------------] 100%
Optional dependencies for gettext
    git: for autopoint infrastructure updates [pending]
    appstream: for appstream support [pending]
(  84/1299) installing libksba                                         [----------------------------------------] 100%
(  85/1299) installing libusb                                          [----------------------------------------] 100%
(  86/1299) installing libassuan                                       [----------------------------------------] 100%
(  87/1299) installing libsysprof-capture                              [----------------------------------------] 100%
(  88/1299) installing glib2                                           [----------------------------------------] 100%
Optional dependencies for glib2
    dconf: GSettings storage backend [pending]
    glib2-devel: development tools
    gvfs: most gio functionality
(  89/1299) installing tpm2-tss                                        [----------------------------------------] 100%
(  90/1299) installing libsecret                                       [----------------------------------------] 100%
Optional dependencies for libsecret
    org.freedesktop.secrets: secret storage backend [pending]
(  91/1299) installing pinentry                                        [----------------------------------------] 100%
Optional dependencies for pinentry
    gcr: GNOME backend [pending]
    gtk3: GTK backend [pending]
    kguiaddons: Qt6 backend [pending]
    kwindowsystem: Qt6 backend [pending]
(  92/1299) installing npth                                            [----------------------------------------] 100%
(  93/1299) installing gnupg                                           [----------------------------------------] 100%
Optional dependencies for gnupg
    pcsclite: for using scdaemon not with the gnupg internal card driver [pending]
(  94/1299) installing gpgme                                           [----------------------------------------] 100%
(  95/1299) installing libarchive                                      [----------------------------------------] 100%
(  96/1299) installing pacman-mirrorlist                               [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/pacman.d/mirrorlist installed as /home/retroTech/vita-build/x86_64/airootfs/etc/pacman.d/mirrorlist.pacnew
(  97/1299) installing device-mapper                                   [----------------------------------------] 100%
(  98/1299) installing popt                                            [----------------------------------------] 100%
(  99/1299) installing cryptsetup                                      [----------------------------------------] 100%
( 100/1299) installing expat                                           [----------------------------------------] 100%
( 101/1299) installing dbus                                            [----------------------------------------] 100%
( 102/1299) installing dbus-broker                                     [----------------------------------------] 100%
( 103/1299) installing dbus-broker-units                               [----------------------------------------] 100%
( 104/1299) installing dbus-units                                      [----------------------------------------] 100%
( 105/1299) installing sed                                             [----------------------------------------] 100%
( 106/1299) installing gzip                                            [----------------------------------------] 100%
Optional dependencies for gzip
    less: zless support [pending]
    util-linux: zmore support [pending]
    diffutils: zdiff/zcmp support [pending]
( 107/1299) installing kbd                                             [----------------------------------------] 100%
( 108/1299) installing kmod                                            [----------------------------------------] 100%
( 109/1299) installing hwdata                                          [----------------------------------------] 100%
( 110/1299) installing libelf                                          [----------------------------------------] 100%
( 111/1299) installing libseccomp                                      [----------------------------------------] 100%
( 112/1299) installing file                                            [----------------------------------------] 100%
( 113/1299) installing shadow                                          [----------------------------------------] 100%
( 114/1299) installing util-linux                                      [----------------------------------------] 100%
Optional dependencies for util-linux
    words: default dictionary for look
( 115/1299) installing systemd-liberated-git                           [----------------------------------------] 100%
Initializing machine ID from random generator.
Creating group 'mem' with GID 8.
Creating group 'ftp' with GID 11.
Creating group 'mail' with GID 12.
Creating group 'log' with GID 19.
Creating group 'smmsp' with GID 25.
Creating group 'proc' with GID 26.
Creating group 'games' with GID 50.
Creating group 'lock' with GID 54.
Creating group 'floppy' with GID 94.
Creating group 'scanner' with GID 96.
Creating group 'nobody' with GID 65534.
Creating group 'empower' with GID 997.
Creating group 'utmp' with GID 996.
Creating group 'clock' with GID 994.
Creating group 'disk' with GID 993.
Creating group 'input' with GID 992.
Creating group 'kmem' with GID 991.
Creating group 'kvm' with GID 989.
Creating group 'lp' with GID 984.
Creating group 'render' with GID 982.
Creating group 'sgx' with GID 981.
Creating group 'tty' with GID 5.
Creating group 'systemd-journal' with GID 980.
Creating group 'bin' with GID 1.
Creating user 'bin' (n/a) with UID 1 and GID 1.
Creating group 'daemon' with GID 2.
Creating user 'daemon' (n/a) with UID 2 and GID 2.
Creating user 'mail' (n/a) with UID 8 and GID 12.
Creating user 'ftp' (n/a) with UID 14 and GID 11.
Creating group 'http' with GID 33.
Creating user 'http' (n/a) with UID 33 and GID 33.
Creating user 'nobody' (Kernel Overflow User) with UID 65534 and GID 65534.
Creating group 'dbus' with GID 81.
Creating user 'dbus' (System Message Bus) with UID 81 and GID 81.
Creating group 'systemd-coredump' with GID 979.
Creating user 'systemd-coredump' (systemd Core Dumper) with UID 979 and GID 979.
Creating group 'systemd-imds' with GID 978.
Creating user 'systemd-imds' (systemd Instance Metadata) with UID 978 and GID 978.
Creating group 'systemd-network' with GID 977.
Creating user 'systemd-network' (systemd Network Management) with UID 977 and GID 977.
Creating group 'systemd-oom' with GID 976.
Creating user 'systemd-oom' (systemd Userspace OOM Killer) with UID 976 and GID 976.
Creating group 'systemd-journal-remote' with GID 975.
Creating user 'systemd-journal-remote' (systemd Journal Remote) with UID 975 and GID 975.
Creating group 'systemd-resolve' with GID 974.
Creating user 'systemd-resolve' (systemd Resolver) with UID 974 and GID 974.
Creating group 'systemd-timesync' with GID 973.
Creating user 'systemd-timesync' (systemd Time Synchronization) with UID 973 and GID 973.
Creating group 'tss' with GID 972.
Creating user 'tss' (tss user for tpm2) with UID 972 and GID 972.
Creating group 'uuidd' with GID 971.
Creating user 'uuidd' (UUID generator helper daemon) with UID 971 and GID 971.
Created symlink '/etc/systemd/system/autovt@tty1.service' → '/usr/lib/systemd/system/getty@.service'.
Optional dependencies for systemd-liberated-git
    libmicrohttpd: systemd-journal-gatewayd and systemd-journal-remote
    apparmor: additional security features
    quota-tools: kernel-level quota management
    systemd-liberated-sysvcompat-git: symlink package to provide sysvinit binaries [pending]
    systemd-liberated-ukify-git=262.r89994: combine kernel and initrd into a signed Unified Kernel Image [pending]
    polkit: allow administration as unprivileged user [pending]
    curl: systemd-journal-upload, machinectl pull-tar and pull-raw [installed]
    gnutls: systemd-journal-gatewayd and systemd-journal-remote [installed]
    qrencode: show QR codes [pending]
    iptables: firewall features [pending]
    libarchive: convert DDIs to tarballs [installed]
    libbpf: support BPF programs [pending]
    libpwquality: check password quality [pending]
    libfido2: unlocking LUKS2 volumes with FIDO2 token [pending]
    libp11-kit: support PKCS#11 [installed]
    tpm2-tss: unlocking LUKS2 volumes with TPM2 [installed]
( 116/1299) installing jansson                                         [----------------------------------------] 100%
( 117/1299) installing binutils                                        [----------------------------------------] 100%
Optional dependencies for binutils
    debuginfod: for debuginfod server/client functionality
    perl: for gprofng-display-html [pending]
( 118/1299) installing libmakepkg-dropins                              [----------------------------------------] 100%
( 119/1299) installing pacman                                          [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/pacman.conf installed as /home/retroTech/vita-build/x86_64/airootfs/etc/pacman.conf.pacnew
Optional dependencies for pacman
    base-devel: required to use makepkg [pending]
    perl-locale-gettext: translation support in makepkg-template
( 120/1299) installing arch-install-scripts                            [----------------------------------------] 100%
( 121/1299) installing b43-fwcutter                                    [----------------------------------------] 100%
( 122/1299) installing procps-ng                                       [----------------------------------------] 100%
( 123/1299) installing tar                                             [----------------------------------------] 100%
( 124/1299) installing pciutils                                        [----------------------------------------] 100%
Optional dependencies for pciutils
    which: for update-pciids [pending]
    grep: for update-pciids [installed]
    curl: for update-pciids [installed]
( 125/1299) installing psmisc                                          [----------------------------------------] 100%
( 126/1299) installing licenses                                        [----------------------------------------] 100%
( 127/1299) installing archlinux-keyring                               [----------------------------------------] 100%
( 128/1299) installing systemd-liberated-sysvcompat-git                [----------------------------------------] 100%
( 129/1299) installing iputils                                         [----------------------------------------] 100%
( 130/1299) installing libmnl                                          [----------------------------------------] 100%
( 131/1299) installing libnfnetlink                                    [----------------------------------------] 100%
( 132/1299) installing libnetfilter_conntrack                          [----------------------------------------] 100%
( 133/1299) installing libnftnl                                        [----------------------------------------] 100%
( 134/1299) installing libnl                                           [----------------------------------------] 100%
( 135/1299) installing libpcap                                         [----------------------------------------] 100%
( 136/1299) installing nftables                                        [----------------------------------------] 100%
Optional dependencies for nftables
    python: Python bindings [pending]
    python-jsonschema: Python bindings [pending]
( 137/1299) installing iptables                                        [----------------------------------------] 100%
( 138/1299) installing libbpf                                          [----------------------------------------] 100%
( 139/1299) installing iproute2                                        [----------------------------------------] 100%
Optional dependencies for iproute2
    db: userspace arp daemon
    linux-atm: ATM support [pending]
    python: for routel [pending]
( 140/1299) installing base                                            [----------------------------------------] 100%
Optional dependencies for base
    linux: bare metal support [pending]
( 141/1299) installing fuse-common                                     [----------------------------------------] 100%
( 142/1299) installing fuse3                                           [----------------------------------------] 100%
( 143/1299) installing libaio                                          [----------------------------------------] 100%
( 144/1299) installing libsodium                                       [----------------------------------------] 100%
( 145/1299) installing libunwind                                       [----------------------------------------] 100%
( 146/1299) installing liburcu                                         [----------------------------------------] 100%
( 147/1299) installing bcachefs-tools                                  [----------------------------------------] 100%
( 148/1299) installing alsa-topology-conf                              [----------------------------------------] 100%
( 149/1299) installing alsa-ucm-conf                                   [----------------------------------------] 100%
( 150/1299) installing alsa-lib                                        [----------------------------------------] 100%
( 151/1299) installing dconf                                           [----------------------------------------] 100%
( 152/1299) installing gsettings-system-schemas                        [----------------------------------------] 100%
( 153/1299) installing adwaita-fonts                                   [----------------------------------------] 100%
( 154/1299) installing gsettings-desktop-schemas                       [----------------------------------------] 100%
( 155/1299) installing xcb-proto                                       [----------------------------------------] 100%
( 156/1299) installing xorgproto                                       [----------------------------------------] 100%
( 157/1299) installing libxdmcp                                        [----------------------------------------] 100%
( 158/1299) installing libxau                                          [----------------------------------------] 100%
( 159/1299) installing libxcb                                          [----------------------------------------] 100%
( 160/1299) installing libx11                                          [----------------------------------------] 100%
( 161/1299) installing libxext                                         [----------------------------------------] 100%
( 162/1299) installing libxfixes                                       [----------------------------------------] 100%
( 163/1299) installing libxi                                           [----------------------------------------] 100%
( 164/1299) installing libxtst                                         [----------------------------------------] 100%
( 165/1299) installing xorg-xprop                                      [----------------------------------------] 100%
( 166/1299) installing at-spi2-core                                    [----------------------------------------] 100%
( 167/1299) installing bluez-libs                                      [----------------------------------------] 100%
( 168/1299) installing libasyncns                                      [----------------------------------------] 100%
( 169/1299) installing libogg                                          [----------------------------------------] 100%
( 170/1299) installing flac                                            [----------------------------------------] 100%
( 171/1299) installing mpg123                                          [----------------------------------------] 100%
Optional dependencies for mpg123
    sdl2: for sdl audio support [pending]
    jack: for jack audio support [pending]
    libpulse: for pulse audio support [pending]
    perl: for conplay [pending]
( 172/1299) installing lame                                            [----------------------------------------] 100%
( 173/1299) installing libvorbis                                       [----------------------------------------] 100%
( 174/1299) installing opus                                            [----------------------------------------] 100%
( 175/1299) installing libsndfile                                      [----------------------------------------] 100%
Optional dependencies for libsndfile
    alsa-lib: for sndfile-play [installed]
( 176/1299) installing libpulse                                        [----------------------------------------] 100%
Optional dependencies for libpulse
    pulse-native-provider: PulseAudio backend [pending]
( 177/1299) installing pcaudiolib                                      [----------------------------------------] 100%
( 178/1299) installing libsonic                                        [----------------------------------------] 100%
( 179/1299) installing espeak-ng                                       [----------------------------------------] 100%
( 180/1299) installing gpm                                             [----------------------------------------] 100%
( 181/1299) installing libyaml                                         [----------------------------------------] 100%
( 182/1299) installing liblouis                                        [----------------------------------------] 100%
Optional dependencies for liblouis
    python: Python bindings [pending]
( 183/1299) installing libtool                                         [----------------------------------------] 100%
( 184/1299) installing libspeechd                                      [----------------------------------------] 100%
( 185/1299) installing libice                                          [----------------------------------------] 100%
( 186/1299) installing libsm                                           [----------------------------------------] 100%
( 187/1299) installing libxt                                           [----------------------------------------] 100%
( 188/1299) installing libxmu                                          [----------------------------------------] 100%
( 189/1299) installing libxpm                                          [----------------------------------------] 100%
( 190/1299) installing libxaw                                          [----------------------------------------] 100%
( 191/1299) installing duktape                                         [----------------------------------------] 100%
( 192/1299) installing polkit                                          [----------------------------------------] 100%
( 193/1299) installing brltty                                          [----------------------------------------] 100%
brltty-genkey: key generated
Please add your user to the brlapi group.
Optional dependencies for brltty
    brltty-udev-generic: for initializing brltty with generic USB devices
    dracut-brltty: for dracut modules
    java-brltty: for Java bindings
    ocaml-brltty: for OCaml bindings
    python-brltty: for Python bindings
    speech-dispatcher: speech-dispatcher driver
    tcl-brltty: for TCL bindings
( 194/1299) installing mkinitcpio-busybox                              [----------------------------------------] 100%
( 195/1299) installing diffutils                                       [----------------------------------------] 100%
( 196/1299) installing mkinitcpio                                      [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/mkinitcpio.conf installed as /home/retroTech/vita-build/x86_64/airootfs/etc/mkinitcpio.conf.pacnew
Optional dependencies for mkinitcpio
    xz: Use lzma or xz compression for the initramfs image [installed]
    bzip2: Use bzip2 compression for the initramfs image [installed]
    lzop: Use lzo compression for the initramfs image [pending]
    lz4: Use lz4 compression for the initramfs image [installed]
    mkinitcpio-nfs-utils: Support for root filesystem on NFS [pending]
    systemd-ukify: alternative UKI generator [pending]
( 197/1299) installing linux                                           [----------------------------------------] 100%
Optional dependencies for linux
    linux-headers: headers and scripts for building modules
    linux-firmware: firmware images needed for some devices [pending]
    scx-scheds: to use sched-ext schedulers
    wireless-regdb: to set the correct wireless channels of your country [pending]
( 198/1299) installing broadcom-wl                                     [----------------------------------------] 100%
( 199/1299) installing lzo                                             [----------------------------------------] 100%
( 200/1299) installing btrfs-progs                                     [----------------------------------------] 100%
Optional dependencies for btrfs-progs
    python: libbtrfsutil python bindings [pending]
    e2fsprogs: btrfs-convert [installed]
( 201/1299) installing db5.3                                           [----------------------------------------] 100%
( 202/1299) installing perl                                            [----------------------------------------] 100%
( 203/1299) installing bc                                              [----------------------------------------] 100%
( 204/1299) installing drbl                                            [----------------------------------------] 100%
( 205/1299) installing nilfs-utils                                     [----------------------------------------] 100%
( 206/1299) installing fuse2                                           [----------------------------------------] 100%
( 207/1299) installing libntfs-3g                                      [----------------------------------------] 100%
( 208/1299) installing ntfs-3g                                         [----------------------------------------] 100%
Optional dependencies for ntfs-3g
    ntfsprogs: userspace utilities [pending]
( 209/1299) installing xxhash                                          [----------------------------------------] 100%
( 210/1299) installing partclone                                       [----------------------------------------] 100%
( 211/1299) installing ntfsprogs                                       [----------------------------------------] 100%
( 212/1299) installing pcre                                            [----------------------------------------] 100%
( 213/1299) installing slang                                           [----------------------------------------] 100%
( 214/1299) installing libnewt                                         [----------------------------------------] 100%
Optional dependencies for libnewt
    python: libnewt support with the _snack module [pending]
    tcl: whiptcl support
( 215/1299) installing partimage                                       [----------------------------------------] 100%
( 216/1299) installing pigz                                            [----------------------------------------] 100%
( 217/1299) installing libedit                                         [----------------------------------------] 100%
( 218/1299) installing openssh                                         [----------------------------------------] 100%
Optional dependencies for openssh
    libfido2: FIDO/U2F support [pending]
    sh: for ssh-copy-id and findssl.sh [installed]
    x11-ssh-askpass: input passphrase in X [pending]
    xorg-xauth: X11 forwarding [pending]
( 219/1299) installing sshfs                                           [----------------------------------------] 100%
( 220/1299) installing parted                                          [----------------------------------------] 100%
( 221/1299) installing gptfdisk                                        [----------------------------------------] 100%
( 222/1299) installing dosfstools                                      [----------------------------------------] 100%
( 223/1299) installing pbzip2                                          [----------------------------------------] 100%
( 224/1299) installing lbzip2                                          [----------------------------------------] 100%
( 225/1299) installing lrzip                                           [----------------------------------------] 100%
( 226/1299) installing pixz                                            [----------------------------------------] 100%
( 227/1299) installing lzop                                            [----------------------------------------] 100%
( 228/1299) installing mpdecimal                                       [----------------------------------------] 100%
( 229/1299) installing python                                          [----------------------------------------] 100%
Optional dependencies for python
    python-setuptools: for building Python packages using tooling that is usually bundled with Python
    python-pip: for installing Python packages using tooling that is usually bundled with Python
    python-pipx: for installing Python software not packaged on Arch Linux
    sqlite: for a default database integration [installed]
    xz: for lzma [installed]
    tk: for tkinter
( 230/1299) installing boost-libs                                      [----------------------------------------] 100%
Optional dependencies for boost-libs
    openmpi: for mpi support
( 231/1299) installing libtorrent-rasterbar                            [----------------------------------------] 100%
( 232/1299) installing nspr                                            [----------------------------------------] 100%
( 233/1299) installing nss                                             [----------------------------------------] 100%
( 234/1299) installing ecryptfs-utils                                  [----------------------------------------] 100%
Optional dependencies for ecryptfs-utils
    lsof: Encrypted home directory with ecryptfs-migrate-home
    rsync: Encrypted home directory with ecryptfs-migrate-home [pending]
    which: Encrypted home directory with ecryptfs-migrate-home [pending]
( 235/1299) installing libutempter                                     [----------------------------------------] 100%
( 236/1299) installing screen                                          [----------------------------------------] 100%
( 237/1299) installing libmd                                           [----------------------------------------] 100%
( 238/1299) installing libbsd                                          [----------------------------------------] 100%
( 239/1299) installing libwbclient                                     [----------------------------------------] 100%
Optional dependencies for libwbclient
    python-dnspython: samba_dnsupdate and samba_upgradedns in AD setup
    python-markdown: for samba-tool domain schemeupgrade
    glusterfs: for vfs_glusterfs support
( 240/1299) installing talloc                                          [----------------------------------------] 100%
Optional dependencies for talloc
    python: for python bindings [installed]
( 241/1299) installing cifs-utils                                      [----------------------------------------] 100%
Optional dependencies for cifs-utils
    python: for smb2-quota and smbinfo script [installed]
( 242/1299) installing net-tools                                       [----------------------------------------] 100%
( 243/1299) installing which                                           [----------------------------------------] 100%
( 244/1299) installing oniguruma                                       [----------------------------------------] 100%
( 245/1299) installing jq                                              [----------------------------------------] 100%
( 246/1299) installing clonezilla                                      [----------------------------------------] 100%
Optional dependencies for clonezilla
    netcat [pending]
( 247/1299) installing dhcpcd                                          [----------------------------------------] 100%
Optional dependencies for dhcpcd
    openresolv: resolvconf support [pending]
( 248/1299) installing openbsd-netcat                                  [----------------------------------------] 100%
( 249/1299) installing python-configobj                                [----------------------------------------] 100%
( 250/1299) installing python-markupsafe                               [----------------------------------------] 100%
( 251/1299) installing python-jinja                                    [----------------------------------------] 100%
Optional dependencies for python-jinja
    python-babel: for i18n support
( 252/1299) installing python-jsonpointer                              [----------------------------------------] 100%
( 253/1299) installing python-jsonpatch                                [----------------------------------------] 100%
( 254/1299) installing python-attrs                                    [----------------------------------------] 100%
( 255/1299) installing python-rpds-py                                  [----------------------------------------] 100%
( 256/1299) installing python-referencing                              [----------------------------------------] 100%
( 257/1299) installing python-jsonschema-specifications                [----------------------------------------] 100%
( 258/1299) installing python-jsonschema                               [----------------------------------------] 100%
Optional dependencies for python-jsonschema
    python-isoduration: for duration format
    python-fqdn: for hostname format
    python-idna: for idn-hostname format [pending]
    python-jsonpointer: for json-pointer & relative-json-pointer format [installed]
    python-rfc3339-validator: for date-time format
    python-rfc3987: for iri, iri-reference, uri & uri-reference format
    python-uri-template: for uri-template format
    python-webcolors: for color format
( 259/1299) installing python-netifaces                                [----------------------------------------] 100%
( 260/1299) installing python-oauthlib                                 [----------------------------------------] 100%
Optional dependencies for python-oauthlib
    python-blinker: for signals support
    python-cryptography: for RSA and signed token support [pending]
    python-pyjwt: for signed token support
( 261/1299) installing python-pyserial                                 [----------------------------------------] 100%
( 262/1299) installing python-yaml                                     [----------------------------------------] 100%
( 263/1299) installing python-charset-normalizer                       [----------------------------------------] 100%
( 264/1299) installing python-idna                                     [----------------------------------------] 100%
( 265/1299) installing python-urllib3                                  [----------------------------------------] 100%
Optional dependencies for python-urllib3
    python-brotli: Brotli support
    python-brotlicffi: Brotli support
    python-h2: HTTP/2 support
    python-pysocks: SOCKS support
( 266/1299) installing python-certifi                                  [----------------------------------------] 100%
( 267/1299) installing python-requests                                 [----------------------------------------] 100%
Optional dependencies for python-requests
    python-chardet: alternative character encoding library
    python-pysocks: SOCKS proxy support
( 268/1299) installing python-typing_extensions                        [----------------------------------------] 100%
( 269/1299) installing sudo                                            [----------------------------------------] 100%
( 270/1299) installing cloud-init                                      [----------------------------------------] 100%
Optional dependencies for cloud-init
    cloud-guest-utils: for growpart
    netplan: for configuring network using netplan
    python-passlib: for Azure and BSD support
    python-urllib3: for LXD and Scaleway data sources [installed]
( 271/1299) installing darkhttpd                                       [----------------------------------------] 100%
( 272/1299) installing ddrescue                                        [----------------------------------------] 100%
( 273/1299) installing dmidecode                                       [----------------------------------------] 100%
( 274/1299) installing dmraid                                          [----------------------------------------] 100%
( 275/1299) installing edk2-shell                                      [----------------------------------------] 100%
( 276/1299) installing efivar                                          [----------------------------------------] 100%
( 277/1299) installing efibootmgr                                      [----------------------------------------] 100%
( 278/1299) installing exfatprogs                                      [----------------------------------------] 100%
( 279/1299) installing f2fs-tools                                      [----------------------------------------] 100%
( 280/1299) installing fatresize                                       [----------------------------------------] 100%
( 281/1299) installing fsarchiver                                      [----------------------------------------] 100%
( 282/1299) installing gpart                                           [----------------------------------------] 100%
( 283/1299) installing zsh                                             [----------------------------------------] 100%
Optional dependencies for zsh
    grml-zsh-config: grml's zsh setup [pending]
    zsh-autosuggestions: Fish-like autosuggestions for zsh [pending]
    zsh-completions: Additional completion definitions for Zsh [pending]
    zsh-doc: Info, HTML and PDF format of the ZSH documentation
    zsh-history-substring-search: ZSH port of Fish history search (up arrow)
    zsh-lovers: A collection of tips, tricks and examples for the Z shell.
    zsh-syntax-highlighting: Fish shell like syntax highlighting for Zsh [pending]
    zshdb: A debugger for zsh scripts
( 284/1299) installing grml-zsh-config                                 [----------------------------------------] 100%
( 285/1299) installing grub                                            [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/default/grub installed as /home/retroTech/vita-build/x86_64/airootfs/etc/default/grub.pacnew
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/grub.d/40_custom installed as /home/retroTech/vita-build/x86_64/airootfs/etc/grub.d/40_custom.pacnew
:: Install your bootloader and generate configuration with:
     # grub-install ...
     # grub-mkconfig -o /boot/grub/grub.cfg
Optional dependencies for grub
    dosfstools: For grub-mkrescue FAT FS and EFI support [installed]
    efibootmgr: For grub-install EFI support [installed]
    freetype2: For grub-mkfont usage [pending]
    fuse3: For grub-mount usage [installed]
    libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue
    libusb: For grub-emu USB support [installed]
    lzop: For grub-mkrescue LZO support [installed]
    mtools: For grub-mkrescue FAT FS support [pending]
    os-prober: To detect other OSes when generating grub.cfg in BIOS systems [pending]
    sdl: For grub-emu SDL support
( 286/1299) installing hdparm                                          [----------------------------------------] 100%
( 287/1299) installing hyperv                                          [----------------------------------------] 100%
( 288/1299) installing intel-ucode                                     [----------------------------------------] 100%
( 289/1299) installing libotr                                          [----------------------------------------] 100%
( 290/1299) installing irssi                                           [----------------------------------------] 100%
Optional dependencies for irssi
    perl-lwp-protocol-https: for the scriptassist script
( 291/1299) installing iw                                              [----------------------------------------] 100%
( 292/1299) installing jfsutils                                        [----------------------------------------] 100%
( 293/1299) installing kitty-terminfo                                  [----------------------------------------] 100%
( 294/1299) installing dnssec-anchors                                  [----------------------------------------] 100%
( 295/1299) installing ldns                                            [----------------------------------------] 100%
Optional dependencies for ldns
    libpcap: ldns-dpa tool [installed]
( 296/1299) installing less                                            [----------------------------------------] 100%
( 297/1299) installing hicolor-icon-theme                              [----------------------------------------] 100%
( 298/1299) installing lftp                                            [----------------------------------------] 100%
Optional dependencies for lftp
    perl: needed for convert-mozilla-cookies and verify-file [installed]
( 299/1299) installing libcbor                                         [----------------------------------------] 100%
( 300/1299) installing hidapi                                          [----------------------------------------] 100%
Optional dependencies for hidapi
    libusb: for hidapi-libusb [installed]
( 301/1299) installing libfido2                                        [----------------------------------------] 100%
( 302/1299) installing libusb-compat                                   [----------------------------------------] 100%
( 303/1299) installing linux-atm                                       [----------------------------------------] 100%
Optional dependencies for linux-atm
    flex: for atmsigd [pending]
( 304/1299) installing linux-firmware-whence                           [----------------------------------------] 100%
( 305/1299) installing linux-firmware-amdgpu                           [----------------------------------------] 100%
( 306/1299) installing linux-firmware-atheros                          [----------------------------------------] 100%
( 307/1299) installing linux-firmware-broadcom                         [----------------------------------------] 100%
( 308/1299) installing linux-firmware-cirrus                           [----------------------------------------] 100%
( 309/1299) installing linux-firmware-intel                            [----------------------------------------] 100%
( 310/1299) installing linux-firmware-mediatek                         [----------------------------------------] 100%
( 311/1299) installing linux-firmware-nvidia                           [----------------------------------------] 100%
( 312/1299) installing linux-firmware-other                            [----------------------------------------] 100%
( 313/1299) installing linux-firmware-radeon                           [----------------------------------------] 100%
( 314/1299) installing linux-firmware-realtek                          [----------------------------------------] 100%
( 315/1299) installing linux-firmware                                  [----------------------------------------] 100%
Optional dependencies for linux-firmware
    linux-firmware-liquidio: Firmware for Cavium LiquidIO server adapters
    linux-firmware-marvell: Firmware for Marvell devices [pending]
    linux-firmware-mellanox: Firmware for Mellanox Spectrum switches
    linux-firmware-nfp: Firmware for Netronome Flow Processors
    linux-firmware-qcom: Firmware for Qualcomm SoCs
    linux-firmware-qlogic: Firmware for QLogic devices
( 316/1299) installing linux-firmware-marvell                          [----------------------------------------] 100%
( 317/1299) installing sysfsutils                                      [----------------------------------------] 100%
( 318/1299) installing lsscsi                                          [----------------------------------------] 100%
( 319/1299) installing thin-provisioning-tools                         [----------------------------------------] 100%
( 320/1299) installing lvm2                                            [----------------------------------------] 100%
( 321/1299) installing lynx                                            [----------------------------------------] 100%
( 322/1299) installing groff                                           [----------------------------------------] 100%
Optional dependencies for groff
    netpbm: for use together with man -H command interaction in browsers
    psutils: for use together with man -H command interaction in browsers
    libxaw: for gxditview [installed]
    perl-file-homedir: for use with glilypond
( 323/1299) installing libpipeline                                     [----------------------------------------] 100%
( 324/1299) installing man-db                                          [----------------------------------------] 100%
Optional dependencies for man-db
    gzip [installed]
( 325/1299) installing man-pages                                       [----------------------------------------] 100%
( 326/1299) installing mc                                              [----------------------------------------] 100%
Optional dependencies for mc
    aspell: spelling corrections
    cabextract: ucab extfs
    cdparanoia: audio extfs [pending]
    cdrkit: alternative iso9660 extfs
    cvs: CVS support
    gawk: hp48+ extfs [installed]
    libisoburn: iso9660 extfs
    mtools: a+ extfs [pending]
    p7zip: support for 7zip archives
    perl: needed by several extfs scripts [installed]
    python: to access uc1541 or s3 storage [installed]
    unace: uace extfs [pending]
    unarj: uarj extfs
    unrar: urar extfs [pending]
    unzip: open zip archives [pending]
    rpm-tools: open rpm packages
    zip: uzip extfs
( 327/1299) installing mdadm                                           [----------------------------------------] 100%
Optional dependencies for mdadm
    bash: mdcheck [installed]
( 328/1299) installing memtest86+                                      [----------------------------------------] 100%
( 329/1299) installing memtest86+-efi                                  [----------------------------------------] 100%
( 330/1299) installing mkinitcpio-archiso                              [----------------------------------------] 100%
Optional dependencies for mkinitcpio-archiso
    curl: for PXE over HTTP [installed]
    gnupg: for PGP signature verification of rootfs over PXE [installed]
    mkinitcpio-nfs-utils: for PXE over NFS [pending]
    nbd: for PXE over NBD [pending]
    openssl: for CMS signature verification of rootfs over PXE [installed]
    pv: for status display during copy to RAM [pending]
( 331/1299) installing mkinitcpio-nfs-utils                            [----------------------------------------] 100%
( 332/1299) installing mtools                                          [----------------------------------------] 100%
Optional dependencies for mtools
    libx11: required by floppyd [installed]
    libxau: required by floppyd [installed]
( 333/1299) installing nano                                            [----------------------------------------] 100%
( 334/1299) installing nbd                                             [----------------------------------------] 100%
( 335/1299) installing ndisc6                                          [----------------------------------------] 100%
( 336/1299) installing rpcbind                                         [----------------------------------------] 100%
( 337/1299) installing nfsidmap                                        [----------------------------------------] 100%
( 338/1299) installing ding-libs                                       [----------------------------------------] 100%
( 339/1299) installing gssproxy                                        [----------------------------------------] 100%
( 340/1299) installing nfs-utils                                       [----------------------------------------] 100%
Optional dependencies for nfs-utils
    sqlite: for nfsdcltrack and fsidd usage [installed]
    python: for rpcctl, nfsiostat, nfsdclnts and mountstats usage [installed]
( 341/1299) installing lua54                                           [----------------------------------------] 100%
( 342/1299) installing nmap                                            [----------------------------------------] 100%
( 343/1299) installing liburing                                        [----------------------------------------] 100%
( 344/1299) installing libnvme                                         [----------------------------------------] 100%
( 345/1299) installing nvme-cli                                        [----------------------------------------] 100%
( 346/1299) installing open-isns                                       [----------------------------------------] 100%
( 347/1299) installing open-iscsi                                      [----------------------------------------] 100%

>>> Setting Initiatorname 'iqn.2016-04.com.open-iscsi:1c88c63a1ff9'
( 348/1299) installing libdnet                                         [----------------------------------------] 100%
( 349/1299) installing libmspack                                       [----------------------------------------] 100%
( 350/1299) installing libsigc++                                       [----------------------------------------] 100%
( 351/1299) installing libxss                                          [----------------------------------------] 100%
( 352/1299) installing lsb-release                                     [----------------------------------------] 100%
( 353/1299) installing uriparser                                       [----------------------------------------] 100%
( 354/1299) installing libxslt                                         [----------------------------------------] 100%
Optional dependencies for libxslt
    python: Python bindings [installed]
( 355/1299) installing xmlsec                                          [----------------------------------------] 100%
( 356/1299) installing open-vm-tools                                   [----------------------------------------] 100%
Optional dependencies for open-vm-tools
    gtkmm3: DnD/CP plugin
    libxtst: DnD/CP, resolution set plugins [installed]
    netctl: suspend-resume network state [pending]
    networkmanager: suspend-resume network state [pending]
( 357/1299) installing pcsclite                                        [----------------------------------------] 100%
Optional dependencies for pcsclite
    python: API call trace logging with the pcsc-spy [installed]
    ccid: USB Chip/Smart Card Interface Devices driver
( 358/1299) installing ppp                                             [----------------------------------------] 100%
( 359/1299) installing pptpclient                                      [----------------------------------------] 100%
( 360/1299) installing pv                                              [----------------------------------------] 100%
( 361/1299) installing numactl                                         [----------------------------------------] 100%
( 362/1299) installing qemu-guest-agent                                [----------------------------------------] 100%
( 363/1299) installing refind                                          [----------------------------------------] 100%
Optional dependencies for refind
    gptfdisk: for finding non-vfat ESP with refind-install [installed]
    imagemagick: for refind-mkfont [pending]
    openssl: for generating local certificates with refind-install [installed]
    python: for refind-mkdefault [installed]
    refind-docs: for HTML documentation
    sbsigntools: for EFI binary signing with refind-install
    sudo: for privilege elevation in refind-install and refind-mkdefault [installed]
( 364/1299) installing reflector                                       [----------------------------------------] 100%
Optional dependencies for reflector
    rsync: rate rsync mirrors [pending]
( 365/1299) installing rsync                                           [----------------------------------------] 100%
Optional dependencies for rsync
    python: for rrsync [installed]
( 366/1299) installing rxvt-unicode-terminfo                           [----------------------------------------] 100%
( 367/1299) installing sdparm                                          [----------------------------------------] 100%
( 368/1299) installing sg3_utils                                       [----------------------------------------] 100%
( 369/1299) installing smartmontools                                   [----------------------------------------] 100%
Optional dependencies for smartmontools
    s-nail: to get mail alerts to work
( 370/1299) installing sof-firmware                                    [----------------------------------------] 100%
( 371/1299) installing squashfs-tools                                  [----------------------------------------] 100%
( 372/1299) installing syslinux                                        [----------------------------------------] 100%

==> For setting up Syslinux BIOS using the syslinux-install_update script follow
    https://wiki.archlinux.org/index.php/Syslinux#Automatic_Install

==> For setting up Syslinux EFI follow
    https://wiki.archlinux.org/index.php/Syslinux#UEFI_Systems

==> The syslinux-install_update script does not currently support EFI install

Optional dependencies for syslinux
    perl-crypt-passwdmd5: For md5pass
    perl-digest-sha1: For sha1pass
    mtools: For mkdiskimage and syslinux support [installed]
    gptfdisk: For GPT support [installed]
    util-linux: For isohybrid [installed]
    efibootmgr: For EFI support [installed]
    dosfstools: For EFI support [installed]
( 373/1299) installing systemd-liberated-resolvconf-git                [----------------------------------------] 100%
( 374/1299) installing systemd-liberated-tests-git                     [----------------------------------------] 100%
( 375/1299) installing python-pycparser                                [----------------------------------------] 100%
( 376/1299) installing python-cffi                                     [----------------------------------------] 100%
Optional dependencies for python-cffi
    python-setuptools: "limited api" version checking in cffi.setuptools_ext
( 377/1299) installing python-cryptography                             [----------------------------------------] 100%
( 378/1299) installing python-pefile                                   [----------------------------------------] 100%
( 379/1299) installing systemd-liberated-ukify-git                     [----------------------------------------] 100%
Optional dependencies for systemd-liberated-ukify-git
    python-pillow: Show the size of splash image [pending]
    sbsigntools: Sign the embedded kernel
( 380/1299) installing tcpdump                                         [----------------------------------------] 100%
( 381/1299) installing terminus-font                                   [----------------------------------------] 100%
( 382/1299) installing libjpeg-turbo                                   [----------------------------------------] 100%
( 383/1299) installing testdisk                                        [----------------------------------------] 100%
( 384/1299) installing tmux                                            [----------------------------------------] 100%
( 385/1299) installing udftools                                        [----------------------------------------] 100%
( 386/1299) installing libplist                                        [----------------------------------------] 100%
Optional dependencies for libplist
    python: Python bindings [installed]
( 387/1299) installing libimobiledevice-glue                           [----------------------------------------] 100%
( 388/1299) installing libtatsu                                        [----------------------------------------] 100%
( 389/1299) installing libusbmuxd                                      [----------------------------------------] 100%
( 390/1299) installing libimobiledevice                                [----------------------------------------] 100%
Optional dependencies for libimobiledevice
    python: Python bindings [installed]
( 391/1299) installing usbmuxd                                         [----------------------------------------] 100%
( 392/1299) installing usbutils                                        [----------------------------------------] 100%
Optional dependencies for usbutils
    coreutils: for lsusb.py usage [installed]
    python: for lsusb.py usage [installed]
    sh: for usb-devices [installed]
( 393/1299) installing vim-runtime                                     [----------------------------------------] 100%
Optional dependencies for vim-runtime
    sh: support for some tools and macros [installed]
    python: demoserver example tool [installed]
    gawk: mve tools support [installed]
( 394/1299) installing vim                                             [----------------------------------------] 100%
Optional dependencies for vim
    python: Python language support [installed]
    ruby: Ruby language support
    lua: Lua language support [pending]
    perl: Perl language support [installed]
    tcl: Tcl language support
( 395/1299) installing linux-vita                                      [----------------------------------------] 100%
Optional dependencies for linux-vita
    wireless-regdb: to set the correct wireless channels of your country [pending]
    linux-firmware: firmware images needed for some devices [installed]
( 396/1299) installing virtualbox-guest-utils-nox                      [----------------------------------------] 100%
( 397/1299) installing wireless_tools                                  [----------------------------------------] 100%
( 398/1299) installing wvstreams                                       [----------------------------------------] 100%
( 399/1299) installing wvdial                                          [----------------------------------------] 100%
( 400/1299) installing vita-installation-config                        [----------------------------------------] 100%
( 401/1299) installing vita-settings                                   [----------------------------------------] 100%
( 402/1299) installing vita-terminal-config                            [----------------------------------------] 100%
( 403/1299) installing vita-fish-settings                              [----------------------------------------] 100%
( 404/1299) installing vita-alacritty-config                           [----------------------------------------] 100%
( 405/1299) installing vita-ghostty-config                             [----------------------------------------] 100%
( 406/1299) installing vita-wallpapers                                 [----------------------------------------] 100%
( 407/1299) installing double-conversion                               [----------------------------------------] 100%
( 408/1299) installing libpng                                          [----------------------------------------] 100%
( 409/1299) installing freetype2                                       [----------------------------------------] 100%
Optional dependencies for freetype2
    harfbuzz: Improved autohinting [pending]
( 410/1299) installing fontconfig                                      [----------------------------------------] 100%
Creating fontconfig configuration...
Rebuilding fontconfig cache...
( 411/1299) installing graphite                                        [----------------------------------------] 100%
Optional dependencies for graphite
    graphite-docs: Documentation
( 412/1299) installing harfbuzz                                        [----------------------------------------] 100%
Optional dependencies for harfbuzz
    harfbuzz-utils: utilities
( 413/1299) installing libb2                                           [----------------------------------------] 100%
( 414/1299) installing libdaemon                                       [----------------------------------------] 100%
( 415/1299) installing avahi                                           [----------------------------------------] 100%
Optional dependencies for avahi
    gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc [pending]
    libevent: libevent bindings [installed]
    nss-mdns: NSS support for mDNS [pending]
    python-dbus: avahi-bookmarks, avahi-discover [pending]
    python-gobject: avahi-bookmarks, avahi-discover [pending]
    python-twisted: avahi-bookmarks
( 416/1299) installing libcups                                         [----------------------------------------] 100%
( 417/1299) installing libpciaccess                                    [----------------------------------------] 100%
( 418/1299) installing libdrm                                          [----------------------------------------] 100%
Optional dependencies for libdrm
    cairo: needed for modetest tool [pending]
( 419/1299) installing libxshmfence                                    [----------------------------------------] 100%
( 420/1299) installing libxxf86vm                                      [----------------------------------------] 100%
( 421/1299) installing llvm-libs                                       [----------------------------------------] 100%
( 422/1299) installing lm_sensors                                      [----------------------------------------] 100%
Optional dependencies for lm_sensors
    rrdtool: for logging with sensord
    perl: for sensor detection and configuration convert [installed]
( 423/1299) installing spirv-tools                                     [----------------------------------------] 100%
( 424/1299) installing default-cursors                                 [----------------------------------------] 100%
Optional dependencies for default-cursors
    adwaita-cursors: default cursor theme [pending]
( 425/1299) installing wayland                                         [----------------------------------------] 100%
( 426/1299) installing mesa                                            [----------------------------------------] 100%
Optional dependencies for mesa
    opengl-man-pages: for the OpenGL API man pages
( 427/1299) installing libglvnd                                        [----------------------------------------] 100%
( 428/1299) installing libevdev                                        [----------------------------------------] 100%
( 429/1299) installing libgudev                                        [----------------------------------------] 100%
( 430/1299) installing libwacom                                        [----------------------------------------] 100%
Optional dependencies for libwacom
    python-libevdev: for libwacom-show-stylus
    python-pyudev: for libwacom-show-stylus
( 431/1299) installing mtdev                                           [----------------------------------------] 100%
( 432/1299) installing libinput                                        [----------------------------------------] 100%
Optional dependencies for libinput
    libinput-tools: debug utilities
( 433/1299) installing libproxy                                        [----------------------------------------] 100%
( 434/1299) installing xkeyboard-config                                [----------------------------------------] 100%
( 435/1299) installing libxkbcommon                                    [----------------------------------------] 100%
Optional dependencies for libxkbcommon
    libxkbcommon-x11: xkbcli interactive-x11 [pending]
    wayland: xkbcli interactive-wayland [installed]
( 436/1299) installing libxkbcommon-x11                                [----------------------------------------] 100%
( 437/1299) installing md4c                                            [----------------------------------------] 100%
( 438/1299) installing shared-mime-info                                [----------------------------------------] 100%
( 439/1299) installing tslib                                           [----------------------------------------] 100%
( 440/1299) installing xcb-util-renderutil                             [----------------------------------------] 100%
( 441/1299) installing xcb-util                                        [----------------------------------------] 100%
( 442/1299) installing xcb-util-image                                  [----------------------------------------] 100%
( 443/1299) installing xcb-util-cursor                                 [----------------------------------------] 100%
( 444/1299) installing xcb-util-keysyms                                [----------------------------------------] 100%
( 445/1299) installing xcb-util-wm                                     [----------------------------------------] 100%
( 446/1299) installing xdg-utils                                       [----------------------------------------] 100%
Optional dependencies for xdg-utils
    kde-cli-tools: for KDE Plasma5 support in xdg-open [pending]
    exo: for Xfce support in xdg-open
    pcmanfm: for LXDE support in xdg-open
    perl-file-mimeinfo: for generic support in xdg-open
    perl-net-dbus: Perl extension to dbus used in xdg-screensaver
    perl-x11-protocol: Perl X11 protocol used in xdg-screensaver
    xorg-xset: for X11 support in xdg-screensaver
    xorg-xprop: for X11 support in xdg-screensaver [installed]
( 447/1299) installing qt6-translations                                [----------------------------------------] 100%
( 448/1299) installing qt6-base                                        [----------------------------------------] 100%
Optional dependencies for qt6-base
    freetds: MS SQL driver
    gdk-pixbuf2: GTK platform plugin [pending]
    gtk3: GTK platform plugin [pending]
    libfbclient: Firebird/iBase driver
    mariadb-libs: MariaDB driver
    pango: GTK platform plugin [pending]
    perl: for syncqt [installed]
    postgresql-libs: PostgreSQL driver
    unixodbc: ODBC driver
( 449/1299) installing kcoreaddons                                     [----------------------------------------] 100%
Optional dependencies for kcoreaddons
    pyside6: Python bindings
    qt6-declarative: QML bindings [pending]
( 450/1299) installing iso-codes                                       [----------------------------------------] 100%
( 451/1299) installing ki18n                                           [----------------------------------------] 100%
Optional dependencies for ki18n
    python: to compile .ts files [installed]
    qt6-declarative: ktranscript plugin and QML bindings [pending]
( 452/1299) installing kwidgetsaddons                                  [----------------------------------------] 100%
Optional dependencies for kwidgetsaddons
    pyside6: Python bindings
( 453/1299) installing polkit-qt6                                      [----------------------------------------] 100%
( 454/1299) installing kpmcore                                         [----------------------------------------] 100%
Optional dependencies for kpmcore
    bcachefs-tools: BCacheFS support [installed]
    dosfstools: FAT32 support [installed]
    e2fsprogs: ext2/3/4 support [installed]
    exfat-utils: exFAT support [installed]
    exfatprogs: exFAT support (alternative to exfat-utils) [installed]
    f2fs-tools: F2FS support [installed]
    fatresize: FAT resize support [installed]
    jfsutils: JFS support [installed]
    nilfs-utils: nilfs support [installed]
    ntfsprogs: NTFS support [installed]
    udftools: UDF support [installed]
    xfsprogs: XFS support [pending]
( 455/1299) installing cracklib                                        [----------------------------------------] 100%
( 456/1299) installing libpwquality                                    [----------------------------------------] 100%
Optional dependencies for libpwquality
    python: Python bindings [installed]
( 457/1299) installing qt6-declarative                                 [----------------------------------------] 100%
Optional dependencies for qt6-declarative
    qt6-svg: for QtQuickVectorImage and svgtoqml [pending]
( 458/1299) installing qt6-svg                                         [----------------------------------------] 100%
( 459/1299) installing yaml-cpp                                        [----------------------------------------] 100%
( 460/1299) installing calamares                                       [----------------------------------------] 100%
( 461/1299) installing vita-calamares-config                           [----------------------------------------] 100%

** The files have been installed in /etc/calamares **

( 462/1299) installing os-prober                                       [----------------------------------------] 100%
( 463/1299) installing gc                                              [----------------------------------------] 100%
( 464/1299) installing guile                                           [----------------------------------------] 100%
( 465/1299) installing make                                            [----------------------------------------] 100%
( 466/1299) installing libxrender                                      [----------------------------------------] 100%
( 467/1299) installing pixman                                          [----------------------------------------] 100%
( 468/1299) installing cairo                                           [----------------------------------------] 100%
( 469/1299) installing bubblewrap                                      [----------------------------------------] 100%
( 470/1299) installing jbigkit                                         [----------------------------------------] 100%
( 471/1299) installing libdeflate                                      [----------------------------------------] 100%
( 472/1299) installing libwebp                                         [----------------------------------------] 100%
Optional dependencies for libwebp
    libwebp-utils: WebP conversion and inspection tools
( 473/1299) installing libtiff                                         [----------------------------------------] 100%
Optional dependencies for libtiff
    freeglut: for using tiffgt [pending]
( 474/1299) installing lcms2                                           [----------------------------------------] 100%
( 475/1299) installing giflib                                          [----------------------------------------] 100%
( 476/1299) installing gperftools                                      [----------------------------------------] 100%
( 477/1299) installing gtest                                           [----------------------------------------] 100%
Optional dependencies for gtest
    python: gmock generator [installed]
( 478/1299) installing highway                                         [----------------------------------------] 100%
( 479/1299) installing libjxl                                          [----------------------------------------] 100%
Optional dependencies for libjxl
    java-runtime: for JNI bindings
( 480/1299) installing dav1d                                           [----------------------------------------] 100%
Optional dependencies for dav1d
    dav1d-doc: HTML documentation
( 481/1299) installing fribidi                                         [----------------------------------------] 100%
( 482/1299) installing libdatrie                                       [----------------------------------------] 100%
( 483/1299) installing libthai                                         [----------------------------------------] 100%
( 484/1299) installing libxft                                          [----------------------------------------] 100%
( 485/1299) installing pango                                           [----------------------------------------] 100%
( 486/1299) installing librsvg                                         [----------------------------------------] 100%
( 487/1299) installing glycin                                          [----------------------------------------] 100%
Optional dependencies for glycin
    libheif: Load .avif, .heic and .heif [pending]
( 488/1299) installing gdk-pixbuf2                                     [----------------------------------------] 100%
Optional dependencies for gdk-pixbuf2
    libheif: Load .avif, .heic and .heif [pending]
    libopenraw: Load .arw, .cr2, .crw, .dng, .erf, .mrw, .nef, .orf, .pef and .raf [pending]
    libwmf: Load .apm and .wmf
( 489/1299) installing hwloc                                           [----------------------------------------] 100%
Optional dependencies for hwloc
    cairo: PDF, Postscript, and PNG export support [installed]
    libxml2: full XML import/export support [installed]
( 490/1299) installing onetbb                                          [----------------------------------------] 100%
Optional dependencies for onetbb
    python: for Python module [installed]
( 491/1299) installing libblake3                                       [----------------------------------------] 100%
( 492/1299) installing libfyaml                                        [----------------------------------------] 100%
( 493/1299) installing libstemmer                                      [----------------------------------------] 100%
( 494/1299) installing libxmlb                                         [----------------------------------------] 100%
( 495/1299) installing appstream                                       [----------------------------------------] 100%
( 496/1299) installing graphene                                        [----------------------------------------] 100%
( 497/1299) installing adwaita-icon-theme-legacy                       [----------------------------------------] 100%
( 498/1299) installing adwaita-cursors                                 [----------------------------------------] 100%
( 499/1299) installing adwaita-icon-theme                              [----------------------------------------] 100%
( 500/1299) installing desktop-file-utils                              [----------------------------------------] 100%
( 501/1299) installing gstreamer                                       [----------------------------------------] 100%
Optional dependencies for gstreamer
    python: gst-plugins-doc-cache-generator [installed]
( 502/1299) installing libxv                                           [----------------------------------------] 100%
( 503/1299) installing orc                                             [----------------------------------------] 100%
( 504/1299) installing gst-plugins-base-libs                           [----------------------------------------] 100%
( 505/1299) installing glib-networking                                 [----------------------------------------] 100%
( 506/1299) installing libsoup3                                        [----------------------------------------] 100%
Optional dependencies for libsoup3
    samba: Windows Domain SSO [pending]
( 507/1299) installing gssdp                                           [----------------------------------------] 100%
Optional dependencies for gssdp
    gtk4: gssdp-device-sniffer [pending]
( 508/1299) installing gupnp                                           [----------------------------------------] 100%
Optional dependencies for gupnp
    python: gupnp-binding-tool [installed]
( 509/1299) installing gupnp-igd                                       [----------------------------------------] 100%
( 510/1299) installing libnice                                         [----------------------------------------] 100%
Optional dependencies for libnice
    gstreamer: "nice" GStreamer plugin [installed]
( 511/1299) installing libva                                           [----------------------------------------] 100%
Optional dependencies for libva
    intel-media-driver: backend for Intel GPUs (>= Broadwell)
    libva-intel-driver: backend for Intel GPUs (<= Haswell)
    libva-mesa-driver: backend for AMD and NVIDIA GPUs [installed]
( 512/1299) installing vulkan-icd-loader                               [----------------------------------------] 100%
Optional dependencies for vulkan-icd-loader
    vulkan-driver: packaged vulkan driver
( 513/1299) installing vmaf                                            [----------------------------------------] 100%
( 514/1299) installing gst-plugins-bad-libs                            [----------------------------------------] 100%
( 515/1299) installing gtk-update-icon-cache                           [----------------------------------------] 100%
( 516/1299) installing libcloudproviders                               [----------------------------------------] 100%
( 517/1299) installing libcolord                                       [----------------------------------------] 100%
( 518/1299) installing libepoxy                                        [----------------------------------------] 100%
( 519/1299) installing libxcursor                                      [----------------------------------------] 100%
( 520/1299) installing libxdamage                                      [----------------------------------------] 100%
( 521/1299) installing libxinerama                                     [----------------------------------------] 100%
( 522/1299) installing libxrandr                                       [----------------------------------------] 100%
( 523/1299) installing json-glib                                       [----------------------------------------] 100%
( 524/1299) installing tinysparql                                      [----------------------------------------] 100%
( 525/1299) installing libxcomposite                                   [----------------------------------------] 100%
( 526/1299) installing gtk3                                            [----------------------------------------] 100%
Optional dependencies for gtk3
    evince: Default print preview command
( 527/1299) installing libpipewire                                     [----------------------------------------] 100%
( 528/1299) installing pipewire                                        [----------------------------------------] 100%
Created symlink '/etc/systemd/user/sockets.target.wants/pipewire.socket' → '/usr/lib/systemd/user/pipewire.socket'.
Optional dependencies for pipewire
    gst-plugin-pipewire: GStreamer plugin [pending]
    pipewire-alsa: ALSA configuration [pending]
    pipewire-audio: Audio support [pending]
    pipewire-docs: Documentation
    pipewire-ffado: FireWire support
    pipewire-jack-client: PipeWire as JACK client
    pipewire-jack: JACK replacement
    pipewire-libcamera: Libcamera support
    pipewire-onnx: ONNX filter support
    pipewire-pulse: PulseAudio replacement [pending]
    pipewire-roc: ROC streaming
    pipewire-session-manager: Session manager [pending]
    pipewire-v4l2: V4L2 interceptor
    pipewire-x11-bell: X11 bell
    pipewire-zeroconf: Zeroconf support
    realtime-privileges: realtime privileges with rt module
    rtkit: realtime privileges with rtkit module
( 529/1299) installing xdg-desktop-portal                              [----------------------------------------] 100%
Optional dependencies for xdg-desktop-portal
    gamemode: GameMode portal
    geoclue: Location portal
    rtkit: Realtime portal
    xdg-desktop-portal-impl: Portal backends [pending]
( 530/1299) installing xdg-desktop-portal-gtk                          [----------------------------------------] 100%
Optional dependencies for xdg-desktop-portal-gtk
    evince: Print preview
( 531/1299) installing gtk4                                            [----------------------------------------] 100%
Optional dependencies for gtk4
    evince: Default print preview command
( 532/1299) installing libadwaita                                      [----------------------------------------] 100%
( 533/1299) installing ntp                                             [----------------------------------------] 100%
( 534/1299) installing kconfig                                         [----------------------------------------] 100%
( 535/1299) installing kcodecs                                         [----------------------------------------] 100%
( 536/1299) installing kguiaddons                                      [----------------------------------------] 100%
Optional dependencies for kguiaddons
    pyside6: Python bindings
    qt6-declarative: QML bindings [installed]
( 537/1299) installing kcolorscheme                                    [----------------------------------------] 100%
( 538/1299) installing kconfigwidgets                                  [----------------------------------------] 100%
( 539/1299) installing karchive                                        [----------------------------------------] 100%
( 540/1299) installing kbookmarks                                      [----------------------------------------] 100%
( 541/1299) installing kcompletion                                     [----------------------------------------] 100%
( 542/1299) installing kcrash                                          [----------------------------------------] 100%
Optional dependencies for kcrash
    drkonqi: KDE crash handler application [pending]
( 543/1299) installing kdbusaddons                                     [----------------------------------------] 100%
( 544/1299) installing breeze-icons                                    [----------------------------------------] 100%
( 545/1299) installing kiconthemes                                     [----------------------------------------] 100%
Optional dependencies for kiconthemes
    qt6-declarative: QML bindings [installed]
( 546/1299) installing kitemviews                                      [----------------------------------------] 100%
( 547/1299) installing tdb                                             [----------------------------------------] 100%
Optional dependencies for tdb
    python: for python bindings [installed]
( 548/1299) installing sound-theme-freedesktop                         [----------------------------------------] 100%
( 549/1299) installing libcanberra                                     [----------------------------------------] 100%
Optional dependencies for libcanberra
    gtk3: canberra-gtk-play [installed]
( 550/1299) installing knotifications                                  [----------------------------------------] 100%
Optional dependencies for knotifications
    pyside6: Python bindings
    qt6-declarative: QML bindings [installed]
( 551/1299) installing kjobwidgets                                     [----------------------------------------] 100%
Optional dependencies for kjobwidgets
    pyside6: Python bindings
( 552/1299) installing kservice                                        [----------------------------------------] 100%
( 553/1299) installing gpgmepp                                         [----------------------------------------] 100%
( 554/1299) installing kwindowsystem                                   [----------------------------------------] 100%
Optional dependencies for kwindowsystem
    qt6-declarative: QML bindings [installed]
( 555/1299) installing qt6-shadertools                                 [----------------------------------------] 100%
( 556/1299) installing qt6-5compat                                     [----------------------------------------] 100%
Optional dependencies for qt6-5compat
    qt6-declarative: for QtGraphicalEffects [installed]
( 557/1299) installing qca-qt6                                         [----------------------------------------] 100%
Optional dependencies for qca-qt6
    botan: botan plugin
    libgcrypt: gcrypt plugin [installed]
    libsasl: SASL plugin [installed]
    openssl: SSL plugin [installed]
    pkcs11-helper: PKCS-11 plugin [pending]
( 558/1299) installing kwallet                                         [----------------------------------------] 100%
Optional dependencies for kwallet
    kwalletmanager: Configuration GUI [pending]
( 559/1299) installing media-player-info                               [----------------------------------------] 100%
( 560/1299) installing libblockdev                                     [----------------------------------------] 100%
Optional dependencies for libblockdev
    libblockdev-btrfs: for BTRFS support
    libblockdev-crypto: for crypto support [pending]
    libblockdev-dm: for device-mapper support
    libblockdev-fs: for filesystem support [pending]
    libblockdev-loop: for loop device support [pending]
    libblockdev-lvm: for LVM support
    libblockdev-mdraid: for MDRAID support [pending]
    libblockdev-mpath: for multipath support
    libblockdev-nvdimm: for NVDIMM support
    libblockdev-nvme: for NVME support [pending]
    libblockdev-part: for partitioning support [pending]
    libblockdev-smart: for S.M.A.R.T. support [pending]
    libblockdev-swap: for swap support [pending]
    python-libblockdev: for Python support
( 561/1299) installing volume_key                                      [----------------------------------------] 100%
Optional dependencies for volume_key
    python-volume_key: for Python bindings
( 562/1299) installing libblockdev-crypto                              [----------------------------------------] 100%
( 563/1299) installing libbytesize                                     [----------------------------------------] 100%
Optional dependencies for libbytesize
    python: for Python bindings and for the bscalc command [installed]
( 564/1299) installing libblockdev-fs                                  [----------------------------------------] 100%
Optional dependencies for libblockdev-fs
    btrfs-progs: for BTRFS filesystem support [installed]
    dosfstools: for VFAT filesystem support [installed]
    exfatprogs: for exFAT filesystem support [installed]
    f2fs-tools: for F2FS filesystem support [installed]
    nilfs-utils: for nilfs filesystem support [installed]
    ntfsprogs: for NTFS filesystem support [installed]
    udftools: for UDF filesystem support [installed]
    xfsprogs: for XFS filesystem support [pending]
( 565/1299) installing libblockdev-mdraid                              [----------------------------------------] 100%
( 566/1299) installing libblockdev-loop                                [----------------------------------------] 100%
( 567/1299) installing libblockdev-nvme                                [----------------------------------------] 100%
( 568/1299) installing libblockdev-part                                [----------------------------------------] 100%
( 569/1299) installing libatasmart                                     [----------------------------------------] 100%
( 570/1299) installing libblockdev-smart                               [----------------------------------------] 100%
Optional dependencies for libblockdev-smart
    smartmontools: for experimental smartmontools-based plugin [installed]
( 571/1299) installing libblockdev-swap                                [----------------------------------------] 100%
( 572/1299) installing udisks2                                         [----------------------------------------] 100%
Optional dependencies for udisks2
    udisks2-btrfs: for BTRFS module
    udisks2-lvm2: for LVM2 module
    udisks2-docs: API documentation
    btrfs-progs: for BTRFS support in libblockdev-fs [installed]
    dosfstools: for FAT support in libblockdev-fs [installed]
    exfatprogs: for exFAT support in libblockdev-fs [installed]
    e2fsprogs: for Ext2/3/4 support in libblockdev-fs [installed]
    f2fs-tools: for F2FS support in libblockdev-fs [installed]
    less: for default pager of the udisksctl dump command [installed]
    nilfs-utils: for NILFS support in libblockdev-fs [installed]
    udftools: for UDF support in libblockdev-fs [installed]
    xfsprogs: for XFS support in libblockdev-fs [pending]
( 573/1299) installing upower                                          [----------------------------------------] 100%
Optional dependencies for upower
    usbmuxd: Read charge status of iOS devices [installed]
( 574/1299) installing solid                                           [----------------------------------------] 100%
Optional dependencies for solid
    qt6-declarative: QML bindings [installed]
( 575/1299) installing kio                                             [----------------------------------------] 100%
Optional dependencies for kio
    audiocd-kio: for accessing audio CDs
    kded: proxy management and cookie storage [pending]
    kdoctools: for the help kioslave
    kio-extras: extra protocols support (sftp, fish and more) [pending]
    kio-fuse: to mount remote filesystems via FUSE [pending]
    switcheroo-control: hybrid GPU support
( 576/1299) installing kirigami                                        [----------------------------------------] 100%
( 577/1299) installing kglobalaccel                                    [----------------------------------------] 100%
( 578/1299) installing kxmlgui                                         [----------------------------------------] 100%
Optional dependencies for kxmlgui
    pyside6: Python bindings
( 579/1299) installing kcmutils                                        [----------------------------------------] 100%
( 580/1299) installing kdecoration                                     [----------------------------------------] 100%
( 581/1299) installing attica                                          [----------------------------------------] 100%
( 582/1299) installing kpackage                                        [----------------------------------------] 100%
( 583/1299) installing syndication                                     [----------------------------------------] 100%
( 584/1299) installing knewstuff                                       [----------------------------------------] 100%
( 585/1299) installing ksvg                                            [----------------------------------------] 100%
Optional dependencies for ksvg
    kirigami: QML bindings [installed]
    qt6-declarative: QML bindings [installed]
( 586/1299) installing gumbo-parser                                    [----------------------------------------] 100%
( 587/1299) installing litehtml0.9                                     [----------------------------------------] 100%
( 588/1299) installing qt6-tools                                       [----------------------------------------] 100%
Optional dependencies for qt6-tools
    clang: for qdoc and lupdate [pending]
    qt6-declarative: for qdistancefieldgenerator, qdoc and lupdate [installed]
( 589/1299) installing aurorae                                         [----------------------------------------] 100%
( 590/1299) installing bluez                                           [----------------------------------------] 100%
( 591/1299) installing bluez-qt                                        [----------------------------------------] 100%
Optional dependencies for bluez-qt
    qt6-declarative: QML bindings [installed]
( 592/1299) installing kdeclarative                                    [----------------------------------------] 100%
( 593/1299) installing plasma-activities                               [----------------------------------------] 100%
Optional dependencies for plasma-activities
    qt6-declarative: QML bindings [installed]
( 594/1299) installing libplasma                                       [----------------------------------------] 100%
( 595/1299) installing bluedevil                                       [----------------------------------------] 100%
Optional dependencies for bluedevil
    bluez-obex: file transfer
    pulseaudio-bluetooth: to connect to A2DP profile
( 596/1299) installing frameworkintegration                            [----------------------------------------] 100%
Optional dependencies for frameworkintegration
    appstream-qt: dependency resolving via AppStream [pending]
    packagekit-qt6: dependency resolving via AppStream [pending]
( 597/1299) installing breeze-cursors                                  [----------------------------------------] 100%
( 598/1299) installing breeze                                          [----------------------------------------] 100%
Optional dependencies for breeze
    breeze-gtk: Breeze widget style for GTK applications [pending]
    breeze5: Breeze widget style for Qt5 applications
( 599/1299) installing breeze-gtk                                      [----------------------------------------] 100%
( 600/1299) installing plymouth                                        [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/plymouth/plymouthd.conf installed as /home/retroTech/vita-build/x86_64/airootfs/etc/plymouth/plymouthd.conf.pacnew
Optional dependencies for plymouth
    gtk3: x11 renderer [installed]
( 601/1299) installing breeze-plymouth                                 [----------------------------------------] 100%
( 602/1299) installing appstream-qt                                    [----------------------------------------] 100%
( 603/1299) installing archlinux-appstream-data                        [----------------------------------------] 100%
( 604/1299) installing discount                                        [----------------------------------------] 100%
( 605/1299) installing kidletime                                       [----------------------------------------] 100%
Optional dependencies for kidletime
    libx11: XCB plugin [installed]
    libxcb: XCB plugin [installed]
    libxext: XCB plugin [installed]
    libxss: XCB plugin [installed]
    wayland: Wayland plugin [installed]
( 606/1299) installing kitemmodels                                     [----------------------------------------] 100%
Optional dependencies for kitemmodels
    qt6-declarative: QML bindings [installed]
( 607/1299) installing aom                                             [----------------------------------------] 100%
( 608/1299) installing glslang                                         [----------------------------------------] 100%
( 609/1299) installing gsm                                             [----------------------------------------] 100%
( 610/1299) installing libsamplerate                                   [----------------------------------------] 100%
( 611/1299) installing jack2                                           [----------------------------------------] 100%
Optional dependencies for jack2
    a2jmidid: for ALSA MIDI to JACK MIDI bridging
    libffado: for firewire support using FFADO
    jack-example-tools: for official JACK example-clients and tools
    jack2-dbus: for dbus integration
    jack2-docs: for developer documentation
    realtime-privileges: for realtime privileges
( 612/1299) installing libunibreak                                     [----------------------------------------] 100%
( 613/1299) installing libass                                          [----------------------------------------] 100%
( 614/1299) installing libraw1394                                      [----------------------------------------] 100%
( 615/1299) installing libavc1394                                      [----------------------------------------] 100%
( 616/1299) installing libbluray                                       [----------------------------------------] 100%
Optional dependencies for libbluray
    java-runtime: BD-J library
( 617/1299) installing libbs2b                                         [----------------------------------------] 100%
( 618/1299) installing libdvdread                                      [----------------------------------------] 100%
Optional dependencies for libdvdread
    libdvdcss: Decoding encrypted DVDs [pending]
( 619/1299) installing libdvdnav                                       [----------------------------------------] 100%
( 620/1299) installing libiec61883                                     [----------------------------------------] 100%
( 621/1299) installing libmodplug                                      [----------------------------------------] 100%
( 622/1299) installing portaudio                                       [----------------------------------------] 100%
( 623/1299) installing libopenmpt                                      [----------------------------------------] 100%
( 624/1299) installing shaderc                                         [----------------------------------------] 100%
( 625/1299) installing libdovi                                         [----------------------------------------] 100%
( 626/1299) installing libplacebo                                      [----------------------------------------] 100%
( 627/1299) installing libsoxr                                         [----------------------------------------] 100%
( 628/1299) installing libssh                                          [----------------------------------------] 100%
( 629/1299) installing libtheora                                       [----------------------------------------] 100%
( 630/1299) installing libvdpau                                        [----------------------------------------] 100%
Optional dependencies for libvdpau
    libvdpau-va-gl: driver using VAAPI
    nvidia-utils: driver for NVIDIA
( 631/1299) installing libvpx                                          [----------------------------------------] 100%
( 632/1299) installing ocl-icd                                         [----------------------------------------] 100%
Optional dependencies for ocl-icd
    opencl-driver: packaged opencl driver
( 633/1299) installing libvpl                                          [----------------------------------------] 100%
Optional dependencies for libvpl
    intel-media-sdk: runtime implementation for legacy Intel GPUs
    vpl-gpu-rt: runtime implementation for Tiger Lake and newer GPUs
( 634/1299) installing opencore-amr                                    [----------------------------------------] 100%
( 635/1299) installing openjpeg2                                       [----------------------------------------] 100%
( 636/1299) installing rav1e                                           [----------------------------------------] 100%
( 637/1299) installing fftw                                            [----------------------------------------] 100%
Optional dependencies for fftw
    fftw-openmpi: for OpenMPI integration
( 638/1299) installing rubberband                                      [----------------------------------------] 100%
( 639/1299) installing sdl3                                            [----------------------------------------] 100%
Optional dependencies for sdl3
    alsa-lib: ALSA audio driver [installed]
    libpulse: PulseAudio audio driver [installed]
    jack: JACK audio driver [installed]
    pipewire: PipeWire audio driver [installed]
    vulkan-driver: vulkan renderer
    sndio: sndio audio driver [pending]
    libdecor: Wayland client decorations [pending]
( 640/1299) installing sdl2-compat                                     [----------------------------------------] 100%
( 641/1299) installing snappy                                          [----------------------------------------] 100%
( 642/1299) installing sndio                                           [----------------------------------------] 100%
( 643/1299) installing speexdsp                                        [----------------------------------------] 100%
( 644/1299) installing speex                                           [----------------------------------------] 100%
( 645/1299) installing srt                                             [----------------------------------------] 100%
( 646/1299) installing svt-av1                                         [----------------------------------------] 100%
( 647/1299) installing v4l-utils                                       [----------------------------------------] 100%
Optional dependencies for v4l-utils
    qt6-base: for qv4l2 and qvidcap [installed]
    qt6-5compat: for qv4l2 [installed]
    alsa-lib: for qv4l2 [installed]
( 648/1299) installing zimg                                            [----------------------------------------] 100%
( 649/1299) installing vapoursynth                                     [----------------------------------------] 100%
( 650/1299) installing vid.stab                                        [----------------------------------------] 100%
( 651/1299) installing l-smash                                         [----------------------------------------] 100%
( 652/1299) installing x264                                            [----------------------------------------] 100%
( 653/1299) installing x265                                            [----------------------------------------] 100%
( 654/1299) installing xvidcore                                        [----------------------------------------] 100%
( 655/1299) installing libpgm                                          [----------------------------------------] 100%
( 656/1299) installing zeromq                                          [----------------------------------------] 100%
Optional dependencies for zeromq
    cppzmq: C++ binding for libzmq
( 657/1299) installing ffmpeg                                          [----------------------------------------] 100%
Optional dependencies for ffmpeg
    avisynthplus: AviSynthPlus support
    frei0r-plugins: Frei0r video effects support
    intel-media-sdk: Intel QuickSync support (legacy)
    ladspa: LADSPA filters
    nvidia-utils: Nvidia NVDEC/NVENC support
    onevpl-intel-gpu: Intel QuickSync support
( 658/1299) installing qt6-multimedia-ffmpeg                           [----------------------------------------] 100%
( 659/1299) installing qt6-multimedia                                  [----------------------------------------] 100%
Optional dependencies for qt6-multimedia
    qt6-declarative: QML bindings [installed]
    qt6-quick3d: for QtQuick3DAudio [pending]
( 660/1299) installing sonnet                                          [----------------------------------------] 100%
Optional dependencies for sonnet
    aspell: spell checking via aspell
    hspell: spell checking for Hebrew
    hunspell: spell checking via hunspell [pending]
    libvoikko: Finnish support via Voikko
    qt6-declarative: QML bindings [installed]
( 661/1299) installing kirigami-addons                                 [----------------------------------------] 100%
( 662/1299) installing kstatusnotifieritem                             [----------------------------------------] 100%
Optional dependencies for kstatusnotifieritem
    pyside6: Python bindings
( 663/1299) installing kuserfeedback                                   [----------------------------------------] 100%
Optional dependencies for kuserfeedback
    qt6-charts: Feedback console
    qt6-declarative: QML bindings [installed]
    qt6-svg: Feedback console [installed]
( 664/1299) installing libaccounts-glib                                [----------------------------------------] 100%
( 665/1299) installing libaccounts-qt                                  [----------------------------------------] 100%
( 666/1299) installing signond                                         [----------------------------------------] 100%
( 667/1299) installing signon-kwallet-extension                        [----------------------------------------] 100%
( 668/1299) installing signon-plugin-oauth2                            [----------------------------------------] 100%
( 669/1299) installing libnotify                                       [----------------------------------------] 100%
( 670/1299) installing libxkbfile                                      [----------------------------------------] 100%
( 671/1299) installing minizip                                         [----------------------------------------] 100%
( 672/1299) installing openh264                                        [----------------------------------------] 100%
( 673/1299) installing qt6-positioning                                 [----------------------------------------] 100%
Optional dependencies for qt6-positioning
    geoclue: geoclue2 plugin
    qt6-declarative: QML bindings [installed]
    qt6-serialport: NMEA plugin
( 674/1299) installing qt6-webchannel                                  [----------------------------------------] 100%
( 675/1299) installing abseil-cpp                                      [----------------------------------------] 100%
( 676/1299) installing re2                                             [----------------------------------------] 100%
( 677/1299) installing noto-fonts                                      [----------------------------------------] 100%
Optional dependencies for noto-fonts
    noto-fonts-cjk: CJK characters
    noto-fonts-emoji: Emoji characters [pending]
    noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)
( 678/1299) installing ttf-dejavu                                      [----------------------------------------] 100%
( 679/1299) installing ttf-droid                                       [----------------------------------------] 100%
( 680/1299) installing ttf-roboto                                      [----------------------------------------] 100%
( 681/1299) installing qt6-webengine                                   [----------------------------------------] 100%
Optional dependencies for qt6-webengine
    pipewire: WebRTC desktop sharing under Wayland [installed]
( 682/1299) installing signon-ui                                       [----------------------------------------] 100%
( 683/1299) installing kaccounts-integration                           [----------------------------------------] 100%
Optional dependencies for kaccounts-integration
    qt6-declarative: QML plugin [installed]
( 684/1299) installing purpose                                         [----------------------------------------] 100%
Optional dependencies for purpose
    bluedevil: sharing via Bluetooth [installed]
    kdeclarative: Nextcloud and YouTube plugins [installed]
    kdeconnect: sharing to smartphone via KDE Connect [pending]
    prison: QR code plugin [pending]
    telegram-desktop: sharing via Telegram
( 685/1299) installing qt6-websockets                                  [----------------------------------------] 100%
Optional dependencies for qt6-websockets
    qt6-declarative: QML bindings [installed]
( 686/1299) installing qcoro                                           [----------------------------------------] 100%
( 687/1299) installing qqc2-desktop-style                              [----------------------------------------] 100%
( 688/1299) installing qt6-webview                                     [----------------------------------------] 100%
( 689/1299) installing discover                                        [----------------------------------------] 100%
Optional dependencies for discover
    flatpak: Flatpak packages support [pending]
    fwupd: firmware update support
    packagekit-qt6: to manage packages from Arch Linux repositories (not recommended, use at your own risk) [pending]
( 690/1299) installing elfutils                                        [----------------------------------------] 100%
( 691/1299) installing gdb-common                                      [----------------------------------------] 100%
( 692/1299) installing source-highlight                                [----------------------------------------] 100%
Optional dependencies for source-highlight
    lesspipe: src-hilite-lesspipe.sh
( 693/1299) installing gdb                                             [----------------------------------------] 100%
( 694/1299) installing python-psutil                                   [----------------------------------------] 100%
( 695/1299) installing python-pygdbmi                                  [----------------------------------------] 100%
( 696/1299) installing python-sentry_sdk                               [----------------------------------------] 100%
Optional dependencies for python-sentry_sdk
    python-aiohttp: adds support for the AIOHTTP-Server Web Framework
    python-bottle: adds support for the Bottle Web Framework
    python-celery: adds support for the Celery Task Queue System
    python-django: adds support for the Django Web Framework
    python-falcon: adds support for the Falcon Web Framework
    python-fastapi: adds support for the FastAPI framework
    python-flask: adds support for the Flask Web Framework
    python-grpcio: gRPC integration
    python-httpx: HTTPX integration
    python-loguru: Loguru Integration
    python-multipart: Optional dependency of Starlette to parse form data
    python-pymongo: PyMongo integration
    python-quart: adds support for the Quart Web Framework
    python-redis: adds support for the RQ Job Queue System
    python-sqlalchemy: captures queries from SQLAlchemy as breadcrumbs
    python-starlette: adds support for the Starlette Framework
    python-tornado: adds support for the Tornado Web Framework
    python-pure-eval: for richer stacktraces & additional variables
    python-executing: for richer stacktraces & better function names
( 697/1299) installing syntax-highlighting                             [----------------------------------------] 100%
Optional dependencies for syntax-highlighting
    qt6-declarative: QML bindings [installed]
( 698/1299) installing drkonqi                                         [----------------------------------------] 100%
( 699/1299) installing accountsservice                                 [----------------------------------------] 100%
( 700/1299) installing libmalcontent                                   [----------------------------------------] 100%
( 701/1299) installing composefs                                       [----------------------------------------] 100%
( 702/1299) installing ostree                                          [----------------------------------------] 100%
( 703/1299) installing libgirepository                                 [----------------------------------------] 100%
( 704/1299) installing gobject-introspection-runtime                   [----------------------------------------] 100%
( 705/1299) installing python-gobject                                  [----------------------------------------] 100%
Optional dependencies for python-gobject
    python-cairo: Cairo bindings [pending]
( 706/1299) installing xdg-dbus-proxy                                  [----------------------------------------] 100%
( 707/1299) installing flatpak                                         [----------------------------------------] 100%
( 708/1299) installing flatpak-kcm                                     [----------------------------------------] 100%
( 709/1299) installing kactivitymanagerd                               [----------------------------------------] 100%
( 710/1299) installing kpty                                            [----------------------------------------] 100%
( 711/1299) installing kdesu                                           [----------------------------------------] 100%
( 712/1299) installing kparts                                          [----------------------------------------] 100%
( 713/1299) installing kde-cli-tools                                   [----------------------------------------] 100%
Optional dependencies for kde-cli-tools
    kinfocenter: for kinfo [pending]
( 714/1299) installing xsettingsd                                      [----------------------------------------] 100%
( 715/1299) installing kde-gtk-config                                  [----------------------------------------] 100%
Optional dependencies for kde-gtk-config
    gtk3: GTK3 apps support [installed]
( 716/1299) installing kauth                                           [----------------------------------------] 100%
( 717/1299) installing kholidays                                       [----------------------------------------] 100%
Optional dependencies for kholidays
    qt6-declarative: QML bindings [installed]
( 718/1299) installing krunner                                         [----------------------------------------] 100%
( 719/1299) installing kunitconversion                                 [----------------------------------------] 100%
Optional dependencies for kunitconversion
    pyside6: Python bindings
( 720/1299) installing libmbim                                         [----------------------------------------] 100%
( 721/1299) installing libqrtr-glib                                    [----------------------------------------] 100%
( 722/1299) installing libqmi                                          [----------------------------------------] 100%
( 723/1299) installing protobuf                                        [----------------------------------------] 100%
( 724/1299) installing protobuf-c                                      [----------------------------------------] 100%
( 725/1299) installing libssc                                          [----------------------------------------] 100%
( 726/1299) installing iio-sensor-proxy                                [----------------------------------------] 100%
( 727/1299) installing kglobalacceld                                   [----------------------------------------] 100%
( 728/1299) installing knighttime                                      [----------------------------------------] 100%
( 729/1299) installing kquickcharts                                    [----------------------------------------] 100%
( 730/1299) installing layer-shell-qt                                  [----------------------------------------] 100%
Optional dependencies for layer-shell-qt
    qt6-declarative: QML bindings [installed]
( 731/1299) installing libkscreen                                      [----------------------------------------] 100%
( 732/1299) installing kscreenlocker                                   [----------------------------------------] 100%
( 733/1299) installing kwayland                                        [----------------------------------------] 100%
( 734/1299) installing libdisplay-info                                 [----------------------------------------] 100%
( 735/1299) installing libei                                           [----------------------------------------] 100%
( 736/1299) installing libqaccessibilityclient-qt6                     [----------------------------------------] 100%
( 737/1299) installing libxcvt                                         [----------------------------------------] 100%
( 738/1299) installing milou                                           [----------------------------------------] 100%
( 739/1299) installing libwireplumber                                  [----------------------------------------] 100%
( 740/1299) installing lua                                             [----------------------------------------] 100%
( 741/1299) installing wireplumber                                     [----------------------------------------] 100%
Created symlink '/etc/systemd/user/pipewire-session-manager.service' → '/usr/lib/systemd/user/wireplumber.service'.
Created symlink '/etc/systemd/user/pipewire.service.wants/wireplumber.service' → '/usr/lib/systemd/user/wireplumber.service'.
Optional dependencies for wireplumber
    wireplumber-docs: Documentation
( 742/1299) installing pipewire-session-manager                        [----------------------------------------] 100%
( 743/1299) installing kwin                                            [----------------------------------------] 100%
Optional dependencies for kwin
    plasma-keyboard: virtual keyboard [pending]
( 744/1299) installing kded                                            [----------------------------------------] 100%
( 745/1299) installing kdnssd                                          [----------------------------------------] 100%
( 746/1299) installing kdsoap                                          [----------------------------------------] 100%
( 747/1299) installing kdsoap-ws-discovery-client                      [----------------------------------------] 100%
( 748/1299) installing libinih                                         [----------------------------------------] 100%
( 749/1299) installing exiv2                                           [----------------------------------------] 100%
( 750/1299) installing libkexiv2                                       [----------------------------------------] 100%
( 751/1299) installing libmtp                                          [----------------------------------------] 100%
( 752/1299) installing ripgrep                                         [----------------------------------------] 100%
( 753/1299) installing ripgrep-all                                     [----------------------------------------] 100%
Optional dependencies for ripgrep-all
    ffmpeg: for the ffmpeg adapter [installed]
    graphicsmagick: for the pdfpages adapter
    pandoc: for the pandoc adapter
    poppler: for the poppler adapter [pending]
    tesseract: for the tesseract adapter [pending]
( 754/1299) installing tevent                                          [----------------------------------------] 100%
Optional dependencies for tevent
    python: for python bindings [installed]
( 755/1299) installing ldb                                             [----------------------------------------] 100%
Optional dependencies for ldb
    python: for python bindings [installed]
( 756/1299) installing smbclient                                       [----------------------------------------] 100%
Optional dependencies for smbclient
    python-dnspython: samba_dnsupdate and samba_upgradedns in AD setup
    python-markdown: for samba-tool domain schemeupgrade
    glusterfs: for vfs_glusterfs support
( 757/1299) installing kio-extras                                      [----------------------------------------] 100%
Optional dependencies for kio-extras
    kimageformats: thumbnails for additional image formats [pending]
    libappimage: AppImage thumbnails
    openexr: EXR format thumbnails [pending]
    perl: info kioslave [installed]
    plasma-activities-stats: recently used kioslave [pending]
    qt6-imageformats: thumbnails for additional image formats [pending]
    taglib: audio file thumbnails [pending]
( 758/1299) installing kio-fuse                                        [----------------------------------------] 100%
( 759/1299) installing kpipewire                                       [----------------------------------------] 100%
( 760/1299) installing libksysguard                                    [----------------------------------------] 100%
( 761/1299) installing ksystemstats                                    [----------------------------------------] 100%
Optional dependencies for ksystemstats
    libnl: network usage monitor [installed]
    networkmanager-qt: network usage monitor [pending]
    systemd-libs: GPU monitor [installed]
( 762/1299) installing editorconfig-core-c                             [----------------------------------------] 100%
( 763/1299) installing qt6-speech                                      [----------------------------------------] 100%
Optional dependencies for qt6-speech
    flite: flite TTS backend
    speech-dispatcher: speech-dispatcher TTS backend
    qt6-declarative: QML bindings [installed]
( 764/1299) installing ktexteditor                                     [----------------------------------------] 100%
Optional dependencies for ktexteditor
    git: git integration [pending]
( 765/1299) installing ktextwidgets                                    [----------------------------------------] 100%
( 766/1299) installing libqalculate                                    [----------------------------------------] 100%
Optional dependencies for libqalculate
    gnuplot: for plotting support
( 767/1299) installing ocean-sound-theme                               [----------------------------------------] 100%
( 768/1299) installing plasma-activities-stats                         [----------------------------------------] 100%
( 769/1299) installing libdmtx                                         [----------------------------------------] 100%
( 770/1299) installing qrencode                                        [----------------------------------------] 100%
( 771/1299) installing zint                                            [----------------------------------------] 100%
( 772/1299) installing zxing-cpp                                       [----------------------------------------] 100%
Optional dependencies for zxing-cpp
    qt6-multimedia: for ZXingQtCamReader [installed]
( 773/1299) installing prison                                          [----------------------------------------] 100%
Optional dependencies for prison
    qt6-declarative: QML bindings [installed]
( 774/1299) installing qt6-location                                    [----------------------------------------] 100%
( 775/1299) installing hunspell                                        [----------------------------------------] 100%
Optional dependencies for hunspell
    perl: for ispellaff2myspell [installed]
( 776/1299) installing qt6-virtualkeyboard                             [----------------------------------------] 100%
( 777/1299) installing xorg-xmessage                                   [----------------------------------------] 100%
( 778/1299) installing xorg-xrdb                                       [----------------------------------------] 100%
Optional dependencies for xorg-xrdb
    gcc: for preprocessing [pending]
    mcpp: a lightweight alternative for preprocessing
( 779/1299) installing xorg-fonts-encodings                            [----------------------------------------] 100%
( 780/1299) installing libfontenc                                      [----------------------------------------] 100%
( 781/1299) installing libxfont2                                       [----------------------------------------] 100%
( 782/1299) installing xorg-xkbcomp                                    [----------------------------------------] 100%
( 783/1299) installing xorg-setxkbmap                                  [----------------------------------------] 100%
( 784/1299) installing xorg-server-common                              [----------------------------------------] 100%
( 785/1299) installing libdecor                                        [----------------------------------------] 100%
Optional dependencies for libdecor
    gtk3: gtk3 support [installed]
( 786/1299) installing xorg-xwayland                                   [----------------------------------------] 100%
( 787/1299) installing qqc2-breeze-style                               [----------------------------------------] 100%
( 788/1299) installing ttf-hack                                        [----------------------------------------] 100%
( 789/1299) installing xdg-desktop-portal-kde                          [----------------------------------------] 100%
( 790/1299) installing plasma-integration                              [----------------------------------------] 100%
( 791/1299) installing plasma-workspace                                [----------------------------------------] 100%
Optional dependencies for plasma-workspace
    appmenu-gtk-module: global menu support for some GTK3 applications
    baloo: Baloo search runner [pending]
    discover: manage applications installation from the launcher [installed]
    kdepim-addons: displaying PIM events in the calendar
    kwayland-integration: Wayland integration for Qt5 applications [pending]
    kwin-x11: X session window manager [pending]
    networkmanager-qt: IP based geolocation [pending]
    plasma-workspace-wallpapers: additional wallpapers [pending]
    plasma5-integration: use Plasma settings in Qt5 applications
    xdg-desktop-portal-gtk: sync font settings to Flatpak apps [installed]
( 792/1299) installing jsoncpp                                         [----------------------------------------] 100%
Optional dependencies for jsoncpp
    jsoncpp-doc: documentation
( 793/1299) installing openxr                                          [----------------------------------------] 100%
( 794/1299) installing qt6-quicktimeline                               [----------------------------------------] 100%
( 795/1299) installing qt6-quick3d                                     [----------------------------------------] 100%
Optional dependencies for qt6-quick3d
    assimp: assimp import plugin
( 796/1299) installing kdeplasma-addons                                [----------------------------------------] 100%
Optional dependencies for kdeplasma-addons
    networkmanager-qt: POTD wallpaper [pending]
    qt6-webengine: dictionary and webbrowser applets [installed]
    quota-tools: disk quota applet
( 797/1299) installing kgamma                                          [----------------------------------------] 100%
( 798/1299) installing aha                                             [----------------------------------------] 100%
( 799/1299) installing clinfo                                          [----------------------------------------] 100%
( 800/1299) installing glu                                             [----------------------------------------] 100%
( 801/1299) installing mesa-utils                                      [----------------------------------------] 100%
( 802/1299) installing systemsettings                                  [----------------------------------------] 100%
( 803/1299) installing vulkan-tools                                    [----------------------------------------] 100%
( 804/1299) installing wayland-utils                                   [----------------------------------------] 100%
( 805/1299) installing xorg-xdpyinfo                                   [----------------------------------------] 100%
( 806/1299) installing kinfocenter                                     [----------------------------------------] 100%
Optional dependencies for kinfocenter
    fwupd: firmware security module
    plasma-disks: SMART devices health monitor [pending]
( 807/1299) installing kmenuedit                                       [----------------------------------------] 100%
( 808/1299) installing sdl3_ttf                                        [----------------------------------------] 100%
( 809/1299) installing freerdp                                         [----------------------------------------] 100%
( 810/1299) installing qtkeychain-qt6                                  [----------------------------------------] 100%
( 811/1299) installing krdp                                            [----------------------------------------] 100%
( 812/1299) installing kimageformats                                   [----------------------------------------] 100%
Optional dependencies for kimageformats
    imath: EXR format support [pending]
    jxrlib: JXR format support
    karchive: plugin for Krita and OpenRaster images [installed]
    libavif: AVIF format support [pending]
    libheif: HEIF format support [pending]
    libjxl: JPEG-XL format support [installed]
    libraw: RAW format support [pending]
    openjpeg2: JPEG 2000 format support [installed]
    openexr: EXR format support [pending]
( 813/1299) installing plasma5support                                  [----------------------------------------] 100%
Optional dependencies for plasma5support
    gpsd: GPS-based geolocation dataengine
    networkmanager-qt: IP-based geolocation dataengine [pending]
    plasma-activities: activities dataengine [installed]
( 814/1299) installing kscreen                                         [----------------------------------------] 100%
( 815/1299) installing ksshaskpass                                     [----------------------------------------] 100%
( 816/1299) installing socat                                           [----------------------------------------] 100%
( 817/1299) installing kwallet-pam                                     [----------------------------------------] 100%
( 818/1299) installing qt6-sensors                                     [----------------------------------------] 100%
Optional dependencies for qt6-sensors
    qt6-declarative: QML bindings [installed]
    iio-sensor-proxy: iio-sensor-proxy backend [installed]
( 819/1299) installing kwin-x11                                        [----------------------------------------] 100%
( 820/1299) installing kwrited                                         [----------------------------------------] 100%
( 821/1299) installing oxygen-icons                                    [----------------------------------------] 100%
( 822/1299) installing oxygen-cursors                                  [----------------------------------------] 100%
( 823/1299) installing oxygen                                          [----------------------------------------] 100%
Optional dependencies for oxygen
    oxygen5: Oxygen widget style for Qt5 applications
( 824/1299) installing oxygen-sounds                                   [----------------------------------------] 100%
( 825/1299) installing kcontacts                                       [----------------------------------------] 100%
Optional dependencies for kcontacts
    qt6-declarative: QML bindings [installed]
( 826/1299) installing kpeople                                         [----------------------------------------] 100%
Optional dependencies for kpeople
    qt6-declarative: QML bindings [installed]
( 827/1299) installing libfakekey                                      [----------------------------------------] 100%
( 828/1299) installing mobile-broadband-provider-info                  [----------------------------------------] 100%
( 829/1299) installing libmm-glib                                      [----------------------------------------] 100%
( 830/1299) installing modemmanager                                    [----------------------------------------] 100%
Optional dependencies for modemmanager
    usb_modeswitch: install if your modem shows up as a storage drive
( 831/1299) installing modemmanager-qt                                 [----------------------------------------] 100%
( 832/1299) installing pulseaudio-qt                                   [----------------------------------------] 100%
( 833/1299) installing qt6-connectivity                                [----------------------------------------] 100%
( 834/1299) installing kdeconnect                                      [----------------------------------------] 100%
Optional dependencies for kdeconnect
    python-nautilus: Nautilus integration
    qt6-tools: for some runcommand plugin actions [installed]
    sshfs: remote filesystem browser [installed]
( 835/1299) installing plasma-nano                                     [----------------------------------------] 100%
( 836/1299) installing plasma-bigscreen                                [----------------------------------------] 100%
Optional dependencies for plasma-bigscreen
    libcec: support for CEC devices (ex. TV Remotes)
( 837/1299) installing libtommath                                      [----------------------------------------] 100%
( 838/1299) installing convertlit                                      [----------------------------------------] 100%
( 839/1299) installing libzip                                          [----------------------------------------] 100%
( 840/1299) installing ebook-tools                                     [----------------------------------------] 100%
( 841/1299) installing poppler                                         [----------------------------------------] 100%
Optional dependencies for poppler
    poppler-data: highly recommended encoding data to display PDF documents with certain encodings and characters
    [pending]
( 842/1299) installing poppler-qt6                                     [----------------------------------------] 100%
( 843/1299) installing taglib                                          [----------------------------------------] 100%
( 844/1299) installing kfilemetadata                                   [----------------------------------------] 100%
Optional dependencies for kfilemetadata
    catdoc: Extract text from Office 98 files
    kdegraphics-mobipocket: MOBI extractor [pending]
    libappimage: AppImage extractor
( 845/1299) installing plasma-browser-integration                      [----------------------------------------] 100%
( 846/1299) installing baloo                                           [----------------------------------------] 100%
Optional dependencies for baloo
    qt6-declarative: QML bindings [installed]
( 847/1299) installing noto-fonts-emoji                                [----------------------------------------] 100%
( 848/1299) installing knotifyconfig                                   [----------------------------------------] 100%
( 849/1299) installing polkit-kde-agent                                [----------------------------------------] 100%
( 850/1299) installing i2c-tools                                       [----------------------------------------] 100%
Optional dependencies for i2c-tools
    read-edid: for decode-edid script
    python: for smbus module [installed]
( 851/1299) installing ddcutil                                         [----------------------------------------] 100%
( 852/1299) installing powerdevil                                      [----------------------------------------] 100%
Optional dependencies for powerdevil
    kinfocenter: for the Energy Information KCM [installed]
    power-profiles-daemon: power profiles support
    tlp: alternative power profiles support
( 853/1299) installing xdg-user-dirs                                   [----------------------------------------] 100%
Created symlink '/etc/systemd/user/graphical-session-pre.target.wants/xdg-user-dirs.service' → '/usr/lib/systemd/user/xdg-user-dirs.service'.
( 854/1299) installing plasma-desktop                                  [----------------------------------------] 100%
Optional dependencies for plasma-desktop
    bluedevil: Bluetooth applet [installed]
    glib2: kimpanel IBUS support [installed]
    ibus: kimpanel IBUS support
    kaccounts-integration: OpenDesktop integration plugin [installed]
    kscreen: screen management [installed]
    libaccounts-qt: OpenDesktop integration plugin [installed]
    packagekit-qt6: to install new krunner plugins [pending]
    plasma-nm: Network manager applet [pending]
    plasma-pa: Audio volume applet [pending]
    scim: kimpanel SCIM support
( 855/1299) installing plasma-disks                                    [----------------------------------------] 100%
( 856/1299) installing plasma-firewall                                 [----------------------------------------] 100%
Optional dependencies for plasma-firewall
    firewalld: firewalld backend [pending]
    iproute2: netstat backend [installed]
    python: ufw backend [installed]
    ufw: ufw backend
( 857/1299) installing plasma-keyboard                                 [----------------------------------------] 100%
( 858/1299) installing plasma-login-manager                            [----------------------------------------] 100%
( 859/1299) installing libnm                                           [----------------------------------------] 100%
( 860/1299) installing libndp                                          [----------------------------------------] 100%
( 861/1299) installing libteam                                         [----------------------------------------] 100%
( 862/1299) installing wpa_supplicant                                  [----------------------------------------] 100%
( 863/1299) installing networkmanager                                  [----------------------------------------] 100%
warning: /home/retroTech/vita-build/x86_64/airootfs/etc/NetworkManager/NetworkManager.conf installed as /home/retroTech/vita-build/x86_64/airootfs/etc/NetworkManager/NetworkManager.conf.pacnew
Optional dependencies for networkmanager
    bluez: Bluetooth support [installed]
    dhcpcd: alternative DHCP client [installed]
    dnsmasq: connection sharing [pending]
    firewalld: firewall support [pending]
    iptables: connection sharing [installed]
    iwd: wpa_supplicant alternative [pending]
    libnvme: NBFT support [installed]
    modemmanager: cellular network support [installed]
    nftables: connection sharing [installed]
    openresolv: alternative resolv.conf manager [installed]
    pacrunner: PAC proxy support
    polkit: let non-root users control networking [installed]
    ppp: dialup connection support [installed]
( 864/1299) installing networkmanager-qt                               [----------------------------------------] 100%
Optional dependencies for networkmanager-qt
    qt6-declarative: QML bindings [installed]
( 865/1299) installing plasma-nm                                       [----------------------------------------] 100%
Optional dependencies for plasma-nm
    openconnect: Cisco AnyConnect VPN plugin [pending]
    qrca: QR code scanner
    qt6-webengine: Cisco AnyConnect VPN plugin [installed]
( 866/1299) installing alsa-card-profiles                              [----------------------------------------] 100%
( 867/1299) installing libebur128                                      [----------------------------------------] 100%
( 868/1299) installing libfdk-aac                                      [----------------------------------------] 100%
( 869/1299) installing libfreeaptx                                     [----------------------------------------] 100%
( 870/1299) installing liblc3                                          [----------------------------------------] 100%
Optional dependencies for liblc3
    python: Python bindings [installed]
( 871/1299) installing libldac                                         [----------------------------------------] 100%
( 872/1299) installing libmysofa                                       [----------------------------------------] 100%
( 873/1299) installing serd                                            [----------------------------------------] 100%
Optional dependencies for serd
    serd-docs: for developer documentation
( 874/1299) installing zix                                             [----------------------------------------] 100%
Optional dependencies for zix
    zix-docs: for developer documentation
( 875/1299) installing sord                                            [----------------------------------------] 100%
Optional dependencies for sord
    sord-docs: for developer documentation
( 876/1299) installing lv2                                             [----------------------------------------] 100%
Optional dependencies for lv2
    lv2-docs: for developer documentation
    lv2-example-plugins: for example plugins
    python-lxml: for lv2specgen.py [pending]
    python-markdown: for lv2specgen.py
    python-pygments: for lv2specgen.py
    python-rdflib: for lv2specgen.py
    sord: for lv2_validate [installed]
( 877/1299) installing sratom                                          [----------------------------------------] 100%
Optional dependencies for sratom
    sratom-docs: for developer documentation
( 878/1299) installing lilv                                            [----------------------------------------] 100%
Optional dependencies for lilv
    lilv-docs: for documentation
    lilv-tools: for CLI tools
    python-lilv: for Python bindings
( 879/1299) installing sbc                                             [----------------------------------------] 100%
( 880/1299) installing spandsp                                         [----------------------------------------] 100%
( 881/1299) installing webrtc-audio-processing-1                       [----------------------------------------] 100%
( 882/1299) installing pipewire-audio                                  [----------------------------------------] 100%
( 883/1299) installing pipewire-pulse                                  [----------------------------------------] 100%
Created symlink '/etc/systemd/user/sockets.target.wants/pipewire-pulse.socket' → '/usr/lib/systemd/user/pipewire-pulse.socket'.
( 884/1299) installing plasma-pa                                       [----------------------------------------] 100%
( 885/1299) installing plasma-sdk                                      [----------------------------------------] 100%
( 886/1299) installing plasma-systemmonitor                            [----------------------------------------] 100%
( 887/1299) installing bolt                                            [----------------------------------------] 100%
( 888/1299) installing plasma-thunderbolt                              [----------------------------------------] 100%
( 889/1299) installing gocryptfs                                       [----------------------------------------] 100%
( 890/1299) installing plasma-vault                                    [----------------------------------------] 100%
Optional dependencies for plasma-vault
    cryfs: to open old vaults created with CryFS
    encfs: to open old vaults created with EncFS
( 891/1299) installing plasma-welcome                                  [----------------------------------------] 100%
( 892/1299) installing plasma-workspace-wallpapers                     [----------------------------------------] 100%
( 893/1299) installing plymouth-kcm                                    [----------------------------------------] 100%
( 894/1299) installing print-manager                                   [----------------------------------------] 100%
Optional dependencies for print-manager
    system-config-printer: auto-detect the printer driver [pending]
( 895/1299) installing xf86-input-libinput                             [----------------------------------------] 100%
( 896/1299) installing xorg-server                                     [----------------------------------------] 100%
>>> xorg-server has now the ability to run without root rights with
    the help of systemd-logind. xserver will fail to run if not launched
    from the same virtual terminal as was used to log in.
    Without root rights, log files will be in ~/.local/share/xorg/ directory.

    Old behavior can be restored through Xorg.wrap config file.
    See Xorg.wrap man page (man xorg.wrap).
( 897/1299) installing xorg-xauth                                      [----------------------------------------] 100%
( 898/1299) installing sddm                                            [----------------------------------------] 100%
Optional dependencies for sddm
    qt5-declarative: for using Qt5 themes [pending]
( 899/1299) installing sddm-kcm                                        [----------------------------------------] 100%
( 900/1299) installing blas                                            [----------------------------------------] 100%
( 901/1299) installing cblas                                           [----------------------------------------] 100%
( 902/1299) installing cdparanoia                                      [----------------------------------------] 100%
( 903/1299) installing gst-plugins-base                                [----------------------------------------] 100%
( 904/1299) installing lapack                                          [----------------------------------------] 100%
( 905/1299) installing libdc1394                                       [----------------------------------------] 100%
( 906/1299) installing imath                                           [----------------------------------------] 100%
Optional dependencies for imath
    boost-libs: python bindings [installed]
    python: python bindings [installed]
( 907/1299) installing openjph                                         [----------------------------------------] 100%
( 908/1299) installing openexr                                         [----------------------------------------] 100%
Optional dependencies for openexr
    python: for python bindings [installed]
( 909/1299) installing verdict                                         [----------------------------------------] 100%
( 910/1299) installing opencv                                          [----------------------------------------] 100%
Optional dependencies for opencv
    opencv-samples: samples
    vtk: for the viz module
    glew: for the viz module
    qt6-base: for the HighGUI module [installed]
    hdf5: for the HDF5 module
    opencl-icd-loader: For coding with OpenCL [installed]
    java-runtime: Java interface
( 911/1299) installing kquickimageeditor                               [----------------------------------------] 100%
( 912/1299) installing freeglut                                        [----------------------------------------] 100%
( 913/1299) installing jasper                                          [----------------------------------------] 100%
Optional dependencies for jasper
    jasper-doc: documentation
( 914/1299) installing libmng                                          [----------------------------------------] 100%
( 915/1299) installing qt6-imageformats                                [----------------------------------------] 100%
( 916/1299) installing leptonica                                       [----------------------------------------] 100%
( 917/1299) installing tesseract-data-afr                              [----------------------------------------] 100%
( 918/1299) installing tesseract-data-osd                              [----------------------------------------] 100%
( 919/1299) installing tesseract                                       [----------------------------------------] 100%
Optional dependencies for tesseract
    icu: for text2image [installed]
    pango: for text2image [installed]
    tesseract-data-afr: OCR data (afr) [installed]
    tesseract-data-amh: OCR data (amh)
    tesseract-data-ara: OCR data (ara)
    tesseract-data-asm: OCR data (asm)
    tesseract-data-aze: OCR data (aze)
    tesseract-data-aze_cyrl: OCR data (aze_cyrl)
    tesseract-data-bel: OCR data (bel)
    tesseract-data-ben: OCR data (ben)
    tesseract-data-bod: OCR data (bod)
    tesseract-data-bos: OCR data (bos)
    tesseract-data-bre: OCR data (bre)
    tesseract-data-bul: OCR data (bul)
    tesseract-data-cat: OCR data (cat)
    tesseract-data-ceb: OCR data (ceb)
    tesseract-data-ces: OCR data (ces)
    tesseract-data-chi_sim: OCR data (chi_sim)
    tesseract-data-chi_tra: OCR data (chi_tra)
    tesseract-data-chr: OCR data (chr)
    tesseract-data-cos: OCR data (cos)
    tesseract-data-cym: OCR data (cym)
    tesseract-data-dan: OCR data (dan)
    tesseract-data-dan_frak: OCR data (dan_frak)
    tesseract-data-deu: OCR data (deu)
    tesseract-data-deu_frak: OCR data (deu_frak)
    tesseract-data-div: OCR data (div)
    tesseract-data-dzo: OCR data (dzo)
    tesseract-data-ell: OCR data (ell)
    tesseract-data-eng: OCR data (eng)
    tesseract-data-enm: OCR data (enm)
    tesseract-data-epo: OCR data (epo)
    tesseract-data-equ: OCR data (equ)
    tesseract-data-est: OCR data (est)
    tesseract-data-eus: OCR data (eus)
    tesseract-data-fao: OCR data (fao)
    tesseract-data-fas: OCR data (fas)
    tesseract-data-fil: OCR data (fil)
    tesseract-data-fin: OCR data (fin)
    tesseract-data-fra: OCR data (fra)
    tesseract-data-frk: OCR data (frk)
    tesseract-data-frm: OCR data (frm)
    tesseract-data-fry: OCR data (fry)
    tesseract-data-gla: OCR data (gla)
    tesseract-data-gle: OCR data (gle)
    tesseract-data-glg: OCR data (glg)
    tesseract-data-grc: OCR data (grc)
    tesseract-data-guj: OCR data (guj)
    tesseract-data-hat: OCR data (hat)
    tesseract-data-heb: OCR data (heb)
    tesseract-data-hin: OCR data (hin)
    tesseract-data-hrv: OCR data (hrv)
    tesseract-data-hun: OCR data (hun)
    tesseract-data-hye: OCR data (hye)
    tesseract-data-iku: OCR data (iku)
    tesseract-data-ind: OCR data (ind)
    tesseract-data-isl: OCR data (isl)
    tesseract-data-ita: OCR data (ita)
    tesseract-data-ita_old: OCR data (ita_old)
    tesseract-data-jav: OCR data (jav)
    tesseract-data-jpn: OCR data (jpn)
    tesseract-data-jpn_vert: OCR data (jpn_vert)
    tesseract-data-kan: OCR data (kan)
    tesseract-data-kat: OCR data (kat)
    tesseract-data-kat_old: OCR data (kat_old)
    tesseract-data-kaz: OCR data (kaz)
    tesseract-data-khm: OCR data (khm)
    tesseract-data-kir: OCR data (kir)
    tesseract-data-kmr: OCR data (kmr)
    tesseract-data-kor: OCR data (kor)
    tesseract-data-kor_vert: OCR data (kor_vert)
    tesseract-data-lao: OCR data (lao)
    tesseract-data-lat: OCR data (lat)
    tesseract-data-lav: OCR data (lav)
    tesseract-data-lit: OCR data (lit)
    tesseract-data-ltz: OCR data (ltz)
    tesseract-data-mal: OCR data (mal)
    tesseract-data-mar: OCR data (mar)
    tesseract-data-mkd: OCR data (mkd)
    tesseract-data-mlt: OCR data (mlt)
    tesseract-data-mon: OCR data (mon)
    tesseract-data-mri: OCR data (mri)
    tesseract-data-msa: OCR data (msa)
    tesseract-data-mya: OCR data (mya)
    tesseract-data-nep: OCR data (nep)
    tesseract-data-nld: OCR data (nld)
    tesseract-data-nor: OCR data (nor)
    tesseract-data-oci: OCR data (oci)
    tesseract-data-ori: OCR data (ori)
    tesseract-data-pan: OCR data (pan)
    tesseract-data-pol: OCR data (pol)
    tesseract-data-por: OCR data (por)
    tesseract-data-pus: OCR data (pus)
    tesseract-data-que: OCR data (que)
    tesseract-data-ron: OCR data (ron)
    tesseract-data-rus: OCR data (rus)
    tesseract-data-san: OCR data (san)
    tesseract-data-sin: OCR data (sin)
    tesseract-data-slk: OCR data (slk)
    tesseract-data-slk_frak: OCR data (slk_frak)
    tesseract-data-slv: OCR data (slv)
    tesseract-data-snd: OCR data (snd)
    tesseract-data-spa: OCR data (spa)
    tesseract-data-spa_old: OCR data (spa_old)
    tesseract-data-sqi: OCR data (sqi)
    tesseract-data-srp: OCR data (srp)
    tesseract-data-srp_latn: OCR data (srp_latn)
    tesseract-data-sun: OCR data (sun)
    tesseract-data-swa: OCR data (swa)
    tesseract-data-swe: OCR data (swe)
    tesseract-data-syr: OCR data (syr)
    tesseract-data-tam: OCR data (tam)
    tesseract-data-tat: OCR data (tat)
    tesseract-data-tel: OCR data (tel)
    tesseract-data-tgk: OCR data (tgk)
    tesseract-data-tgl: OCR data (tgl)
    tesseract-data-tha: OCR data (tha)
    tesseract-data-tir: OCR data (tir)
    tesseract-data-ton: OCR data (ton)
    tesseract-data-tur: OCR data (tur)
    tesseract-data-uig: OCR data (uig)
    tesseract-data-ukr: OCR data (ukr)
    tesseract-data-urd: OCR data (urd)
    tesseract-data-uzb: OCR data (uzb)
    tesseract-data-uzb_cyrl: OCR data (uzb_cyrl)
    tesseract-data-vie: OCR data (vie)
    tesseract-data-yid: OCR data (yid)
    tesseract-data-yor: OCR data (yor)
( 920/1299) installing spectacle                                       [----------------------------------------] 100%
( 921/1299) installing cxx-rust-cssparser                              [----------------------------------------] 100%
( 922/1299) installing union                                           [----------------------------------------] 100%
( 923/1299) installing xf86-input-wacom                                [----------------------------------------] 100%
( 924/1299) installing wacomtablet                                     [----------------------------------------] 100%
( 925/1299) installing vita-kde-settings                               [----------------------------------------] 100%
( 926/1299) installing baloo-widgets                                   [----------------------------------------] 100%
( 927/1299) installing dolphin                                         [----------------------------------------] 100%
Optional dependencies for dolphin
    dolphin-plugins: extra plugins [pending]
    ffmpegthumbs: video thumbnails [pending]
    filelight: detailed disk usage statistics [pending]
    kde-cli-tools: for editing file type options [installed]
    kdegraphics-thumbnailers: PDF and PS thumbnails [pending]
    kdenetwork-filesharing: samba usershare properties menu [pending]
    kdf: view disk usage
    kio-admin: for managing files as administrator [pending]
    kompare: comparing files menu action
    konsole: terminal panel [pending]
    purpose: share context menu [installed]
( 928/1299) installing dolphin-plugins                                 [----------------------------------------] 100%
( 929/1299) installing kio-admin                                       [----------------------------------------] 100%
( 930/1299) installing ffmpegthumbs                                    [----------------------------------------] 100%
( 931/1299) installing jbig2dec                                        [----------------------------------------] 100%
( 932/1299) installing libpaper                                        [----------------------------------------] 100%
( 933/1299) installing ijs                                             [----------------------------------------] 100%
( 934/1299) installing libidn                                          [----------------------------------------] 100%
( 935/1299) installing poppler-data                                    [----------------------------------------] 100%
( 936/1299) installing ghostscript                                     [----------------------------------------] 100%
Optional dependencies for ghostscript
    gtk3: needed for gsx [installed]
( 937/1299) installing kdegraphics-mobipocket                          [----------------------------------------] 100%
( 938/1299) installing libraw                                          [----------------------------------------] 100%
( 939/1299) installing libkdcraw                                       [----------------------------------------] 100%
( 940/1299) installing kdegraphics-thumbnailers                        [----------------------------------------] 100%
( 941/1299) installing ark                                             [----------------------------------------] 100%
Optional dependencies for ark
    arj: ARJ format support
    lrzip: LRZ format support [installed]
    lzop: LZO format support [installed]
    7zip: 7Z format support
    unarchiver: RAR format support
    unrar: RAR decompression support [pending]
( 942/1299) installing libmpc                                          [----------------------------------------] 100%
( 943/1299) installing kcalc                                           [----------------------------------------] 100%
( 944/1299) installing samba                                           [----------------------------------------] 100%
Optional dependencies for samba
    python-dnspython: netads_dns.py, dnsresolver.py and traffic_packets.py 
    python-markdown: ms_schema_markdown.py and ms_forest_updates_markdown.py
    python-cryptography: lockout_tests.py gp_cert_auto_enroll_ext.py gpo.py and kcrypto.py [installed]
( 945/1299) installing kdenetwork-filesharing                          [----------------------------------------] 100%
( 946/1299) installing cfitsio                                         [----------------------------------------] 100%
( 947/1299) installing kcolorpicker                                    [----------------------------------------] 100%
( 948/1299) installing kimageannotator                                 [----------------------------------------] 100%
( 949/1299) installing gwenview                                        [----------------------------------------] 100%
Optional dependencies for gwenview
    kamera: import pictures from gphoto2 cameras
    kimageformats: support for xcf, exr, psd, and more image formats [installed]
    qt6-imageformats: support for tiff, webp, and more image formats [installed]
( 950/1299) installing kate                                            [----------------------------------------] 100%
Optional dependencies for kate
    clang: C and C++ LSP support [pending]
    git: git-blame plugin [pending]
    konsole: open a terminal in Kate [pending]
    python-lsp-server: Python LSP support
    qt6-declarative: RBQL plugin [installed]
    qtkeychain-qt6: SQL plugin [installed]
    rust: Rust LSP support [pending]
    texlab: LaTeX LSP support
( 951/1299) installing gst-plugin-qml6                                 [----------------------------------------] 100%
( 952/1299) installing chromaprint                                     [----------------------------------------] 100%
( 953/1299) installing faac                                            [----------------------------------------] 100%
( 954/1299) installing faad2                                           [----------------------------------------] 100%
( 955/1299) installing fluidsynth                                      [----------------------------------------] 100%
( 956/1299) installing libavtp                                         [----------------------------------------] 100%
( 957/1299) installing libdca                                          [----------------------------------------] 100%
( 958/1299) installing libde265                                        [----------------------------------------] 100%
Optional dependencies for libde265
    sdl2-compat: for the decoder tool [installed]
( 959/1299) installing libgme                                          [----------------------------------------] 100%
( 960/1299) installing raptor                                          [----------------------------------------] 100%
( 961/1299) installing liblrdf                                         [----------------------------------------] 100%
( 962/1299) installing libltc                                          [----------------------------------------] 100%
( 963/1299) installing libmicrodns                                     [----------------------------------------] 100%
( 964/1299) installing libmpcdec                                       [----------------------------------------] 100%
( 965/1299) installing libsrtp                                         [----------------------------------------] 100%
( 966/1299) installing libdv                                           [----------------------------------------] 100%
( 967/1299) installing mjpegtools                                      [----------------------------------------] 100%
( 968/1299) installing neon                                            [----------------------------------------] 100%
( 969/1299) installing openal                                          [----------------------------------------] 100%
Optional dependencies for openal
    qt6-base: alsoft-config GUI Configurator [installed]
    fluidsynth: MIDI rendering [installed]
    libmysofa: makemhr tool [installed]
( 970/1299) installing rtmpdump                                        [----------------------------------------] 100%
( 971/1299) installing soundtouch                                      [----------------------------------------] 100%
( 972/1299) installing svt-hevc                                        [----------------------------------------] 100%
( 973/1299) installing wildmidi                                        [----------------------------------------] 100%
( 974/1299) installing liblqr                                          [----------------------------------------] 100%
( 975/1299) installing libraqm                                         [----------------------------------------] 100%
( 976/1299) installing imagemagick                                     [----------------------------------------] 100%
Optional dependencies for imagemagick
    ghostscript: PS/PDF support [installed]
    jbigkit: JBIG support [installed]
    libheif: HEIF support [pending]
    libjpeg-turbo: JPEG support [installed]
    libjxl: JPEG XL support [installed]
    libraw: DNG support [installed]
    librsvg: SVG support [installed]
    libtiff: TIFF support [installed]
    libultrahdr: UHDR support
    libwebp: WEBP support [installed]
    libwmf: WMF support
    libzip: OpenRaster support [installed]
    ocl-icd: OpenCL support [installed]
    openexr: OpenEXR support [installed]
    openjpeg2: JPEG2000 support [installed]
    djvulibre: DJVU support [pending]
    pango: Text rendering [installed]
( 977/1299) installing zbar                                            [----------------------------------------] 100%
Optional dependencies for zbar
    gtk3: for zbar-gtk [installed]
    qt5-x11extras: for zbar-qt [pending]
    python: for zbar python bindings [installed]
( 978/1299) installing zvbi                                            [----------------------------------------] 100%
( 979/1299) installing gst-plugins-bad                                 [----------------------------------------] 100%
Optional dependencies for gst-plugins-bad
    gst-plugin-gtk: gtk plugin
    gst-plugin-hip: hip plugin and library
    gst-plugin-msdk: msdk plugin
    gst-plugin-onnx: onnx plugin
    gst-plugin-opencv: opencv plugin and library
    gst-plugin-qml6: qml6 plugin [installed]
    gst-plugin-qmlgl: qmlgl plugin
    gst-plugin-qsv: qsv plugin
    gst-plugin-va: va plugin [pending]
    gst-plugin-wpe: wpe plugin
( 980/1299) installing aalib                                           [----------------------------------------] 100%
Optional dependencies for aalib
    xorg-fonts-misc: x11 driver
    xorg-mkfontscale: x11 driver
( 981/1299) installing imlib2                                          [----------------------------------------] 100%
Optional dependencies for imlib2
    libheif: HEIF loader (for AVIF) [pending]
    libid3tag: ID3 loader
    libjxl: JXL loader [installed]
    librsvg: SVG loader [installed]
    libspectre: PS loader [pending]
    libwebp: WEBP loader [installed]
    openjpeg2: J2K loader [installed]
( 982/1299) installing libcaca                                         [----------------------------------------] 100%
Optional dependencies for libcaca
    python: Python bindings [installed]
( 983/1299) installing libshout                                        [----------------------------------------] 100%
( 984/1299) installing twolame                                         [----------------------------------------] 100%
( 985/1299) installing wavpack                                         [----------------------------------------] 100%
( 986/1299) installing gst-plugins-good                                [----------------------------------------] 100%
Optional dependencies for gst-plugins-good
    jack: JACK backend [installed]
( 987/1299) installing kamoso                                          [----------------------------------------] 100%
( 988/1299) installing partitionmanager                                [----------------------------------------] 100%
( 989/1299) installing plasma-x11-session                              [----------------------------------------] 100%
( 990/1299) installing djvulibre                                       [----------------------------------------] 100%
( 991/1299) installing libspectre                                      [----------------------------------------] 100%
( 992/1299) installing libvlc                                          [----------------------------------------] 100%
( 993/1299) installing vlc-plugin-alsa                                 [----------------------------------------] 100%
( 994/1299) installing a52dec                                          [----------------------------------------] 100%
( 995/1299) installing vlc-plugin-a52dec                               [----------------------------------------] 100%
( 996/1299) installing vlc-plugin-archive                              [----------------------------------------] 100%
( 997/1299) installing vlc-plugin-dav1d                                [----------------------------------------] 100%
( 998/1299) installing vlc-plugin-dbus                                 [----------------------------------------] 100%
( 999/1299) installing vlc-plugin-dbus-screensaver                     [----------------------------------------] 100%
(1000/1299) installing vlc-plugin-faad2                                [----------------------------------------] 100%
(1001/1299) installing vlc-plugin-flac                                 [----------------------------------------] 100%
(1002/1299) installing vlc-plugin-gnutls                               [----------------------------------------] 100%
(1003/1299) installing vlc-plugin-inflate                              [----------------------------------------] 100%
(1004/1299) installing vlc-plugin-jpeg                                 [----------------------------------------] 100%
(1005/1299) installing vlc-plugin-journal                              [----------------------------------------] 100%
(1006/1299) installing libebml                                         [----------------------------------------] 100%
(1007/1299) installing libmatroska                                     [----------------------------------------] 100%
(1008/1299) installing vlc-plugin-matroska                             [----------------------------------------] 100%
(1009/1299) installing vlc-plugin-mpg123                               [----------------------------------------] 100%
(1010/1299) installing vlc-plugin-ogg                                  [----------------------------------------] 100%
(1011/1299) installing vlc-plugin-opus                                 [----------------------------------------] 100%
(1012/1299) installing vlc-plugin-png                                  [----------------------------------------] 100%
(1013/1299) installing vlc-plugin-shout                                [----------------------------------------] 100%
(1014/1299) installing vlc-plugin-speex                                [----------------------------------------] 100%
(1015/1299) installing vlc-plugin-tag                                  [----------------------------------------] 100%
(1016/1299) installing vlc-plugin-theora                               [----------------------------------------] 100%
(1017/1299) installing vlc-plugin-twolame                              [----------------------------------------] 100%
(1018/1299) installing vlc-plugin-vorbis                               [----------------------------------------] 100%
(1019/1299) installing vlc-plugin-vpx                                  [----------------------------------------] 100%
(1020/1299) installing vlc-plugin-xml                                  [----------------------------------------] 100%
(1021/1299) installing vlc-plugins-base                                [----------------------------------------] 100%
(1022/1299) installing phonon-qt6-vlc                                  [----------------------------------------] 100%
(1023/1299) installing phonon-qt6                                      [----------------------------------------] 100%
Optional dependencies for phonon-qt6
    pulseaudio: PulseAudio support
    qt6-tools: Designer plugin [installed]
    qt6-tools: Designer plugin [installed]
(1024/1299) installing threadweaver                                    [----------------------------------------] 100%
(1025/1299) installing okular                                          [----------------------------------------] 100%
Optional dependencies for okular
    ebook-tools: mobi and epub support [installed]
    kdegraphics-mobipocket: mobi support [installed]
    unarchiver: Comic Book Archive support (alternative)
    unrar: Comic Book Archive support [pending]
(1026/1299) installing filelight                                       [----------------------------------------] 100%
(1027/1299) installing kwalletmanager                                  [----------------------------------------] 100%
(1028/1299) installing libdbusmenu-glib                                [----------------------------------------] 100%
(1029/1299) installing libdbusmenu-gtk3                                [----------------------------------------] 100%
(1030/1299) installing libappindicator                                 [----------------------------------------] 100%
(1031/1299) installing qt5-translations                                [----------------------------------------] 100%
(1032/1299) installing qt5-base                                        [----------------------------------------] 100%
Optional dependencies for qt5-base
    qt5-svg: to use SVG icon themes
    qt5-wayland: to run Qt applications in a Wayland session [pending]
    postgresql-libs: PostgreSQL driver
    mariadb-libs: MariaDB driver
    unixodbc: ODBC driver
    libfbclient: Firebird/iBase driver
    freetds: MS SQL driver
    gtk3: GTK platform plugin [installed]
    perl: for fixqt4headers and syncqt [installed]
(1033/1299) installing qt5-declarative                                 [----------------------------------------] 100%
(1034/1299) installing qt5-wayland                                     [----------------------------------------] 100%
(1035/1299) installing kwayland5                                       [----------------------------------------] 100%
(1036/1299) installing qt5-x11extras                                   [----------------------------------------] 100%
(1037/1299) installing kwindowsystem5                                  [----------------------------------------] 100%
(1038/1299) installing kwayland-integration                            [----------------------------------------] 100%
(1039/1299) installing konsole                                         [----------------------------------------] 100%
Optional dependencies for konsole
    keditbookmarks: to manage bookmarks
(1040/1299) installing alacritty                                       [----------------------------------------] 100%
Optional dependencies for alacritty
    ncurses: for alacritty terminfo database [installed]
(1041/1299) installing pipewire-alsa                                   [----------------------------------------] 100%
(1042/1299) installing gst-plugin-pipewire                             [----------------------------------------] 100%
(1043/1299) installing libsigc++-3.0                                   [----------------------------------------] 100%
(1044/1299) installing glibmm-2.68                                     [----------------------------------------] 100%
(1045/1299) installing cairomm-1.16                                    [----------------------------------------] 100%
(1046/1299) installing pangomm-2.48                                    [----------------------------------------] 100%
(1047/1299) installing gtkmm-4.0                                       [----------------------------------------] 100%
(1048/1299) installing pavucontrol                                     [----------------------------------------] 100%
(1049/1299) installing alsa-firmware                                   [----------------------------------------] 100%
(1050/1299) installing alsa-plugins                                    [----------------------------------------] 100%
Optional dependencies for alsa-plugins
    dbus: for maemo plugin [installed]
    ffmpeg: for pcm_a52 plugin [installed]
    jack: for pcm_jack plugin [installed]
    libavtp: for pcm_aaf plugin [installed]
    libsamplerate: for rate_samplerate plugin [installed]
    libpulse: for conf_pulse, ctl_pulse and pcm_pulse plugins [installed]
    speexdsp: for pcm_speex and rate_speexrate plugins [installed]
(1051/1299) installing alsa-utils                                      [----------------------------------------] 100%
(1052/1299) installing gst-libav                                       [----------------------------------------] 100%
(1053/1299) installing libcdio                                         [----------------------------------------] 100%
(1054/1299) installing libmpeg2                                        [----------------------------------------] 100%
(1055/1299) installing gst-plugins-ugly                                [----------------------------------------] 100%
(1056/1299) installing gst-plugin-va                                   [----------------------------------------] 100%
(1057/1299) installing libdvdcss                                       [----------------------------------------] 100%
(1058/1299) installing snapper                                         [----------------------------------------] 100%
Optional dependencies for snapper
    pam: pam_snapper [installed]
(1059/1299) installing snap-pac                                        [----------------------------------------] 100%
(1060/1299) installing grub-btrfs                                      [----------------------------------------] 100%
Optional dependencies for grub-btrfs
    snapper: For snapper support [installed]
    inotify-tools: For grub-btrfsd daemon
(1061/1299) installing snapper-support                                 [----------------------------------------] 100%
Using default grub snapshot submenu name
Enabling automatic rebuild of grub-btrfs when snapshots are taken
Running in chroot, ignoring command 'daemon-reload'
Created symlink '/etc/systemd/system/multi-user.target.wants/grub-btrfs-snapper.path' → '/usr/lib/systemd/system/grub-btrfs-snapper.path'.
Cannot start unit with --now when systemd is not running, ignoring.
Created symlink '/etc/systemd/system/timers.target.wants/snapper-cleanup.timer' → '/usr/lib/systemd/system/snapper-cleanup.timer'.
Cannot start unit with --now when systemd is not running, ignoring.
Creating snapper config for root
Detecting filesystem type failed.
(1062/1299) installing snapper-tools                                   [----------------------------------------] 100%
(1063/1299) installing btrfs-assistant                                 [----------------------------------------] 100%
Optional dependencies for btrfs-assistant
    snapper: Snapper support [installed]
    btrfsmaintenance: Btrfs maintenance support [pending]
(1064/1299) installing btrfsmaintenance                                [----------------------------------------] 100%
(1065/1299) installing perl-error                                      [----------------------------------------] 100%
(1066/1299) installing perl-timedate                                   [----------------------------------------] 100%
(1067/1299) installing perl-mailtools                                  [----------------------------------------] 100%
(1068/1299) installing zlib-ng                                         [----------------------------------------] 100%
(1069/1299) installing git                                             [----------------------------------------] 100%
Optional dependencies for git
    git-zsh-completion: upstream zsh completion
    tk: gitk and git gui
    openssh: ssh transport and crypto [installed]
    man: show help with `git command --help` [installed]
    perl-libwww: git svn
    perl-term-readkey: git svn and interactive.singlekey setting
    perl-io-socket-ssl: git send-email TLS support
    perl-authen-sasl: git send-email TLS support
    perl-cgi: gitweb (web interface) support
    python: git svn & git p4 [installed]
    subversion: git svn
    org.freedesktop.secrets: keyring credential helper [installed]
    libsecret: libsecret credential helper [installed]
    less: the default pager for git [installed]
(1070/1299) installing yay                                             [----------------------------------------] 100%
Optional dependencies for yay
    sudo: privilege elevation [installed]
    doas: privilege elevation
(1071/1299) installing libhandy                                        [----------------------------------------] 100%
(1072/1299) installing dbus-glib                                       [----------------------------------------] 100%
(1073/1299) installing vte-common                                      [----------------------------------------] 100%
(1074/1299) installing vte3                                            [----------------------------------------] 100%
(1075/1299) installing appstream-glib                                  [----------------------------------------] 100%
(1076/1299) installing libpamac-aur                                    [----------------------------------------] 100%
error: Can't load uri https://flathub.org/repo/flathub.flatpakrepo: While fetching https://flathub.org/repo/flathub.flatpakrepo: [77] Problem with the SSL CA cert (path? access rights?)

==> An authentication agent is required
    Cinnamon, Deepin, GNOME, GNOME Flashback, KDE, LXDE, LXQt, MATE and Xfce
    have an authentication agent already.
    See https://wiki.archlinux.org/index.php/Polkit#Authentication_agents
    for other desktop environments.
(1077/1299) installing pamac-aur                                       [----------------------------------------] 100%
==> Enable Pamac Updates Indicator via
    Extensions
Optional dependencies for pamac-aur
    polkit-gnome: needed for authentification in Cinnamon, Gnome
    lxsession: needed for authentification in Xfce, LXDE etc.
(1078/1299) installing bluez-utils                                     [----------------------------------------] 100%
Optional dependencies for bluez-utils
    ell: for btpclient [pending]
    perl: for parse_companies.pl [installed]
(1079/1299) installing brave-origin-bin                                [----------------------------------------] 100%
Optional dependencies for brave-origin-bin
    cups: Printer support [pending]
    libgnome-keyring: Enable GNOME keyring support
    libnotify: Native notification support [installed]
(1080/1299) installing git-lfs                                         [----------------------------------------] 100%
(1081/1299) installing m4                                              [----------------------------------------] 100%
(1082/1299) installing autoconf                                        [----------------------------------------] 100%
(1083/1299) installing automake                                        [----------------------------------------] 100%
(1084/1299) installing bison                                           [----------------------------------------] 100%
(1085/1299) installing cpio                                            [----------------------------------------] 100%
(1086/1299) installing debugedit                                       [----------------------------------------] 100%
(1087/1299) installing fakeroot                                        [----------------------------------------] 100%
(1088/1299) installing flex                                            [----------------------------------------] 100%
(1089/1299) installing libisl                                          [----------------------------------------] 100%
(1090/1299) installing gcc                                             [----------------------------------------] 100%
Optional dependencies for gcc
    lib32-gcc-libs: for generating code for 32-bit ABI
(1091/1299) installing patch                                           [----------------------------------------] 100%
Optional dependencies for patch
    ed: for patch -e functionality
(1092/1299) installing pkgconf                                         [----------------------------------------] 100%
(1093/1299) installing texinfo                                         [----------------------------------------] 100%
Optional dependencies for texinfo
    perl-archive-zip: EPUB file output via texi2any
(1094/1299) installing base-devel                                      [----------------------------------------] 100%
(1095/1299) installing gtksourceview4                                  [----------------------------------------] 100%
(1096/1299) installing python-cairo                                    [----------------------------------------] 100%
(1097/1299) installing meld                                            [----------------------------------------] 100%
(1098/1299) installing cppdap                                          [----------------------------------------] 100%
(1099/1299) installing libuv                                           [----------------------------------------] 100%
(1100/1299) installing rhash                                           [----------------------------------------] 100%
(1101/1299) installing cmake                                           [----------------------------------------] 100%
Optional dependencies for cmake
    make: for unix Makefile generator [installed]
    ninja: for ninja generator
    qt6-base: cmake-gui [installed]
(1102/1299) installing rustup                                          [----------------------------------------] 100%
You may need to run rustup update stable
and possibly also rustup self upgrade-data
Optional dependencies for rustup
    lldb: rust-lldb script
    gdb: rust-gdb script [installed]
    gcc: build executables for most targets [installed]
    mingw-w64-gcc: {i686,x86_64}-pc-windows-gnu targets
    aarch64-linux-gnu-gcc: aarch64-unknown-linux-* targets
(1103/1299) installing wget                                            [----------------------------------------] 100%
Optional dependencies for wget
    ca-certificates: HTTPS downloads [installed]
(1104/1299) installing enchant                                         [----------------------------------------] 100%
Optional dependencies for enchant
    aspell: for aspell based spell checking support
    hspell: for hspell based spell checking support
    hunspell: for hunspell based spell checking support [installed]
    libvoikko: for libvoikko based spell checking support
    nuspell: for nuspell based spell checking support
(1105/1299) installing harfbuzz-icu                                    [----------------------------------------] 100%
(1106/1299) installing hyphen                                          [----------------------------------------] 100%
(1107/1299) installing libyuv                                          [----------------------------------------] 100%
(1108/1299) installing libavif                                         [----------------------------------------] 100%
(1109/1299) installing libmanette                                      [----------------------------------------] 100%
(1110/1299) installing woff2                                           [----------------------------------------] 100%
(1111/1299) installing webkit2gtk-4.1                                  [----------------------------------------] 100%
Optional dependencies for webkit2gtk-4.1
    geoclue: Geolocation support
    gst-libav: nonfree media decoding [installed]
    gst-plugins-bad: media decoding [installed]
    gst-plugins-good: media decoding [installed]
(1112/1299) installing gtksourceview3                                  [----------------------------------------] 100%
(1113/1299) installing gspell                                          [----------------------------------------] 100%
(1114/1299) installing yad                                             [----------------------------------------] 100%
(1115/1299) installing sublime-text-4                                  [----------------------------------------] 100%
(1116/1299) installing arch-rebuild-order                              [----------------------------------------] 100%
(1117/1299) installing arch-repro-status                               [----------------------------------------] 100%
(1118/1299) installing pyalpm                                          [----------------------------------------] 100%
(1119/1299) installing python-click                                    [----------------------------------------] 100%
(1120/1299) installing python-six                                      [----------------------------------------] 100%
(1121/1299) installing python-dateutil                                 [----------------------------------------] 100%
(1122/1299) installing arch-signoff                                    [----------------------------------------] 100%
(1123/1299) installing pacquery                                        [----------------------------------------] 100%
(1124/1299) installing pahole                                          [----------------------------------------] 100%
Optional dependencies for pahole
    ostra-cg: Generate call graphs from encoded traces
(1125/1299) installing linux-vita-headers                              [----------------------------------------] 100%
(1126/1299) installing fish                                            [----------------------------------------] 100%
Optional dependencies for fish
    python: man page completion parser / web config tool [installed]
    pkgfile: command-not-found hook
    groff: --help for built-in commmands [installed]
    mandoc: --help for built-in commmands (alternative)
    xsel: X11 clipboard integration
    xclip: X11 clipboard integration (alternative)
    wl-clipboard: Wayland clipboard integration
(1127/1299) installing oh-my-posh-bin                                  [----------------------------------------] 100%
(1128/1299) installing yyjson                                          [----------------------------------------] 100%
(1129/1299) installing vitafetch                                       [----------------------------------------] 100%
Optional dependencies for vitafetch
    chafa: Image output as ascii art
    dbus: Bluetooth, Player & Media detection [installed]
    dconf: Needed for values that are only stored in DConf + Fallback for GSettings [installed]
    ddcutil: Brightness detection of external displays [installed]
    glib2: Output for values that are only stored in GSettings [installed]
    hwdata: GPU output [installed]
    imagemagick: Image output using sixel or kitty graphics protocol [installed]
    libdrm: Displays detection [installed]
    libelf: st term font detection and fast path of systemd version detection [installed]
    libglvnd: OpenGL module [installed]
    libpulse: Sound detection [installed]
    libva: Primary backend of hardware-accelerated video codec detection [installed]
    libvdpau: Fallback backend of hardware-accelerated video codec detection [installed]
    libxrandr: Multi monitor support [installed]
    lua: Lua scripting in format section of JSON config [installed]
    ocl-icd: OpenCL module [installed]
    quickjs-ng: JavaScript scripting in format section of JSON config
    python: Needed for zsh and fish completions [installed]
    sqlite: Needed for Sqlite integration and Soar packages count [installed]
    vulkan-icd-loader: Vulkan module & fallback for GPU output [installed]
    zlib: Faster image output when using kitty graphics protocol [installed]
(1130/1299) installing bash-completion                                 [----------------------------------------] 100%
(1131/1299) installing zsh-completions                                 [----------------------------------------] 100%
(1132/1299) installing zsh-autosuggestions                             [----------------------------------------] 100%
(1133/1299) installing zsh-syntax-highlighting                         [----------------------------------------] 100%
To activate zsh-syntax-highlighting, add the following line at the end of ~/.zshrc:
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
(1134/1299) installing vita-hack-fonts                                 [----------------------------------------] 100%
(1135/1299) installing ttf-meslo-nerd                                  [----------------------------------------] 100%
(1136/1299) installing ttf-firacode-nerd                               [----------------------------------------] 100%
(1137/1299) installing ttf-fira-code                                   [----------------------------------------] 100%
(1138/1299) installing ttf-meslo-nerd-font-powerlevel10k               [----------------------------------------] 100%
(1139/1299) installing adobe-source-han-sans-jp-fonts                  [----------------------------------------] 100%
(1140/1299) installing adobe-source-han-sans-kr-fonts                  [----------------------------------------] 100%
(1141/1299) installing adobe-source-han-sans-cn-fonts                  [----------------------------------------] 100%
(1142/1299) installing adobe-source-sans-fonts                         [----------------------------------------] 100%
(1143/1299) installing awesome-terminal-fonts                          [----------------------------------------] 100%
(1144/1299) installing ttf-roboto-mono                                 [----------------------------------------] 100%
(1145/1299) installing ttf-ubuntu-font-family                          [----------------------------------------] 100%
(1146/1299) installing python-dbus                                     [----------------------------------------] 100%
Optional dependencies for python-dbus
    python-gobject: D-Bus services via PyGI [installed]
(1147/1299) installing python-firewall                                 [----------------------------------------] 100%
(1148/1299) installing python-capng                                    [----------------------------------------] 100%
(1149/1299) installing firewalld                                       [----------------------------------------] 100%

:: The firewallD components & utilities have now been split into different packages:

   - firewalld: Firewall daemon with D-Bus interface 
   - python-firewall: Python bindings for firewallD
   - firewall-config: Graphical user interface for firewallD
   - firewall-applet: Systray applet for firewallD
   - firewalld-test: FirewallD test suite

   Make sure to install the ones you may want / need.

Optional dependencies for firewalld
    bash-completion: bash completion [installed]
    networkmanager: NetworkManager support [installed]
    polkit: privileged actions [installed]
    firewall-config: Graphical user interface for firewallD configuration [pending]
    firewall-applet: Systray applet for firewallD [pending]
    firewalld-test: firewallD test suite
(1150/1299) installing firewall-config                                 [----------------------------------------] 100%
(1151/1299) installing python-pyqt6-sip                                [----------------------------------------] 100%
(1152/1299) installing python-pyqt6                                    [----------------------------------------] 100%
Optional dependencies for python-pyqt6
    qt6-tools: QtHelp, QtDesigner bindings [installed]
    qt6-svg: QtSvg bindings [installed]
    qt6-declarative: QtQml bindings, qmlplugin [installed]
    qt6-quick3d: QtQuick3D bindings [installed]
    qt6-connectivity: QtBluetooth, QtNfc bindings [installed]
    qt6-multimedia: QtMultimedia, QtSpatialAudio bindings [installed]
    qt6-positioning: QtPositioning bindings [installed]
    qt6-remoteobjects: QtRemoteObjects bindings
    qt6-scxml: QtStateMachine bindings
    qt6-sensors: QtSensors bindings [installed]
    qt6-serialport: QtSerialPort bindings
    qt6-speech: QtTextToSpeech bindings [installed]
    qt6-webchannel: QtWebChannel bindings [installed]
    qt6-webengine: QtPdf bindings [installed]
    qt6-websockets: QtWebSockets bindings [installed]
    dbus-python: for python-dbus mainloop support [installed]
(1153/1299) installing firewall-applet                                 [----------------------------------------] 100%
(1154/1299) installing libmaxminddb                                    [----------------------------------------] 100%
Optional dependencies for libmaxminddb
    geoip2-database: IP geolocation databases
(1155/1299) installing jemalloc                                        [----------------------------------------] 100%
Optional dependencies for jemalloc
    perl: for jeprof [installed]
(1156/1299) installing bind                                            [----------------------------------------] 100%
(1157/1299) installing dnsmasq                                         [----------------------------------------] 100%
(1158/1299) installing ethtool                                         [----------------------------------------] 100%
(1159/1299) installing ell                                             [----------------------------------------] 100%
(1160/1299) installing iwd                                             [----------------------------------------] 100%
Optional dependencies for iwd
    qrencode: for displaying QR code after DPP is started [installed]
(1161/1299) installing netctl                                          [----------------------------------------] 100%
Optional dependencies for netctl
    dialog: for the menu based wifi assistant
    dhclient: for DHCP support (or dhcpcd)
    dhcpcd: for DHCP support (or dhclient) [installed]
    wpa_supplicant: for wireless networking support [installed]
    ifplugd: for automatic wired connections through netctl-ifplugd
    ppp: for PPP connections [installed]
    openvswitch: for Open vSwitch connections
    wireguard-tools: for WireGuard connections
(1162/1299) installing gcr-4                                           [----------------------------------------] 100%
Optional dependencies for gcr-4
    gtk4: gcr-viewer-gtk4 [installed]
(1163/1299) installing libnma-common                                   [----------------------------------------] 100%
(1164/1299) installing libnma                                          [----------------------------------------] 100%
(1165/1299) installing nm-connection-editor                            [----------------------------------------] 100%
(1166/1299) installing network-manager-applet                          [----------------------------------------] 100%
(1167/1299) installing gcr                                             [----------------------------------------] 100%
(1168/1299) installing vpnc                                            [----------------------------------------] 100%
Optional dependencies for vpnc
    openresolv: Let vpnc manage resolv.conf [installed]
(1169/1299) installing stoken                                          [----------------------------------------] 100%
Optional dependencies for stoken
    gtk3: required for stoken-gui [installed]
(1170/1299) installing oath-toolkit                                    [----------------------------------------] 100%
(1171/1299) installing openconnect                                     [----------------------------------------] 100%
Optional dependencies for openconnect
    python: tncc-wrapper [installed]
(1172/1299) installing networkmanager-vpn-plugin-openconnect           [----------------------------------------] 100%
(1173/1299) installing networkmanager-openconnect                      [----------------------------------------] 100%
Optional dependencies for networkmanager-openconnect
    libnma-gtk4: GUI support (GTK 4) [pending]
(1174/1299) installing libnma-gtk4                                     [----------------------------------------] 100%
(1175/1299) installing pkcs11-helper                                   [----------------------------------------] 100%
(1176/1299) installing openvpn                                         [----------------------------------------] 100%
Optional dependencies for openvpn
    easy-rsa: easy CA and certificate handling
    pam: authenticate via PAM [installed]
(1177/1299) installing networkmanager-vpn-plugin-openvpn               [----------------------------------------] 100%
(1178/1299) installing networkmanager-openvpn                          [----------------------------------------] 100%
Optional dependencies for networkmanager-openvpn
    libnma: GUI support (GTK 3) [installed]
(1179/1299) installing nss-mdns                                        [----------------------------------------] 100%
(1180/1299) installing whois                                           [----------------------------------------] 100%
(1181/1299) installing wireless-regdb                                  [----------------------------------------] 100%
(1182/1299) installing xl2tpd                                          [----------------------------------------] 100%
(1183/1299) installing vita-gpu-scripts                                [----------------------------------------] 100%
(1184/1299) installing xorg-xmodmap                                    [----------------------------------------] 100%
(1185/1299) installing xorg-xinit                                      [----------------------------------------] 100%
Optional dependencies for xorg-xinit
    xorg-twm
    xterm
(1186/1299) installing xorg-xkill                                      [----------------------------------------] 100%
(1187/1299) installing xorg-xrandr                                     [----------------------------------------] 100%
(1188/1299) installing xf86-input-elographics                          [----------------------------------------] 100%
(1189/1299) installing xf86-input-evdev                                [----------------------------------------] 100%
(1190/1299) installing xf86-input-vmmouse                              [----------------------------------------] 100%
(1191/1299) installing xf86-video-amdgpu                               [----------------------------------------] 100%
(1192/1299) installing xf86-video-fbdev                                [----------------------------------------] 100%
(1193/1299) installing qt6-wayland                                     [----------------------------------------] 100%
(1194/1299) installing libexif                                         [----------------------------------------] 100%
(1195/1299) installing qpdf                                            [----------------------------------------] 100%
(1196/1299) installing libcupsfilters                                  [----------------------------------------] 100%
(1197/1299) installing libppd                                          [----------------------------------------] 100%
(1198/1299) installing cups-filters                                    [----------------------------------------] 100%
Optional dependencies for cups-filters
    ghostscript: for non-PDF printers (preferred) [installed]
    poppler: for non-PDF printers [installed]
    mupdf-tools: for non-PDF printers
(1199/1299) installing cups                                            [----------------------------------------] 100%
>> If you use an HTTPS connection to CUPS, the first time you access
>> the interface it may take a very long time before the site comes up.
>> This is because the first request triggers the generation of the CUPS
>> SSL certificates which can be a very time-consuming job.
Optional dependencies for cups
    cups-browsed: to browse the network for remote CUPS queues and IPP network printers
    libusb: for usb printer backend [installed]
    ipp-usb: allows to send HTTP requests via a USB connection on devices without Ethernet or WiFi connections
    xdg-utils: xdg .desktop file support [installed]
    colord: for ICC color profile support [pending]
    logrotate: for logfile rotation support
(1200/1299) installing cups-pdf                                        [----------------------------------------] 100%
-------------------------------------------------
To use cups-pdf, restart cups and visit the cups
web interface at http://localhost:631/

You can now add a "Virtual Printer (PDF Printer)"
and use the Postscript/Generic postscript color
printer driver.

Note that cups-pdf has a configuration
file in /etc/cups. The default location for
pdf output is /var/spool/cups-pdf/$username.
-------------------------------------------------
(1201/1299) installing gsfonts                                         [----------------------------------------] 100%
(1202/1299) installing python-pycups                                   [----------------------------------------] 100%
(1203/1299) installing system-config-printer                           [----------------------------------------] 100%
Optional dependencies for system-config-printer
    libsecret: password management [installed]
    python-pysmbc: SMB browser support
    cups-pk-helper: PolicyKit helper to configure cups with fine-grained privileges
(1204/1299) installing libxfce4util                                    [----------------------------------------] 100%
(1205/1299) installing tumbler                                         [----------------------------------------] 100%
Optional dependencies for tumbler
    ffmpegthumbnailer: video thumbnails [pending]
    poppler-glib: PDF thumbnails [pending]
    libgsf: ODF thumbnails [pending]
    libgepub: EPUB thumbnails
    libopenraw: RAW thumbnails [pending]
    freetype2: font thumbnails [installed]
(1206/1299) installing ffmpegthumbnailer                               [----------------------------------------] 100%
Optional dependencies for ffmpegthumbnailer
    gvfs: support for gio uris
(1207/1299) installing libgsf                                          [----------------------------------------] 100%
(1208/1299) installing libopenraw                                      [----------------------------------------] 100%
(1209/1299) installing poppler-glib                                    [----------------------------------------] 100%
(1210/1299) installing poppler-qt5                                     [----------------------------------------] 100%
(1211/1299) installing mkinitcpio-openswap                             [----------------------------------------] 100%

Alter /etc/openswap.conf file for your swap device name, keyfiles, etc...

For more information see: https://wiki.archlinux.org/index.php/Dm-crypt/Swap_encryption#mkinitcpio_hook

Don't forget to add the openswap hook after encrypt and before resume in your /etc/mkinitcpio.conf and run mkinitcpio -p linux...

(1212/1299) installing kdsingleapplication                             [----------------------------------------] 100%
(1213/1299) installing libcdio-paranoia                                [----------------------------------------] 100%
(1214/1299) installing libsixel                                        [----------------------------------------] 100%
(1215/1299) installing libxpresent                                     [----------------------------------------] 100%
(1216/1299) installing luajit                                          [----------------------------------------] 100%
(1217/1299) installing mujs                                            [----------------------------------------] 100%
(1218/1299) installing uchardet                                        [----------------------------------------] 100%
(1219/1299) installing mpv                                             [----------------------------------------] 100%
Optional dependencies for mpv
    yt-dlp: for video-sharing websites playback
(1220/1299) installing mpvqt                                           [----------------------------------------] 100%
(1221/1299) installing haruna                                          [----------------------------------------] 100%
Optional dependencies for haruna
    yt-dlp: YouTube support
(1222/1299) installing libcue                                          [----------------------------------------] 100%
(1223/1299) installing libmms                                          [----------------------------------------] 100%
(1224/1299) installing libresidfp                                      [----------------------------------------] 100%
(1225/1299) installing libexsid                                        [----------------------------------------] 100%
(1226/1299) installing libsidplayfp                                    [----------------------------------------] 100%
Optional dependencies for libsidplayfp
    vice: better SID support
    libusb: USBSID support [installed]
(1227/1299) installing confuse                                         [----------------------------------------] 100%
(1228/1299) installing libftdi                                         [----------------------------------------] 100%
Optional dependencies for libftdi
    python: library bindings [installed]
(1229/1299) installing lirc                                            [----------------------------------------] 100%
Optional dependencies for lirc
    python: for lirc-setup, irdb-get and pronto2lirc [installed]
    python-gobject: for lirc-setup and irdb-get [installed]
    python-yaml: for lirc-setup and irdb-get [installed]
(1230/1299) installing libcddb                                         [----------------------------------------] 100%
(1231/1299) installing opusfile                                        [----------------------------------------] 100%
(1232/1299) installing audacious-plugins                               [----------------------------------------] 100%
(1233/1299) installing audacious                                       [----------------------------------------] 100%
Optional dependencies for audacious
    unzip: zipped skins support [pending]
(1234/1299) installing dotnet-host                                     [----------------------------------------] 100%
Optional dependencies for dotnet-host
    bash-completion: Bash completion support [installed]
(1235/1299) installing dotnet-runtime                                  [----------------------------------------] 100%
Optional dependencies for dotnet-runtime
    lttng-ust2.12: CoreCLR tracing
(1236/1299) installing dotnet-targeting-pack                           [----------------------------------------] 100%
Optional dependencies for dotnet-targeting-pack
    bash-completion: Bash completion support [installed]
(1237/1299) installing dotnet-sdk                                      [----------------------------------------] 100%
Optional dependencies for dotnet-sdk
    aspnet-targeting-pack: Build ASP.NET Core applications
(1238/1299) installing compiler-rt                                     [----------------------------------------] 100%
(1239/1299) installing clang                                           [----------------------------------------] 100%
Optional dependencies for clang
    openmp: OpenMP support in clang with -fopenmp
    python: for scan-view and git-clang-format [installed]
    llvm: referenced by some clang headers
(1240/1299) installing chaotic-mirrorlist                              [----------------------------------------] 100%
(1241/1299) installing chaotic-keyring                                 [----------------------------------------] 100%
Optional dependencies for chaotic-keyring
    pkgstats: install to submit package usage statistics
(1242/1299) installing vita-keyring                                    [----------------------------------------] 100%
 >>> Run `pacman-key --init` to set up your pacman keyring.
 >>> Then run `pacman-key --populate vita` to install the Vita-OS keyring.
(1243/1299) installing unace                                           [----------------------------------------] 100%

==> unace post-install message:
==> to use this software, you have to accept the Public UnAce Licence,
==> ( it's in /usr/share/licenses/unace/license )
==> otherwise, remove this package!

(1244/1299) installing unrar                                           [----------------------------------------] 100%
(1245/1299) installing unzip                                           [----------------------------------------] 100%
(1246/1299) installing python-pyparted                                 [----------------------------------------] 100%
(1247/1299) installing libxklavier                                     [----------------------------------------] 100%
(1248/1299) installing libgnomekbd                                     [----------------------------------------] 100%
(1249/1299) installing python-setproctitle                             [----------------------------------------] 100%
(1250/1299) installing xapp-symbolic-icons                             [----------------------------------------] 100%
Optional dependencies for xapp-symbolic-icons
    python: for xsi-replace-adwaita-symbolic command [installed]
(1251/1299) installing xapp                                            [----------------------------------------] 100%
(1252/1299) installing python-xapp                                     [----------------------------------------] 100%
(1253/1299) installing python-unidecode                                [----------------------------------------] 100%
(1254/1299) installing mintstick                                       [----------------------------------------] 100%
(1255/1299) installing webkitgtk-6.0                                   [----------------------------------------] 100%
Optional dependencies for webkitgtk-6.0
    geoclue: Geolocation support
    gst-libav: nonfree media decoding [installed]
    gst-plugins-bad: media decoding [installed]
    gst-plugins-good: media decoding [installed]
(1256/1299) installing font-manager                                    [----------------------------------------] 100%
Optional dependencies for font-manager
    file-roller
    libnautilus-extension
(1257/1299) installing libgusb                                         [----------------------------------------] 100%
(1258/1299) installing colord                                          [----------------------------------------] 100%
Optional dependencies for colord
    argyllcms: color profiling
    colord-sane: SANE support [pending]
(1259/1299) installing libieee1284                                     [----------------------------------------] 100%
Optional dependencies for libieee1284
    python: for python module [installed]
(1260/1299) installing net-snmp                                        [----------------------------------------] 100%
Optional dependencies for net-snmp
    perl-term-readkey: for snmpcheck application
    perl-tk: for snmpcheck and tkmib applications
    python: for the python modules [installed]
(1261/1299) installing libheif                                         [----------------------------------------] 100%
Optional dependencies for libheif
    libjpeg-turbo: for heif-dec and heif-enc [installed]
    libpng: for heif-dec and heif-enc [installed]
    libtiff: for heif-dec and heif-enc [installed]
    dav1d: dav1d encoder [installed]
    ffmpeg: hardware decode [installed]
    openjpeg2: JPEG2000 decoder [installed]
    rav1e: rav1e encoder [installed]
    svt-av1: svt-av1 encoder [installed]
(1262/1299) installing gd                                              [----------------------------------------] 100%
Optional dependencies for gd
    perl: bdftogd script [installed]
(1263/1299) installing libgphoto2                                      [----------------------------------------] 100%
(1264/1299) installing sane                                            [----------------------------------------] 100%
Optional dependencies for sane
    sane-airscan: for scanners working in driverless mode
(1265/1299) installing colord-sane                                     [----------------------------------------] 100%
(1266/1299) installing simple-scan                                     [----------------------------------------] 100%
(1267/1299) installing libgexiv2                                       [----------------------------------------] 100%
(1268/1299) installing python-soupsieve                                [----------------------------------------] 100%
(1269/1299) installing python-beautifulsoup4                           [----------------------------------------] 100%
Optional dependencies for python-beautifulsoup4
    python-cchardet: alternative to autodetect character encodings
    python-chardet: to autodetect character encodings
    python-lxml: alternative HTML parser [pending]
    python-html5lib: alternative HTML parser
(1270/1299) installing python-pyparsing                                [----------------------------------------] 100%
Optional dependencies for python-pyparsing
    python-railroad-diagrams: for generating Railroad Diagrams
    python-jinja: for generating Railroad Diagrams [installed]
(1271/1299) installing python-httplib2                                 [----------------------------------------] 100%
Optional dependencies for python-httplib2
    python-pysocks: SOCKS proxy client support
(1272/1299) installing python-packaging                                [----------------------------------------] 100%
(1273/1299) installing libimagequant                                   [----------------------------------------] 100%
(1274/1299) installing python-pillow                                   [----------------------------------------] 100%
Optional dependencies for python-pillow
    libwebp: for webp images [installed]
    tk: for the ImageTK module
    python-olefile: OLE2 file support
    python-pyqt6: for the ImageQt module [installed]
    python-defusedxml: for reading XMP tags
(1275/1299) installing python-lxml                                     [----------------------------------------] 100%
Optional dependencies for python-lxml
    python-beautifulsoup4: support for beautifulsoup parser to parse not well formed HTML [installed]
    python-cssselect: support for cssselect
    python-html5lib: support for html5lib parser
    python-lxml-docs: offline docs
    python-lxml-html-clean: enable htmlclean feature
(1276/1299) installing python-pycurl                                   [----------------------------------------] 100%
(1277/1299) installing variety                                         [----------------------------------------] 100%
Optional dependencies for variety
    xdg-user-dirs: set wallpaper for KDE Plasma [installed]
    qt5-tools: set wallpaper for KDE Plasma
(1278/1299) installing pacman-contrib                                  [----------------------------------------] 100%
Optional dependencies for pacman-contrib
    diffutils: for pacdiff [installed]
    fakeroot: for checkupdates [installed]
    findutils: for pacdiff --find [installed]
    mlocate: for pacdiff --locate
    plocate: faster mlocate alternative
    perl: for pacsearch [installed]
    sudo: privilege elevation for several scripts [installed]
    vim: default diff program for pacdiff [installed]
    neovim: default diff program for pacdiff if EDITOR=nvim
(1279/1299) installing fzf                                             [----------------------------------------] 100%
Optional dependencies for fzf
    fish: fish keybindings [installed]
    tmux: fzf-tmux script for launching fzf in a tmux pane [installed]
    vim: plugin [installed]
    zsh: zsh keybindings [installed]
(1280/1299) installing downgrade                                       [----------------------------------------] 100%
Optional dependencies for downgrade
    sudo: for installation via sudo [installed]
(1281/1299) installing libpackagekit-glib                              [----------------------------------------] 100%
(1282/1299) installing packagekit                                      [----------------------------------------] 100%
Optional dependencies for packagekit
    bash-completion: command completion in bash [installed]
(1283/1299) installing packagekit-qt6                                  [----------------------------------------] 100%
(1284/1299) installing xfsprogs                                        [----------------------------------------] 100%
Optional dependencies for xfsprogs
    icu: for xfs_scrub [installed]
    python-dbus: for xfs_scrub_all script [installed]
    smtp-forwarder: for xfs_scrub_fail script
(1285/1299) installing xdg-user-dirs-gtk                               [----------------------------------------] 100%
(1286/1299) installing nohang                                          [----------------------------------------] 100%
Optional dependencies for nohang
    libnotify: notification server [installed]
    logrotate: logrotate support
    sudo: if nohang started with UID=0 [installed]
(1287/1299) installing fmt                                             [----------------------------------------] 100%
(1288/1299) installing spdlog                                          [----------------------------------------] 100%
(1289/1299) installing ananicy-cpp                                     [----------------------------------------] 100%
(1290/1299) installing vita-os-ananicy-rules                           [----------------------------------------] 100%
(1291/1299) installing vita-kde-dark                                   [----------------------------------------] 100%
(1292/1299) installing vita7z-kde-theme                                [----------------------------------------] 100%
(1293/1299) installing vita-liquid-boot-animation                      [----------------------------------------] 100%
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'archiso'
==> Using configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -c /etc/mkinitcpio.conf -g /boot/initramfs-linux.img
==> ERROR: Invalid option -k -- '/boot/vmlinuz-linux' must be readable
error: command failed to execute correctly
(1294/1299) installing dracula-icons-git                               [----------------------------------------] 100%
(1295/1299) installing bibata-cursor-theme                             [----------------------------------------] 100%
(1296/1299) installing capitaine-cursors                               [----------------------------------------] 100%
(1297/1299) installing vimix-cursors                                   [----------------------------------------] 100%
(1298/1299) installing apple_cursor                                    [----------------------------------------] 100%
(1299/1299) installing vita-ui-elements                                [----------------------------------------] 100%
:: Running post-transaction hooks...
( 1/31) Creating system user accounts...
Creating group 'brlapi' with GID 970.
Creating group 'i2c' with GID 969.
Creating group 'ntp' with GID 87.
Creating group 'polkitd' with GID 102.
Creating group 'vboxsf' with GID 109.
Creating group 'alpm' with GID 968.
Creating user 'alpm' (Arch Linux Package Management) with UID 968 and GID 968.
Creating group 'avahi' with GID 965.
Creating user 'avahi' (Avahi mDNS/DNS-SD daemon) with UID 965 and GID 965.
Creating group 'named' with GID 40.
Creating user 'named' (BIND DNS Server) with UID 40 and GID 40.
Creating group 'brltty' with GID 964.
Creating user 'brltty' (Braille Device Daemon) with UID 964 and GID 964.
Creating group 'colord' with GID 963.
Creating user 'colord' (colord colour management daemon) with UID 963 and GID 963.
Creating group 'cups' with GID 209.
Creating user 'cups' (cups helper user) with UID 209 and GID 209.
Creating group 'dhcpcd' with GID 962.
Creating user 'dhcpcd' (dhcpcd privilege separation) with UID 962 and GID 962.
Creating group 'dnsmasq' with GID 961.
Creating user 'dnsmasq' (dnsmasq daemon) with UID 961 and GID 961.
Creating group 'flatpak' with GID 960.
Creating user 'flatpak' (Flatpak system helper) with UID 960 and GID 960.
Creating group 'git' with GID 959.
Creating user 'git' (git daemon user) with UID 959 and GID 959.
Creating group 'nbd' with GID 958.
Creating user 'nbd' (Network Block Device) with UID 958 and GID 958.
Creating group 'nm-openconnect' with GID 957.
Creating user 'nm-openconnect' (NetworkManager OpenConnect) with UID 957 and GID 957.
Creating group 'nm-openvpn' with GID 956.
Creating user 'nm-openvpn' (NetworkManager OpenVPN) with UID 956 and GID 956.
Creating user 'ntp' (Network Time Protocol) with UID 87 and GID 87.
Creating group 'openvpn' with GID 955.
Creating user 'openvpn' (OpenVPN) with UID 955 and GID 955.
Creating group 'partimag' with GID 110.
Creating user 'partimag' (Partimage user) with UID 110 and GID 110.
Creating group 'pcscd' with GID 954.
Creating user 'pcscd' (PC/SC Smart Card Daemon) with UID 954 and GID 954.
Creating group 'plasmalogin' with GID 953.
Creating user 'plasmalogin' (PLASMALOGIN Greeter Account) with UID 953 and GID 953.
Creating user 'polkitd' (User for polkitd) with UID 102 and GID 102.
Creating group 'rpc' with GID 32.
Creating user 'rpc' (Rpcbind Daemon) with UID 32 and GID 32.
Creating group 'rpcuser' with GID 34.
Creating user 'rpcuser' (RPC Service User) with UID 34 and GID 34.
Creating group 'saned' with GID 952.
Creating user 'saned' (SANE daemon user) with UID 952 and GID 952.
Creating group 'sddm' with GID 951.
Creating user 'sddm' (SDDM Greeter Account) with UID 951 and GID 951.
Creating group 'usbmux' with GID 140.
Creating user 'usbmux' (usbmux user) with UID 140 and GID 140.
( 2/31) Updating journal message catalog...
( 3/31) Reloading system manager configuration...
  Skipped: Running in chroot.
( 4/31) Reloading user manager configuration...
  Skipped: Running in chroot.
( 5/31) Updating udev hardware database...
( 6/31) Applying kernel sysctl settings...
  Skipped: Running in chroot.
( 7/31) Creating temporary files...
( 8/31) Reloading device manager configuration...
  Skipped: Running in chroot.
( 9/31) Arming ConditionNeedsUpdate...
(10/31) Updating the MIME type database...
(11/31) Updating fontconfig configuration...
(12/31) Rebuilding certificate stores...
(13/31) Updating module dependencies...
(14/31) Updating linux initcpios...
==> Building image from preset: /etc/mkinitcpio.d/linux-vita.preset: 'default'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux-vita -g /boot/initramfs-linux-vita.img
==> Starting build: '7.1.1-1-vita'
  -> Running build hook: [base]
  -> Running build hook: [udev]
  -> Running build hook: [microcode]
  -> Running build hook: [modconf]
  -> Running build hook: [kms]
==> WARNING: Possibly missing firmware for module: 'ast'
  -> Running build hook: [memdisk]
  -> Running build hook: [archiso]
  -> Running build hook: [archiso_loop_mnt]
  -> Running build hook: [archiso_pxe_common]
==> WARNING: Possibly missing firmware for module: 'softing_cs'
==> WARNING: Possibly missing firmware for module: 'bna'
==> WARNING: Possibly missing firmware for module: 'liquidio'
==> WARNING: Possibly missing firmware for module: 'mlxsw_spectrum'
==> WARNING: Possibly missing firmware for module: 'nfp'
==> WARNING: Possibly missing firmware for module: 'qed'
==> WARNING: Possibly missing firmware for module: 'cassini'
==> WARNING: Possibly missing firmware for module: 'adf7242'
  -> Running build hook: [archiso_pxe_nbd]
  -> Running build hook: [archiso_pxe_http]
  -> Running build hook: [archiso_pxe_nfs]
  -> Running build hook: [block]
==> WARNING: Possibly missing firmware for module: 'aic94xx'
==> WARNING: Possibly missing firmware for module: 'bfa'
==> WARNING: Possibly missing firmware for module: 'qla1280'
==> WARNING: Possibly missing firmware for module: 'qla2xxx'
==> WARNING: Possibly missing firmware for module: 'wd719x'
==> WARNING: Possibly missing firmware for module: 'xhci_pci_renesas'
  -> Running build hook: [filesystems]
  -> Running build hook: [keyboard]
  -> Running build hook: [grub-btrfs-overlayfs]
==> Generating module dependencies
==> Creating zstd-compressed initcpio image: '/boot/initramfs-linux-vita.img'
  -> Early uncompressed CPIO image generation successful
==> Initcpio image generation successful
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'archiso'
==> Using configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -c /etc/mkinitcpio.conf -g /boot/initramfs-linux.img
==> Starting build: '7.1.3-arch2-2'
  -> Running build hook: [base]
  -> Running build hook: [udev]
  -> Running build hook: [microcode]
  -> Running build hook: [modconf]
  -> Running build hook: [kms]
==> WARNING: Possibly missing firmware for module: 'ast'
  -> Running build hook: [memdisk]
  -> Running build hook: [archiso]
  -> Running build hook: [archiso_loop_mnt]
  -> Running build hook: [archiso_pxe_common]
==> WARNING: Possibly missing firmware for module: 'softing_cs'
==> WARNING: Possibly missing firmware for module: 'bna'
==> WARNING: Possibly missing firmware for module: 'liquidio'
==> WARNING: Possibly missing firmware for module: 'mlxsw_spectrum'
==> WARNING: Possibly missing firmware for module: 'nfp'
==> WARNING: Possibly missing firmware for module: 'qed'
==> WARNING: Possibly missing firmware for module: 'cassini'
==> WARNING: Possibly missing firmware for module: 'adf7242'
  -> Running build hook: [archiso_pxe_nbd]
  -> Running build hook: [archiso_pxe_http]
  -> Running build hook: [archiso_pxe_nfs]
  -> Running build hook: [block]
==> WARNING: Possibly missing firmware for module: 'aic94xx'
==> WARNING: Possibly missing firmware for module: 'bfa'
==> WARNING: Possibly missing firmware for module: 'qla1280'
==> WARNING: Possibly missing firmware for module: 'qla2xxx'
==> WARNING: Possibly missing firmware for module: 'wd719x'
==> WARNING: Possibly missing firmware for module: 'xhci_pci_renesas'
  -> Running build hook: [filesystems]
  -> Running build hook: [keyboard]
  -> Running build hook: [grub-btrfs-overlayfs]
==> Generating module dependencies
==> Creating zstd-compressed initcpio image: '/boot/initramfs-linux.img'
  -> Early uncompressed CPIO image generation successful
==> Initcpio image generation successful
(15/31) Refreshing PackageKit...
(16/31) Updating the appstream cache...
✔ Metadata cache was updated successfully.
(17/31) Restarting accounts-daemon...
  Skipped: Running in chroot.
(18/31) Reloading system bus configuration...
  Skipped: Running in chroot.
(19/31) Checking for old perl modules...
(20/31) Updating fontconfig cache...
(21/31) Probing GDK-Pixbuf loader modules...
(22/31) Updating GIO module cache...
(23/31) Compiling GSettings XML schema files...
(24/31) Probing GTK3 input method modules...
(25/31) Updating icon theme caches...
(26/31) Updating the info directory file...
(27/31) Updating the desktop file MIME type cache...
(28/31) Updating the vlc plugin cache...
(29/31) Updating Vim help tags...
(30/31) #### Important Linux packages have changed. Reboot is recommended. ####
(31/31) Performing snapper post snapshots for the following configurations...
fatal library error, lookup self
umount: /home/retroTech/vita-build/x86_64/airootfs/proc: target is busy.
[mkarchiso] INFO: Done! Packages installed successfully.
[mkarchiso] INFO: Creating version files...
[mkarchiso] INFO: Done!
[mkarchiso] INFO: Copying /etc/skel/* to user homes...
[mkarchiso] INFO: Done!
[mkarchiso] INFO: Creating a list of installed packages on live-enviroment...
[mkarchiso] INFO: Done!
[mkarchiso] INFO: Preparing kernel and initramfs for the ISO 9660 file system...
[mkarchiso] INFO: Done!
[mkarchiso] INFO: Setting up SYSLINUX for BIOS booting...
[mkarchiso] INFO: Done! SYSLINUX set up for BIOS booting successfully.
[mkarchiso] INFO: Setting up GRUB for UEFI booting...
[mkarchiso] INFO: Creating FAT image of size: 23 MiB...
mkfs.fat 4.2 (2021-01-31)
[mkarchiso] INFO: Done! GRUB set up for UEFI booting successfully.
[mkarchiso] INFO: Cleaning up in pacstrap location...
find: ‘/home/retroTech/vita-build/x86_64/airootfs/proc/362065’: No such file or directory
find: ‘/home/retroTech/vita-build/x86_64/airootfs/proc/362111’: No such file or directory
find: ‘/home/retroTech/vita-build/x86_64/airootfs/proc/362134’: No such file or directory

###################################################################
Phase 8 :
- Creating checksums
- Copying pgklist
###################################################################

Creating checksums for : vita-v26.02.16.01-x86_64.iso
##################################################################

Building sha1sum
########################
sha1sum: vita-v26.02.16.01-x86_64.iso: No such file or directory
Building sha256sum
########################
sha256sum: vita-v26.02.16.01-x86_64.iso: No such file or directory
Building md5sum
########################
md5sum: vita-v26.02.16.01-x86_64.iso: No such file or directory

Moving pkglist.x86_64.txt
########################

##################################################################
Phase 9 :
- Removing the buildfolder or not
################################################################## 

Deleting the build folder if one exists - takes some time
Skipping build folder removal.

##################################################################
DONE
- Check your out folder :/home/retroTech/vita-Out
################################################################## 

