#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ Other Type Of VPN Section ]========-----\n    JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d peek -a hcvc 
echo -e ""
echo -e "${yy} 1${wh}.  Create L2TP VPN Account (${bl}addl2tp${wh})"
echo -e "${yy} 2${wh}.  Deleting L2TP VPN Account (${bl}dell2tp${wh})"
echo -e "${yy} 3${wh}.  Extending L2TP VPN Active Life (${bl}renewl2tp${wh})"
echo -e "${yy} 4${wh}.  Create PPTP VPN Account (${bl}addpptp${wh})"
echo -e "${yy} 5${wh}.  Deleting PPTP VPN Account (${bl}delpptp${wh})"
echo -e "${yy} 6${wh}.  Extending PPTP VPN Active Life (${bl}renewpptp${wh})"
echo -e "${yy} 7${wh}.  Create SSTP VPN Account (${bl}addsstp${wh})"
echo -e "${yy} 8${wh}.  Deleting SSTP VPN Account (${bl}delsstp${wh})"
echo -e "${yy} 9${wh}.  Extending SSTP VPN Active Life (${bl}renewsstp${wh})"
echo -e "${yy} 10${wh}.  Check Detail Logs Login SSTP VPN Account(${bl}ceksstp${wh})"
echo -e "${yy} 11${wh}.  Create Wireguard Account (${bl}addwg${wh})"
echo -e "${yy} 12${wh}.  Deleting Wireguard Account (${bl}delwg${wh})"
echo -e "${yy} 13${wh}.  Extending Wireguard Active Life (${bl}renewwg${wh})"
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number [ 1-13 or x ] : " menu
case $menu in
1)
addl2tp
;;
2)
dell2tp
;;
3)
renewl2tp
;;
4)
addpptp
;;
5)
delpptp
;;
6)
renewpptp
;;
7)
addsstp
;;
8)
delsstp
;;
9)
renewsstp
;;
10)
ceksstp
;;
11)
addwg
;;
12)
delwg
;;
13)
renewwg
;;
x)
menu
;;
esac
