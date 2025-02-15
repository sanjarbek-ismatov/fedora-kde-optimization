sudo dnf install vlc -y
sudo dnf remove firewalld kontactinterface libreoffice-data kmahjongg kmines kpat kolourpaint skanpage kdeconnectd krdc krdp krfb neochat firewall-config im-chooser mediawriter kmouth toolbox chrony abrt cups rpcbind xwaylandvideobridge dragon elisa-player akonadi-server switcheroo-control virtualbox-guest-additions qemu-guest-agent @kde-pim @desktop-accessibility @libreoffice @kde-apps @kde-media 
sudo dnf autoremove -y
sudo cp ./configs/timesyncd.conf /etc/systemd/
sudo cp ./configs/resolved.conf /etc/systemd/

sudo systemctl disable avahi-daemon.service
sudo systemctl stop avahi-daemon.socket
sudo systemctl disable ModemManager.service
sudo systemctl disable smartd.service
sudo systemctl restart systemd-resolved

sudo rm baloo_file.desktop geoclue-demo-agent.desktop orca-autostart.desktop org.kde.discover.notifier.desktop vboxclient.desktop imsettings-start.desktop vmware-user.desktop spice-vdagent.desktop

sudo rm /usr/share/polkit-1/rules.d/org.freedesktop.GeoClue2.rules /usr/share/polkit-1/rules.d/org.fedoraproject.FirewallD1.rules

sudo systemctl enable --now systemd-timesyncd
sudo timedatectl set-local-rtc 0
timedatectl
