sudo dnf install plasma-firewall vlc -y
sudo dnf remove kontactinterface libreoffice-data kmahjongg kmines kpat kolourpaint skanpage kdeconnectd krdc krfb neochat firewall-config im-chooser mediawriter kmouth toolbox chrony abrt cups rpcbind xwaylandvideobridge dragon elisa-player -y
sudo dnf autoremove -y
sudo cp ./configs/timesyncd.conf /etc/systemd/

sudo systemctl disable avahi-daemon.service
sudo systemctl stop avahi-daemon.socket
sudo systemctl disable ModemManager.service
sudo systemctl disable smartd.service

sudo rm baloo_file.desktop geoclue-demo-agent.desktop orca-autostart.desktop org.kde.discover.notifier.desktop vboxclient.desktop imsettings-start.desktop vmware-user.desktop spice-vdagent.desktop

sudo systemctl enable --now systemd-timesyncd
timedatectl
