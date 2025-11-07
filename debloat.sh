sudo dnf remove kontactinterface libreoffice-data libreoffice-core kmahjongg kmines kpat kolourpaint skanpage kdeconnectd krdc krdp krfb neochat firewall-config im-chooser mediawriter kmouth toolbox chrony abrt cups rpcbind xwaylandvideobridge dragon elisa-player akonadi-server switcheroo-control virtualbox-guest-additions qemu-guest-agent @kde-pim @desktop-accessibility @libreoffice @kde-apps @kde-media @admin-tools firewalld
sudo dnf autoremove -y
sudo cp ./configs/timesyncd.conf /etc/systemd/
sudo rm -rf /usr/share/polkit-1/rules.d/org.fedoraproject.FirewallD1.rules
sudo rm -rf {baloo_file,geoclue-demo-agent,imsettings-start,org.kde.discover.notifier,spice-vdagent,vmware-user}.desktop

sudo systemctl disable avahi-daemon.service
sudo systemctl stop avahi-daemon.socket
sudo systemctl disable ModemManager.service
sudo systemctl disable smartd.service

sudo systemctl enable --now systemd-timesyncd
sudo timedatectl set-local-rtc 0
timedatectl
