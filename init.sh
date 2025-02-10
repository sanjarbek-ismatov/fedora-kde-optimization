# This script performs the following tasks to optimize Fedora KDE:

# 1. Installs RPM Fusion repositories (both free and nonfree) for additional software packages.
# 2. Enables the Fedora Cisco OpenH264 repository for H.264 codec support.
# 3. Updates the core group of packages.
# 4. Refreshes and updates firmware using fwupd.
# 5. Installs multimedia codecs and replaces the free versions of ffmpeg and mesa drivers with their full versions.
# 6. Updates multimedia packages while excluding the PackageKit-gstreamer-plugin.
#!/usr/bin/bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core
sudo dnf4 group update core

# Firmware updates
sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices # Lists devices that have available firmware updates.
sudo fwupdmgr get-updates # Fetches the list of available firmware updates.
sudo fwupdmgr update

# Codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686