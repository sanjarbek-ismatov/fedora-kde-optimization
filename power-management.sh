#!/usr/bin/bash
sudo dnf remove tuned -y
sudo dnf install tlp tlp-rdw -y
sudo systemctl enable tlp
sudo cp ./configs/tlp.conf /etc/
sudo tlp start
sudo cp ./configs/default-wifi-powersave-on.conf /etc/NetworkManager/conf.d/
sudo cp ./configs/sysctl.conf /etc/
sudo sysctl -p
sudo systemctl restart NetworkManager
sudo grubby --update-kernel=ALL --args="amd_iommu=on"
sudo grubby --update-kernel=ALL --args="iommu=pt"
sudo grubby --update-kernel=ALL --args="lockdown=integrity"
sudo grubby --update-kernel=ALL --args="selinux=0"
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
