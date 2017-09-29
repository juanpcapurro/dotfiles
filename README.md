# dotfiles
[I'm not a smart person, i copypaste stuff](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
to use the alias for the first time: 
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/juanpcapurro/dotfiles.git $HOME/.cfg
config checkout
```
## Installation of (hopefully) all the related software under arch-based distros

as root: 
```bash
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/x86_64"
pacman --noconfirm --needed -Sy base-devel xorg-xinit xorg-server terminator feh ffmpeg pulseaudio pulseaudio-alsa wpa_supplicant arandr pavucontrol pamixer mpv wget rofi python-pip neovim ranger poppler highlight htop network-manager-applet networkmanager qutebrowser transmission-cli atool libcaca xcompmgr transset-df texlive-most texlive-lang markdown zathura evince audacity vim-latexsuite rsync openssh noto-fonts-emoji cups screenfetch unzip unrar biber ntfs-3g jdk8-openjdk zsh xclip ctags gcc make cmake npm git ruby vlc qt4 flashplugin cython atom powerline python2-neovim python-neovim arc-gtk-theme polkit gparted zsh-completions ttf-dejavu ttf-inconsolata pandoc thunar numix-gtk-theme clang yaourt ttf-liberation noto-fonts ttf-dejavu scrot
#laptop-specific software
pacman --noconfirm --needed -S tp_smapi acpi_call

pip install netifaces psutil 
```
remember to set zsh as the default shell with `chsh`
with regular privileges
```bash
for PACKAGE in i3-gaps ttf-font-awesome vim-pathogen vim-live-latex-preview projectm-pulseaudio neofetch tamzen-font-git speedometer nodejs-markdown-pdf rambox-bin google-chrome i3lock-blur oh-my-zsh-git ttf-ms-fonts tree bumblebee-status-git rofi arc-gtk-theme gnome-keyring neofetch ; do yaourt --noconfirm -S $PACKAGE ; done

gsettings set org.gnome.desktop.background show-desktop-icons false
```
uninstall unused gnome apps
```bash
pacman -Rs empathy epiphany evince gnome-backgrounds gnome-calculator gnome-contacts gnome-screenshot gnome-user-docs gnome-user-share totem vino yelp
```

### neovim files
plugins are added as submodules. It's then necessary to run `git submodule update --init --recursive`

command-t needs to be compiled
``` bash
  cd ~/.config/nvim/bundle/command-t/ruby/command-t/ext/command-t
  ruby extconf.rb
  make
```
YCM also needs compilation. it requires `python3`, `npm`, `node` and `cmake`
```
cd ~/.config/nvim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
```

### other notes

