# Xray_OS

<p align="center">
  <img src="https://images2.imgbox.com/07/c0/shcL3xwb_o.png" width="320" alt="Xray_OS Logo"/>
</p>

<p align="center">
  <b>A high-performance, freedom-first, censorship-free Linux distribution built on Arch Linux.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Base-Arch%20Linux-blue?logo=archlinux" alt="Base"/>
  <img src="https://img.shields.io/badge/Kernel-Linux--Vita-green?logo=linux" alt="Kernel"/>
  <img src="https://img.shields.io/badge/Init-SystemD--Liberated-orange" alt="Init"/>
  <img src="https://img.shields.io/badge/Display-Wayland%20%7C%20X11%20%7C%20Xlibre-purple" alt="Display"/>
  <img src="https://img.shields.io/badge/License-GPL3-red" alt="License"/>
</p>

---

## ⚡ What is Xray_OS?

**Xray_OS** is an independent Arch Linux-based operating system built for enthusiasts, power users, and gamers who demand **unfiltered digital freedom, maximum responsiveness, and zero corporate telemetry**. 

We adhere strictly to the principle of **"Separating the Art from the Artist"**—we do not censor quality software, enforce ideological restrictions, or impose artificial barriers on what you can run on your hardware.

---

## 🚀 Key Features & Performance Engine

### 🧠 Smart Memory & Process Management
* **Native ZRAM Swap (`zstd`)**: Out-of-the-box dynamic compressed RAM swap (`zram-generator`) tuned with aggressive `swappiness=180` for instant app switching and zero disk-thrashing.
* **Systemd-OOMD with PSI**: Real-time Pressure Stall Information monitoring with custom cgroup slice policies (`user-.slice`, `system.slice`) to eliminate desktop freezes under heavy memory workloads.
* **Custom Ananicy-CPP Rules (`xray-ananicy-rules`)**: In-house process auto-nice and IO scheduler rules specially crafted for Xray_OS, giving top priority to active games, audio playback, and foreground apps while subduing background tasks.
* **Tuned Kernel Sysctl**: Low VFS cache pressure (`vfs_cache_pressure=50`), `page-cluster=0`, and high `vm.max_map_count` for AAA games and heavy virtual machines.

### 🐧 Custom `linux-vita` Kernel
* Custom-compiled, low-latency kernel tailored for desktop fluidity and gaming.
* Built-in support for modern CPU architectures, BBR congestion control, NVMe optimizations, and native PSI (*Pressure Stall Information*).

### 🛡️ SystemD-Liberated & Ideological Freedom
* **SystemD-Liberated**: Clean, unencumbered system management stripped of age-verification code and invasive tracking while maintaining 100% service compatibility.
* **Bazaar-Desinfected App Store**: Includes a customized, sanitized build of Bazaar (Flatpak/Flathub App Store) completely purged of political/ideological banners, moralizing pop-ups, and activist codes of conduct. Pure software discovery without interference.

---

## 🖥️ Desktop Environments & Graphics

* **Desktop Flavors**:
  * **KDE Plasma 6**: Modern, fluid, and customizable Wayland/X11 experience.
  * **XFCE 4**: Lightweight, blazingly fast, and dependable.
  * **SonicDE** & **GNOME** support available.
* **Display Servers**: Full support for native **Wayland** (EGL-Wayland, modern compositing) and **X11 / Xlibre** fallback.
* **GPU & Hardware Stack**:
  * Complete drivers for **AMD (Mesa/RADV)**, **Intel (i915/Xe)**, and **NVIDIA** proprietary/open drivers with dedicated helper (`xray-nvidia-settings`).
  * Broadcom Wi-Fi (`broadcom-wl-dkms`), Realtek, Bluetooth, and VirtualBox guest integration (`xray-vbox-share`).
* **Boot Experience**: Plymouth graphical boot animation (`photograph-liquid-boot-animation`) with seamless quiet-splash handover.

---

## 🎮 Gaming & Emulation Ready

Out-of-the-box support for modern Linux gaming and emulation:
* **Wine & Proton**: Native Steam, PortProton, ProtonPlus, Protontricks, DXVK, VKD3D, Wine-GE.
* **Performance Boosters**: `gamemode`, `gamescope`, `mangohud`, `scopebuddy`.
* **Emulators**: Full ecosystem readiness for RetroArch, RPCS3, PCSX2, Dolphin, Ryujinx/Suyu.

---

## 📦 Curated Software Suite

* **Web Browsers**: Floorp, Waterfox, Brave, Vivaldi, Opera / Opera-GX, Firefox.
* **Development & AI**: VS Codium, Zed Editor, Antigravity AI assistant, Git, full GCC/Clang/Rust toolchains.
* **Creativity & Office**: LibreOffice Fresh, GIMP, Inkscape, Kdenlive, Kate, Obsidian.
* **Privacy & Media**: KeePassXC, FreeTube, qBittorrent, Bazaar-Desinfected (ideology-free App Store).
* **Audio Architecture**: Full PipeWire + WirePlumber stack with low-latency ALSA, PulseAudio, and JACK compatibility.

---

## 🧰 Package Management & Installation

* **Dual Installer System**:
  * **Calamares GUI Installer**: User-friendly, partition-ready graphical installation.
  * **Xray CLI Installer**: Fast, scriptable terminal installation.
* **Repositories**:
  * Access to standard Arch Linux mirrors (`core`, `extra`, `multilib`).
  * Dedicated **`xray-core`** & **`xray-extra`** repositories for custom kernels, themes, and curated packages.
  * **Pamac GUI**: Easy package management with built-in AUR support and auto-cache cleanup.
* **Automated Post-Install Optimization**: `xray-system-final` and `xray-debloater` automatically configure GRUB, presets, and OOMD services upon installation.

---

## 🌐 Links & Resources

* **Report an Issue / Feedback**: [GitHub Issues](https://github.com/xray-os/xray-os-live-iso/issues)
* **Download ISOs**: [SourceForge Project Page](https://sourceforge.net/projects/xray-os/)
* **Package Repositories**: [GitLab xr-os](https://gitlab.com/xr-os)

---

<p align="center">
  <sub>Xray_OS — Pure Performance • True Sovereignty • No Compromises.</sub>
</p>
