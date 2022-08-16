#!/bin/bash
clear
chmod +x /proc/cpuinfo
m="\033[0;1;36m"
y="\033[0;32m"
red="\033[0;1;31m"
yl="\033[0;32m"
wh="\033[0m"
bl="\033[0;1;34m"
up1=$(uptime | awk '{print $4}')
up2=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
model=$(lscpu | grep -w "Model name" | cut -d: -f2|sed 's/ //g')
ram=$(cat /proc/meminfo | grep 'MemTotal' | uniq)
swp=$(cat /proc/meminfo | grep 'SwapTotal' | uniq)
RAM_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
RAM_MB=$(expr $RAM_KB / 1024)
now=$(date)
echo -e "-----========[ AutoScript Installer ]========-----\n    By JuraganSSH Autoscript - juraganssh.my.id\n---------------Server Information-----------------\n    CPU Model : $(lscpu | grep -w "Model name" | cut -d: -f2|sed 's/ //g')\n    Total Amount Of Ram: $(expr $(grep MemTotal /proc/meminfo | awk '{print $2}') / 1024)MB  SWAP: 0MB\n    Date: $(date)" | boxes -d diamonds -a hcvc
echo -e ""
echo -e "${red} 1${wh}. SSH & OpenVPN Section (${bl}menu-ssh${wh})"
echo -e "${red} 2${wh}. V2ray Vmess & Vless Section (${bl}menu-v2ray${wh})"
echo -e "${red} 3${wh}. Trojan & TrojanGO Section (${bl}menu-trojan${wh})"
echo -e "${red} 4${wh}. Shadowsocks & ShadowsocksR Section (${bl}menu-shadow${wh})"
echo -e "${red} 5${wh}. SSTP - L2TP - PPTP - Wireguard Section (${bl}menu-vpn${wh})"
echo -e "${red} 6${wh}. Bypass & Tunnels Section (${bl}menu-proxy${wh})"
echo -e "${red} 7${wh}. Backup Section (${bl}menu-backup${wh})"
echo -e "${red} 8${wh}. System Tools Section (${bl}menu-tools${wh})"
echo -e "${red} 9${wh}. Information (${bl}about${wh})"
echo -e "${red} x${wh}. Exit Main Menu (${bl}exit${wh})"
echo -e ""
read -p "Please Enter The Number [ 1-9 or x ] : " menu
case $menu in
1)
clear
menu-ssh
;;
2)
clear
menu-v2ray
;;
3)
clear
menu-trojan
;;
4)
clear
menu-shadow
;;
5)
clear
menu-vpn
;;
6)
clear
menu-proxy
;;
7)
clear
menu-backup
;;
8)
clear
menu-tools
;;
9)
clear
about
;;
x)
echo -e "GOODBYE!!!"
echo -e "JuraganSSH Store AutoScript"
echo -e ""
sleep 3
neofetch
checkstart
;;
*)
menu
;;
esac
