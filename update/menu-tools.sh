#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ System Tools Section ]========-----\n JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d santa 
echo -e ""
echo -e "${yy} 1${wh}.  Add Or Change Subdomain Host For VPS (${bl}addhost${wh})"
echo -e "${yy} 2${wh}.  Renew Certificate V2ray, Trojan & Trojan GO Services (${bl}certv2ray${wh})"
echo -e "${yy} 3${wh}.  Change Port Of Some Service (${bl}changeport${wh})"
echo -e "${yy} 4${wh}.  Limit Bandwith Speed Server (${bl}limitspeed${wh})"
echo -e "${yy} 5${wh}.  Speedtest Tools by Ookla (${bl}speedtest${wh})"
echo -e "${yy} 6${wh}.  Check Usage of VPS Ram (${bl}ram${wh})"
echo -e "${yy} 7${wh}.  Change Banner/Motd SSH/Dropbear at login (${bl}issue.net${wh})"
echo -e "${yy} 8${wh}.  Displaying System Information (${bl}info${wh})"
echo -e "${yy} 9${wh}.  Update Auto Install Scripts (${bl}update${wh})"
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number [ 1-9 or x ] : " menu
case $menu in
1)
addhost
;;
2)
certv2ray
;;
3)
changeport
;;
4)
limitspeed
;;
5)
speedtest
;;
6)
ram
;;
7)
nano /etc/issue.net
;;
8)
info
;;
9)
wget -O /usr/bin/aupdate https://raw.githubusercontent.com/mochammadhb/scripts/main/update/aupdate.sh && chmod +x aupdate && aupdate >/dev/null 2>&1
;;
x)
menu
;;
esac
