cd /etc/fonts/conf.d
rm 65-wqy-zenhei.conf
ln -s /usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf

    Remove the symlinks 43-wqy-zenhei-sharp.conf and 65-wqy-zenhei.conf from 
    /etc/fonts/conf.d if you have problems with this package.
(1535/1665) installing libgee                                          [----------------------------------------] 100%
(1536/1665) installing protonplus                                      [----------------------------------------] 100%
Optional dependencies for protonplus
    gamemode
    gamescope [installed]
    mangohud [installed]
    protontricks [installed]
    scopebuddy
(1537/1665) installing perl-image-exiftool                             [----------------------------------------] 100%
Optional dependencies for perl-image-exiftool
    perl-archive-zip: Support for zip files, including epub
    perl-io-compress-brotli: Support for brotli-compressed metadata
(1538/1665) installing portproton                                      [----------------------------------------] 100%
Optional dependencies for portproton
    gamemode: Support for Feral GameMode
    lib32-gamemode: 32-bit support for Feral GameMode
    gamescope: Support for Gamescope [installed]
(1539/1665) installing xray-gaming-applications                        [----------------------------------------] 100%
(1540/1665) installing vita-kde-dark                                   [----------------------------------------] 100%
(1541/1665) installing vita7z-kde-theme                                [----------------------------------------] 100%
(1542/1665) installing photograph-liquid-boot-animation                [----------------------------------------] 100%
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'archiso'
==> Using configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -c /etc/mkinitcpio.conf -g /boot/initramfs-linux.img
==> ERROR: Invalid option -k -- '/boot/vmlinuz-linux' must be readable
error: command failed to execute correctly
(1543/1665) installing xray-os-cinematic-plymouth                      [----------------------------------------] 100%
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'archiso'
==> Using configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -c /etc/mkinitcpio.conf -g /boot/initramfs-linux.img
==> ERROR: Invalid option -k -- '/boot/vmlinuz-linux' must be readable
error: command failed to execute correctly
(1544/1665) installing xray-os-cinematic-ii-plymouth                   [----------------------------------------] 100%
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'archiso'
==> Using configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -c /etc/mkinitcpio.conf -g /boot/initramfs-linux.img
==> ERROR: Invalid option -k -- '/boot/vmlinuz-linux' must be readable
error: command failed to execute correctly


Creating user 'saned' (SANE daemon user) with UID 953 and GID 953.
Creating group 'sddm' with GID 952.
Creating user 'sddm' (SDDM Greeter Account) with UID 952 and GID 952.
Creating group 'usbmux' with GID 140.
Creating user 'usbmux' (usbmux user) with UID 140 and GID 140.
( 6/40) Registering binary formats...
  Skipped: Running in chroot.
( 7/40) Updating journal message catalog...
( 8/40) Reloading system manager configuration...
  Skipped: Running in chroot.
( 9/40) Reloading user manager configuration...
  Skipped: Running in chroot.
(10/40) Updating udev hardware database...
(11/40) Applying kernel sysctl settings...
  Skipped: Running in chroot.
(12/40) Creating temporary files...
(13/40) Reloading device manager configuration...
  Skipped: Running in chroot.
(14/40) Arming ConditionNeedsUpdate...
(15/40) Updating the MIME type database...
(16/40) Updating fontconfig configuration...
(17/40) Rebuilding certificate stores...
(18/40) Updating module dependencies...
(19/40) Install DKMS modules
==> dkms install --no-depmod broadcom-wl/6.30.223.271 -k 7.1.1-1-vita
==> dkms install --no-depmod broadcom-wl/6.30.223.271 -k 7.2.2-arch1-1

Error! Bad return status for module build on kernel: 7.2.2-arch1-1 (x86_64)
Consult /var/lib/dkms/broadcom-wl/6.30.223.271/build/make.log for more information.
==> WARNING: `dkms install --no-depmod broadcom-wl/6.30.223.271 -k 7.2.2-arch1-1' exited 10
==> depmod 7.1.1-1-vita
(20/40) Updating linux initcpios...
==> Building image from preset: /etc/mkinitcpio.d/linux-vita.preset: 'default'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux-vita -g /boot/initramfs-linux-vita.img
==> Starting build: '7.1.1-1-vita'
