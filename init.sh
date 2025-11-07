#!/usr/bin/bash

# configuring dnf
sudo cp ./configs/dnf.conf /etc/dnf/

# useful packages
sudo dnf install powertop nvtop htop btop rocm-smi fastfetch git gh unzip p7zip p7zip-plugins unrar libva-utils fish -y
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# changing terminal from bash to fish
# chsh -s /usr/bin/fish
# sudo chsh -s /usr/bin/fish

# fastfetch as neofetch
mkdir -p ~/.config/fastfetch
cp /usr/share/fastfetch/presets/neofetch.jsonc ~/.config/fastfetch/config.jsonc

# Third-party Packages
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Removing useless testing repos
sudo rm -rf /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
sudo rm -rf /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo

# Firmware updates
sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices # Lists devices that have available firmware updates.
sudo fwupdmgr get-updates # Fetches the list of available firmware updates.
sudo fwupdmgr update

# Codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

# Switching to full Mesa
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y

# Nonfree firmware
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install rpmfusion-nonfree-release-tainted -y
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware" -y

# Installing appstream-data for PackageKit
sudo dnf install rpmfusion-\*-appstream-data -y

# Caching for PackageKit
sudo dnf makecache
sudo dnf4 makecache
pkcon refresh
