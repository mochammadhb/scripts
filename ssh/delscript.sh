#!/bin/bash
# My Telegram : https://t.me/mochammadhb
# ==========================================
# Color
RED='\033[0;1;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================

#Message
echo -e "Waiting For Uninstall This Scripts"
sleep 5

#Uninstall All
rm -f /etc/xray/domain
apt purge ruby -y
apt purge python -y
apt purge make -y
apt purge cmake -y
apt purge coreutils -y
apt purge rsyslog -y
apt purge net-tools -y
apt purge zip -y
apt purge unzip -y
apt purge nano -y
apt purge sed -y
apt purge gnupg -y
apt purge gnupg1 -y
apt purge bc -y
apt purge jq -y
apt purge apt-transport-https -y
apt purge build-essential -y
apt purge dirmngr -y
apt purge libxml-parser-perl -y
apt purge neofetch -y
apt purge git -y
apt purge lsof -y
apt purge libsqlite3-dev -y
apt purge libz-dev -y
apt purge gcc -y
apt purge g++ -y
apt purge libreadline-dev -y
apt purge zlib1g-dev -y
apt purge libssl-dev -y
#apt purge libssl1.0-dev -y
apt purge dos2unix -y
apt autoremove -y

cd /usr/bin/
echo -e "${RED}Remove portsshnontls${NC}"
rm -f portsshnontls
sleep 1

echo -e "${RED}Remove portsshws${NC}"
rm -f portsshws
sleep 1

echo -e "${RED}Remove menu-ssh${NC}"
rm -f menu-ssh
sleep 1

echo -e "${RED}Remove menu-proxy${NC}"
rm -f menu-proxy
sleep 1

echo -e "${RED}Remove menu-v2ray${NC}"
rm -f menu-v2ray
sleep 1

echo -e "${RED}Remove showsnell${NC}"
rm -f showsnell
sleep 1

echo -e "${RED}Remove menu-trojan${NC}"
rm -f menu-trojan
sleep 1

echo -e "${RED}Remove menu-shadow${NC}"
rm -f menu-shadow
sleep 1

echo -e "${RED}Remove menu-vpn${NC}"
rm -f menu-vpn
sleep 1

echo -e "${RED}Remove menu-backup${NC}"
rm -f menu-backup
sleep 1

echo -e "${RED}Remove menu-tools${NC}"
rm -f menu-tools
sleep 1

echo -e "${RED}Remove vmessmenu${NC}"
rm -f vmessmenu
sleep 1

echo -e "${RED}Remove vlessmenu${NC}"
rm -f vlessmenu
sleep 1

echo -e "${RED}Remove trmenu${NC}"
rm -f trmenu
sleep 1

echo -e "${RED}Remove trgomenu${NC}"
rm -f trgomenu
sleep 1

echo -e "${RED}Remove setmenu${NC}"
rm -f setmenu
sleep 1

echo -e "${RED}Remove checkstart${NC}"
rm -f checkstart
sleep 1

echo -e "${RED}Remove addhost${NC}"
rm -f addhost
sleep 1

echo -e "${RED}Remove menu${NC}"
rm -f menu
sleep 1

echo -e "${RED}Remove addssh${NC}"
rm -f addssh
sleep 1

echo -e "${RED}Remove trialssh${NC}"
rm -f trialssh
sleep 1

echo -e "${RED}Remove delssh${NC}"
rm -f delssh
sleep 1

echo -e "${RED}Remove member${NC}"
rm -f member
sleep 1

echo -e "${RED}Remove delexp${NC}"
rm -f delexp
sleep 1

echo -e "${RED}Remove cekssh${NC}"
rm -f cekssh
sleep 1

echo -e "${RED}Remove restart${NC}"
rm -f restart
sleep 1

echo -e "${RED}Remove speedtest${NC}"
rm -f speedtest
sleep 1

echo -e "${RED}Remove info${NC}"
rm -f info
sleep 1

echo -e "${RED}Remove about${NC}"
rm -f about
sleep 1

echo -e "${RED}Remove autokill${NC}"
rm -f autokill
sleep 1

echo -e "${RED}Remove tendang${NC}"
rm -f tendang
sleep 1

echo -e "${RED}Remove ceklim${NC}"
rm -f ceklim
sleep 1

echo -e "${RED}Remove ram${NC}"
rm -f ram
sleep 1

echo -e "${RED}Remove renewssh${NC}"
rm -f renewssh
sleep 1

echo -e "${RED}Remove clearlog${NC}"
rm -f clearlog
sleep 1

echo -e "${RED}Remove changeport${NC}"
rm -f changeport
sleep 1

echo -e "${RED}Remove portovpn${NC}"
rm -f portovpn
sleep 1

echo -e "${RED}Remove portwg${NC}"
rm -f portwg
sleep 1

echo -e "${RED}Remove porttrojan${NC}"
rm -f porttrojan
sleep 1

echo -e "${RED}Remove portsstp${NC}"
rm -f portsstp
sleep 1

echo -e "${RED}Remove portsquid${NC}"
rm -f portsquid
sleep 1

echo -e "${RED}Remove portvlm${NC}"
rm -f portvlm
sleep 1

echo -e "${RED}Remove wbmn${NC}"
rm -f wbmn
sleep 1

echo -e "${RED}Remove xp${NC}"
rm -f xp
sleep 1

echo -e "${RED}Remove swapkvm${NC}"
rm -f swapkvm
sleep 1

echo -e "${RED}Remove addvmess${NC}"
rm -f addvmess
sleep 1

echo -e "${RED}Remove addvless${NC}"
rm -f addvless
sleep 1

echo -e "${RED}Remove addtrojan${NC}"
rm -f addtrojan
sleep 1

echo -e "${RED}Remove delvmess${NC}"
rm -f delvmess
sleep 1

echo -e "${RED}Remove delvless${NC}"
rm -f delvless
sleep 1

echo -e "${RED}Remove deltrojan${NC}"
rm -f deltrojan
sleep 1

echo -e "${RED}Remove cekvmess${NC}"
rm -f cekvmess
sleep 1

echo -e "${RED}Remove cekvless${NC}"
rm -f cekvless
sleep 1

echo -e "${RED}Remove cektrojan${NC}"
rm -f cektrojan
sleep 1

echo -e "${RED}Remove renewvmess${NC}"
rm -f renewvmess
sleep 1

echo -e "${RED}Remove renewvless${NC}"
rm -f renewvless
sleep 1

echo -e "${RED}Remove renewtrojan${NC}"
rm -f renewtrojan
sleep 1

echo -e "${RED}Remove certv2ray${NC}"
rm -f certv2ray
sleep 1

echo -e "${RED}Remove addtrgo${NC}"
rm -f addtrgo
sleep 1

echo -e "${RED}Remove deltrgo${NC}"
rm -f deltrgo
sleep 1

echo -e "${RED}Remove renewtrgo${NC}"
rm -f renewtrgo
sleep 1

echo -e "${RED}Remove cektrgo${NC}"
rm -f cektrgo
sleep 1

#remove banner
cd
rm -f /etc/issue.net

#Uninstall Neofecth
apt remove neofetch -y
apt remove boxes -y
sed -i "/neofecth/,/^},{/d" .profile
clear

echo -e "Uninstall Berhasil"
sleep 5

#reboot
reboot