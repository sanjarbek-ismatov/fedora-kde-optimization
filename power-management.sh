#!/usr/bin/bash
sudo dnf remove tuned tuned-ppd -y
sudo dnf install https://kojipkgs.fedoraproject.org//packages/tlp/1.8.0/1.fc43/noarch/tlp-1.8.0-1.fc43.noarch.rpm https://kojipkgs.fedoraproject.org//packages/tlp/1.8.0/1.fc43/noarch/tlp-rdw-1.8.0-1.fc43.noarch.rpm -y
sudo systemctl enable tlp
sudo tlp start
# sudo grubby --update-kernel=ALL --args="amd_iommu=on"
# sudo grubby --update-kernel=ALL --args="iommu=pt"
# sudo grubby --update-kernel=ALL --args="lockdown=integrity"
# sudo grubby --update-kernel=ALL --args="selinux=0"
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg
