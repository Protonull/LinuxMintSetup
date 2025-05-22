#!/bin/sh

echogreen() {
    echo "\e[32m$*\e[0m" 1>&2;
}

echored() {
    echo "\e[31m$*\e[0m" 1>&2;
}

apt update

if ! (which git); then
    echogreen "Installing git"
    apt install git -y
fi

if ! (which gh); then
    echogreen "Installing Github CLI"
    apt install gh -y
fi

if ! (which brew); then
    echogreen "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    apt install build-essential -y
    brew install gcc
fi

brew update

if ! (which lazygit); then
    echogreen "Installing lazygit"
    brew install lazygit
fi

if ! (which htop); then
    echogreen "Installing htop"
    brew install htop
fi

if ! (which gparted); then
    echogreen "Installing gparted"
    apt install gparted -y
fi

if ! (which sdk); then
    echogreen "Installing sdkman"
    curl -s "https://get.sdkman.io" | bash
fi

if ! (flatpak info ca.desrt.dconf-editor); then
    echogreen "Installing dconf editor"
    flatpak install flathub ca.desrt.dconf-editor -y
fi

if ! (flatpak info com.github.tchx84.Flatseal); then
    echogreen "Installing Flatseal"
    flatpak install flathub com.github.tchx84.Flatseal -y
fi

# Installing this as a flatpak WILL cause you problems if you intent to use it
# as an IDE: sandboxing IDEs is just asking for trouble. If you've having
# trouble locating a binary, like the Dart SDK (/usr/bin/dart), try doing:
# $ flatpak run --command=sh com.vscodium.codium
# $ which dart
# if it cannot be found, you may find it within /run/host/bin/, which seems to
# be a remapped /usr/bin/. You may need to enable the "All system libraries,
# executables and static data" (host-os) option in Flatseal.
if ! (flatpak info com.vscodium.codium); then
    echogreen "Installing VSCodium"
    flatpak install flathub com.vscodium.codium -y
fi

echogreen "Setting VSCodium as git editor"
git config --global core.editor "flatpak run com.vscodium.codium --wait"

if ! (flatpak info it.mijorus.gearlever); then
    echogreen "Installing Gear Lever (AppImage installer)"
    flatpak install flathub it.mijorus.gearlever -y
fi

if ! (flatpak info io.missioncenter.MissionCenter); then
    echogreen "Installing Mission Centre (Windows-like System Monitor)"
    flatpak install flathub io.missioncenter.MissionCenter -y
fi

if ! (flatpak info org.gnome.baobab); then
    echogreen "Installing Disk Useage Analyser"
    flatpak install flathub org.gnome.baobab -y
fi

if ! (which meld); then
    echogreen "Installing Meld"
    apt install meld -y
fi

if ! (flatpak info org.sqlitebrowser.sqlitebrowser); then
    echogreen "Installing DB Browser for SQLite"
    flatpak install flathub org.sqlitebrowser.sqlitebrowser -y
fi

if ! (flatpak info com.brave.Browser); then
    echogreen "Installing Brave Browser"
    flatpak install flathub com.brave.Browser -y
fi

if ! (flatpak info com.discordapp.Discord); then
    echogreen "Installing Discord"
    flatpak install flathub com.discordapp.Discord -y
fi

if ! (flatpak info org.prismlauncher.PrismLauncher); then
    echogreen "Installing Prism Launcher"
    flatpak install flathub org.prismlauncher.PrismLauncher -y
fi

if ! (which bun); then
    echogreen "Installing Bun.sh"
    curl -fsSL https://bun.sh/install | bash
    echo "telemetry = false" > ~/.bunfig.toml
fi

if ! (which zig); then
    echogreen "Installing ziglang"
    brew install zig
fi

if ! (which zls); then
    echogreen "Installing zig language server"
    brew install zls
fi

if ! (which dart); then
    echogreen "Installing Dart"
    apt install dart -y
fi

if ! (which dropbox); then
    echogreen "Installing Dropbox"
    apt install dropbox -y
    apt install nemo-dropbox -y
fi

if ! (flatpak info flathub io.freetubeapp.FreeTube); then
    echogreen "Installing FreeTube"
    flatpak install flathub flathub io.freetubeapp.FreeTube -y
fi

if ! [ -f "$(echo ~/.gitignore)" ]; then
    echogreen "Setting up global gitignore"
    curl -fsSL https://www.toptal.com/developers/gitignore/api/linux > ~/.gitignore
    git config --global core.excludesFile ~/.gitignore
fi

if ! (which yt-dlp); then
    echogreen "Installing Youtube Downloader"
    brew install yt-dlp
fi

echo "============================================================"
echo "Remember to set your git credentials:"
echo " $ git config --global user.name \"<name>\""
echo " $ git config --global user.email \"<email>\""
echo ""
echo "Remember to auth with Github:"
echo " $ gh auth login"
echo ""
echo "Remember to install Jetbrains Toolbox: you only need to run the tarball executable once."
echo ""
echo "Remember to install a Java version:"
echo " $ sdk list java"
