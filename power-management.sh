#!/usr/bin/bash
sudo dnf remove tuned -y
sudo dnf install tlp tlp-rdw -y
sudo systemctl enable tlp
sudo cp ./configs/tlp.conf /etc/
sudo tlp start
sudo grubby --update-kernel=ALL --args="amd_iommu=on"
sudo grubby --update-kernel=ALL --args="iommu=pt"
sudo grubby --update-kernel=ALL --args="lockdown=integrity"
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
