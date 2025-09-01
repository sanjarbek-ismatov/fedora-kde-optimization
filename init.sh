#!/usr/bin/bash

# configuring dnf 
sudo cp ./configs/dnf.conf /etc/dnf/

# useful packages
sudo dnf install powertop nvtop htop btop rocm-smi fastfetch git gh unzip p7zip p7zip-plugins unrar libva-utils fish -y

# changing terminal from bash to fish
# chsh -s /usr/bin/fish
# sudo chsh -s /usr/bin/fish

# fastfetch as neofetch
mkdir -p ~/.config/fastfetch
cp /usr/share/fastfetch/presets/neofetch.jsonc ~/.config/fastfetch/config.jsonc

# RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Caching for PackageKit
sudo dnf makecache
sudo dnf4 makecache
pkcon refresh

# Firmware updates
sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices # Lists devices that have available firmware updates.
sudo fwupdmgr get-updates # Fetches the list of available firmware updates.
sudo fwupdmgr update

# Codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 -y
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 -y
sudo dnf install rpmfusion-\*-appstream-data
vainfo
