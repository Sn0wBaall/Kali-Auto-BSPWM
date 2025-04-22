#!/bin/bash

## COLOURS

greenColour="\e[0;32m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m"
blueColour="\e[0;34m"
yellowColour="\e[0;33m"
purpleColour="\e[0;35m"
turquoiseColour="\e[0;36m"
grayColour="\e[0;37m"

## BOLD COLOURS

BgreenColour="\e[1;32m"
BendColour="\033[0m\e[0m"
BredColour="\e[1;31m"
BblueColour="\e[1;34m"
ByellowColour="\e[1;33m"
BpurpleColour="\e[1;35m"
BturquoiseColour="\e[1;36m"
BgrayColour="\e[1;37m"

dir=$(pwd)

if [ $(id -u) == 0 ];then

  echo -e "\n${BredColour}[!] Please execute the script without root${endColour}\n"

else

  echo -ne "${BgreenColour}[+]${endColour}${grayColour} Plese type your user${endColour}${turquoiseColour} --> ${endColour}" && read user

  echo -e "\n${BgreenColour}[+]${endColour}${grayColour} Installing all dependencies${endColour}"

  sudo apt install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev

  echo -e "\n${BgreenColour}[+]${endColour}${grayColour} Installing necessary programs${endColour}\n"

  sudo apt install -y kitty rofi moreutils feh picom sxhkd bspwm i3lock-fancy flameshot tty-clock cmake polybar lsd cargo; cargo install bat

  echo -e "\n${BgreenColour}[+]${endColour}${grayColour} Cloning necessary repositories${endColour}\n"

  cd ~/Downloads

  git clone https://github.com/baskerville/bspwm
  git clone https://github.com/baskerville/sxhkd
  git clone https://github.com/adi1090x/rofi
  git clone https://github.com/lr-tech/rofi-themes-collection
  git clone https://github.com/sn0wbaall/Wallpapers

  echo -e "\n${BgreenColour}[+]${endColour}${grayColour} Installing more programs${endColour}\n"

  cd ~/Downloads/bspwm; make; sudo make install
  cd ~/Downloads/sxhkd; make; sudo make install
  cd ~/Downloads/rofi; ./setup.sh
  cd ~/Downloads/rofi-themes-collection; mkdir -p ~/.local/share/rofi/themes/; cp themes/* ~/.local/share/rofi/themes/
  cd ~/Downloads/Wallpapers; ./setup.sh
  cd ~/.config; mkdir bin; cd bin; touch target
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

  cd $dir/rei

  cp -r .fonts ~
  cp -r bspwm ~/.config
  cp -r lsd ~/.config
  cp -r polybar ~/.config
  cp -r kitty ~/.config
  cp -r picom ~/.config
  cp -r sxhkd ~/.config
  cp -r .p10k.zsh ~
  cp -r .zshrc ~
  sudo cp -r nvim /opt

  cd ~; cat .zshrc | sed "s/user/$user/g" | sponge .zshrc
  fc-cache -v

  cd ~/Downloads; rm -rf {bspwm,sxhkd,picom,rofi,rofi-themes-collection,Wallpapers}

  echo -e "\n${ByellowColour}[!] Restarting the system${endColour}\n"
  sleep 3
  sudo reboot

fi
