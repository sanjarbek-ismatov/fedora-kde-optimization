#!/usr/bin/bash
sudo dnf remove tuned tuned-ppd -y
sudo dnf install https://kojipkgs.fedoraproject.org//packages/tlp/1.8.0/1.fc43/noarch/tlp-1.8.0-1.fc43.noarch.rpm https://kojipkgs.fedoraproject.org//packages/tlp/1.8.0/1.fc43/noarch/tlp-rdw-1.8.0-1.fc43.noarch.rpm -y
sudo systemctl enable tlp
sudo tlp start

# TLP-switch
git clone https://github.com/sanjarbek-ismatov/TLP-switch
cd ./TLP-switch
cmake -B build
cmake --build build
sudo cmake --install build

sudo mkdir -p /usr/share/tlp-switch/configs
sudo cp configs/* /usr/share/tlp-switch/configs

tlp-switch balanced

echo NOTE! use tlp-switch to change profiles

# sudo grubby --update-kernel=ALL --args="amd_iommu=on"
# sudo grubby --update-kernel=ALL --args="iommu=pt"
# sudo grubby --update-kernel=ALL --args="lockdown=integrity"
# sudo grubby --update-kernel=ALL --args="selinux=0"
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg
