#!/bin/bash

#color
Green='\033[0;32m'        # Green
NC='\033[0m'              # No Color

chaotic-aur-mirrorlist-setup()
{
    echo ""
    wget -q -O chaotic-mirrorlist "https://raw.githubusercontent.com/chaotic-aur/pkgbuild-chaotic-mirrorlist/main/mirrorlist"
    sudo mv chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist
}

system-update()
{
    pacman -Syu chaotic-keyring
}

check-mirror-exists()
{
    if test -f "/etc/pacman.d/chaotic-mirrorlist"
    then
        echo ""
        echo -e "${Green}Chaotic AUR is successfully installed,${NC}"
        echo -e "${Green}Now we'll check for a system update with keyring!${NC}"
        echo ""
        system-update
    else
        echo ""
        echo -e "${Green}Mirrorlist is not installed,${NC}"
        echo -e "${Green}Trying to install it manually${NC}"
        echo ""
        chaotic-aur-mirrorlist-setup
        check-mirror-exists
    fi
}

config-file-append()
{
sudo echo -e "#Chaotic-AUR" >> /etc/pacman.conf
sudo echo -e "" >> /etc/pacman.conf
sudo echo -e "[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
check-mirror-exists
}

make-sure-system-is-updated()
{
echo -e "${Green}To avoid unknown errors, let's make sure system is updated${NC}"
sudo pacman -Syu
}

let-s-install-it()
{
echo -e "${Green}This process needs super user permission (sudo). So please read the bash script if needed. If you've doubt about any line of the script, please don't run this or tell us!${NC}"

make-sure-system-is-updated

sudo pacman-key --recv-key 3056513887B78AEB --keyserver hkp://keyserver.ubuntu.com:80
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo ""
echo -e "${Green}Please don't continue any further if you have encountered any error! In this case you can run this script again or do things manully! You'll find guideline in the official page.${NC}"
echo "https://aur.chaotic.cx/"
echo ""

while true; do
    read -p "Do you want to continue?(yes or no) " yn
    case $yn in
        [Yy]* ) echo ""; echo -e "${Green}Wait...${NC}"; echo ""; sleep 2; break;;
        [Nn]* ) echo ""; cd ..; rm -rf installing-chaotic-aur-pkg.tmp/; exit;;
        * ) echo -e "${Green}Please answer yes or no. Press y for yes or n for no. ${NC}";;
    esac
done

config-file-append
}

pacman-conf-chaotic-commented-not()
{
if grep --quiet -x '#\[chaotic-aur\]' '/etc/pacman.conf' || grep --quiet -x '#Include = /etc/pacman.d/chaotic-mirrorlist' '/etc/pacman.conf'
then
    echo -e "${Green}Chaotic AUR is installed but disabled!${NC}"
    echo -e "${Green}Trying to enable it,${NC}"


    echo -e "${Green}This process needs super user permission (sudo). So please read the bash script if needed. If you've doubt about any line of the script, please don't run this or tell us!${NC}"

    sudo sed -i 's/#\[chaotic-aur\]/\[chaotic-aur\]/' /etc/pacman.conf
    sudo sed -i 's/#Include\ =\ \/etc\/pacman.d\/xero-mirrorlist/Include\ =\ \/etc\/pacman.d\/xero-mirrorlist/' /etc/pacman.conf

    check-mirror-exists
else
    echo -e "${Green}Chaotic AUR is not installed!${NC}"
    echo -e "${Green}Let's intall it!${NC}"
    let-s-install-it
fi
}

pacman-conf-chaotic-check()
{
if grep --quiet -x '\[chaotic-aur\]' '/etc/pacman.conf' && grep --quiet -x 'Include = /etc/pacman.d/chaotic-mirrorlist' '/etc/pacman.conf'
then
    echo -e "${Green}Chaotic AUR is installed!${NC}"
else
    pacman-conf-chaotic-commented-not
fi
}

mkdir installing-chaotic-aur-pkg.tmp/
cd installing-chaotic-aur-pkg.tmp/
pacman-conf-chaotic-check
cd ..
rm -rf installing-chaotic-aur-pkg.tmp/
exit
