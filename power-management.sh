#!/usr/bin/bash
sudo dnf remove tuned tuned-ppd -y
sudo dnf install tlp tlp-rdw
sudo systemctl enable tlp
sudo cp configs/tlp.conf /etc/
sudo tlp start

sudo cp configs/grub /etc/default
# sudo grubby --update-kernel=ALL --args="amd_iommu=on"
# sudo grubby --update-kernel=ALL --args="iommu=pt"
# sudo grubby --update-kernel=ALL --args="selinux=0"
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
