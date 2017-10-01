# dotfiles
[I'm not a smart person, i copypaste stuff](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
to use the alias for the first time: 
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/juanpcapurro/dotfiles.git $HOME/.cfg
config checkout
```

### neovim files
plugins are added as submodules. It's then necessary to run `git submodule update --init --recursive`

### other notes

## First magic script (as root)
`curl goo.gl/h4AkV1 | sh`

```bash
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/x86_64"
pacman --noconfirm --needed -Sy git zsh curl 
chsh -s /usr/bin/zsh vasectomio
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/juanpcapurro/dotfiles.git $HOME/.cfg
config checkout
#this may fail due to already present files, and user interaction is required to either back up or delete those files
```

## Last magic script
`curl goo.gl/idCi7H | sh`

```bash
sudo pacman --noconfirm --needed -Sy base-devel xorg-xinit xorg-server terminator feh ffmpeg pulseaudio pulseaudio-alsa wpa_supplicant arandr pavucontrol pamixer mpv wget rofi python-pip neovim ranger poppler highlight htop network-manager-applet networkmanager qutebrowser transmission-cli atool libcaca xcompmgr transset-df texlive-most texlive-lang markdown zathura evince audacity vim-latexsuite rsync openssh noto-fonts-emoji cups screenfetch unzip unrar biber ntfs-3g jdk8-openjdk zsh xclip ctags gcc make cmake npm git ruby vlc qt4 flashplugin cython atom powerline python2-neovim python-neovim arc-gtk-theme polkit gparted zsh-completions ttf-dejavu ttf-inconsolata pandoc thunar numix-gtk-theme clang yaourt ttf-liberation noto-fonts ttf-dejavu scrot tp_smapi acpi_call 
sudo pip install netifaces psutil 

for PACKAGE in i3-gaps ttf-font-awesome vim-pathogen vim-live-latex-preview projectm-pulseaudio neofetch tamzen-font-git speedometer nodejs-markdown-pdf rambox-bin google-chrome i3lock-blur oh-my-zsh-git ttf-ms-fonts tree bumblebee-status-git rofi arc-gtk-theme gnome-keyring neofetch ; do yaourt --noconfirm -S $PACKAGE ; done

sudo pacman -Rs empathy epiphany evince gnome-backgrounds gnome-calculator gnome-contacts gnome-screenshot gnome-user-docs gnome-user-share totem vino yelp

gsettings set org.gnome.desktop.background show-desktop-icons false
config submodule update --init --recursive 

curl https://gist.githubusercontent.com/nweddle/e456229c0a773c32d37b/raw/b4fef3b4a113677e47ab08cc98bd8cbc71d1a4dc/agnoster-newline.zsh-theme > ~/.oh-my-zsh/themes/agnoster-newline.zsh-theme

#YCM 
cd ~/.config/nvim/bundle/YouCompleteMe ; ./install.py --clang-completer --tern-completer
#command-t
cd ~/.config/nvim/bundle/command-t/ruby/command-t/ext/command-t ; ruby extconf.rb ; make
```

