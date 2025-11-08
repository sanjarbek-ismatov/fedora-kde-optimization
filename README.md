# My setup scripts for Fedora KDE 43
## Usage
```bash
git clone https://github.com/sanjarbek-ismatov/fedora-kde-optimization.git
cd fedora-kde-optimization
chmod +x ./init.sh
chmod +x ./debloat.sh
chmod +x ./power-management.sh
./init.sh && ./debloat.sh && ./power-management.sh
```
## It includes:
- RPM Fusion and Terra support
- Multimedia codecs and HW acceleration for AMD systems
- Power Management: TLP + Sleep fix (For my Laptop)
- Debloating (most unnecessary packages, services and autostarts are removed, chrony is replaced to systemd-timesyncd to save more resources)
