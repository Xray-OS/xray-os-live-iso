#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="Xray_OS"
iso_label="VT_$(date +%Y%m)"
iso_publisher="Xray_OS <https://xray-os.github.io/xray_os-website/get-started.html>"
iso_application="Xray_OS Live/Rescue CD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')

## GRUB SETTINGS
bootmodes=('bios.syslinux' 'uefi.grub')

## SYSTEMD SETTINGS
# bootmodes=('bios.syslinux'
#            'uefi.systemd-boot')

arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '15' '-b' '1M')
#airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
#bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/gshadow"]="0:0:400"
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/sudoers.d"]="0:0:750"
  ["/etc/grub.d/40_custom"]="0:0:755"
  ["/etc/skel/Desktop"]="0:0:755"
  ["/etc/skel/Desktop/xray-installer.desktop"]="0:0:755"
  ["/home/liveuser"]="1000:1000:755"
  ["/home/liveuser/Desktop"]="1000:1000:755"
  ["/home/liveuser/Desktop/xray-installer.desktop"]="1000:1000:755"
)
