The following lines install [caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc) and all its prerequisites

```shell
mkdir -p ~/code
cd ~/code

git clone git@gitlab.com:interception/linux/tools.git
cd tools

sudo apt install --yes cmake libboost-all-dev
cmake -B build -DCMAKE_BUILD_TYPE=Release

sudo apt install --yes libyaml-cpp0.6 libevdev-dev libudev-dev
cmake --build build
cd build
make && sudo make install

cd ~/code
git clone https://gitlab.com/interception/linux/plugins/caps2esc.git
cd caps2esc
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
cd build
make && sudo make install
```

Now we need to use caps2esc to setup a service to intercept keyboard events. This guide is [based on this post](https://askubuntu.com/questions/979359/how-do-i-install-caps2esc).

On Ubuntu/Debian, these executables are now in `/usr/local/bin/caps2esc`.

```shell
sudoedit /etc/udevmon.yaml
```
and then put this in:
```
- JOB: "intercept -g $DEVNODE | caps2esc -m 1 | uinput -d $DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
```

```shell
sudoedit /etc/systemd/system/udevmon.service
```
and put this in:
```
[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/local/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target
```

Finally:
```shell
sudo systemctl enable --now udevmon
```
