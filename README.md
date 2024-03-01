# dotfiles
A set of opinionated setup and installation scripts for Linux, Windows and macOS.

## Setup

Generate SSH key:
```shell
ssh-keygen -t rsa -b 4096 -C "github@mateuszwieloch.com"
```

Start the ssh-agent in the background:
```shell
eval "$(ssh-agent -s)"
```

Add private SSH key to ssh-agent:
```shell
ssh-add ~/.ssh/id_rsa
```

Display and copy public SSH key:
```shell
cat ~/.ssh/id_rsa.pub
```

Paste it in [GitHub -> Settings -> SSH and GPG keys -> New SSH key](https://github.com/settings/keys)

Clone the dotfiles repo:
```shell
git@github.com:mateuszwieloch/dotfiles.git
```

To setup .gitconfig, run
```shell
./git.sh
```
