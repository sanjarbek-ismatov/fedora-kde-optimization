#!/usr/bin/bash
sudo cp ./configs/dnf.conf /etc/dnf/
sudo dnf install powertop nvtop htop btop rocm-smi fastfetch git gh unzip p7zip p7zip-plugins unrar libva-utils -y
mkdir -p .config/fastfetch
cp /usr/share/fastfetch/presets/neofetch.jsonc ~/.config/fastfetch/config.jsonc
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
#sudo dnf update @core -y # I do not recommend using it if you have not had updates yet
#sudo dnf4 update @core -y # I do not recommend using it if you have not had updates yet
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
#sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y # It also updates some parts of the system
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 -y
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 -y
vainfo
