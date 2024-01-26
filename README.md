        _        _    __ _ _
       | |      | |  / _(_) |
     __| |  ___ | |_| |_ _| | ___  ___
    /  _  |/ _ \| __|  _| | |/ _ \/ __|
    | (_| | (_) | |_| | | | |  __/\__ \
     \____|\___/ \__|_| |_|_|\___||___/

## Spec

- OS: Manjaro Linux,Windows
- Shell: zsh,powershell
- Terminal: wezterm
- Editor: neovim
- Font:[PlemolJP Console NF](https://github.com/yuru7/PlemolJP)

## setup

### install go

```bash
sudo pacman -S go
yum install -y golang
sudo apt  install -y golang-go
winget install GoLang.Go
```

### install aqua

Linux

```bash
curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.1.2/aqua-installer
echo "411caf1b5fcef4f5e74aa2a9fe99182ea13ab93ecd8ed4a983a7cff9f08edab9  aqua-installer" | sha256sum -c
chmod +x aqua-installer
./aqua-installer
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
```

windows

```cmd
winget install aquaproj.aqua
SET PATH=%LOCALAPPDATA%\aquaproj-aqua\bat;%LOCALAPPDATA%\aquaproj-aqua\bin;%PATH%
```

### linker

All configuration files are linked as symbolic links with [rhysd/dotfiles](https://github.com/rhysd/dotfiles)
