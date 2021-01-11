Download executable from: https://www.jetbrains.com/pycharm/download/#section=linux

Then extract
```shell
sudo tar xzf pycharm-*.tar.gz -C /opt/
```
and run:
```shell
sh /opt/pycharm-*/bin/pycharm.sh
```

Once in PyCharm:
1) Run the "Create Command-line launcher" action, which creates the `/usr/local/bin/charm` launcher.
2) Run the "Create Desktop Entry" action, which creates a desktop entry in `~/.local/share/applications`. 

Problem `fish: Unable to open universal variable file`:
* go to Settings -> Tools -> Terminal and uncheck the "Shell integration"
