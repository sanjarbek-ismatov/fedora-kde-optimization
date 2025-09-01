# My setup scripts for Fedora KDE (for my cousin)
## Usage
```bash
git clone https://github.com/sanjarbek-ismatov/fedora-kde-optimization
cd fedora-kde-optimization
chmod +x ./init.sh
chmod +x ./debloat.sh
chmod +x ./power-management.sh
./init.sh && ./debloat.sh && ./power-management.sh
```
## It includes:
- RPM Fusion support
- Multimedia codecs and HW acceleration
- TLP + Sleep fix (For my Laptop)
- Debloating (most unnecessary packages, services and autostarts are removed, chrony is replaced to systemd-timesyncd to save more resources)
