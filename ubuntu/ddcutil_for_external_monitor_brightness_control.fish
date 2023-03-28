sudo apt install ddcutil
sudo modprobe i2c-dev
sudo cp /usr/share/ddcutil/data/45-ddcutil-i2c.rules /etc/udev/rules.d

sudo groupadd --system i2c
sudo usermod $USER -aG i2c

sudo touch /etc/modules-load.d/i2c.conf
sudo sh -c 'echo "i2c-dev" >> /etc/modules-load.d/i2c.conf'

echo "REBOOT"
