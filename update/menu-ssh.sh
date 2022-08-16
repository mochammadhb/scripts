#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ SSH & OpenVPN Section ]========-----\n JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d dog 
echo -e ""
echo -e "${yy} 1${wh}.  Create SSH & OpenVPN Account (${bl}addssh${wh})"
echo -e "${yy} 2${wh}.  Generate SSH & OpenVPN Trial Account (${bl}trialssh${wh})"
echo -e "${yy} 3${wh}.  Extending SSH & OpenVPN Account Active Life (${bl}renewssh${wh})"
echo -e "${yy} 4${wh}.  Delete SSH & OpenVpn Account (${bl}delssh${wh})"
echo -e "${yy} 5${wh}.  Check User Login SSH & OpenVPN (${bl}cekssh${wh})"
echo -e "${yy} 6${wh}.  Clean User Expired SSH & OpenVPN (${bl}delexp${wh})"
echo -e "${yy} 7${wh}.  Display User Lists (${bl}member${wh})"
echo -e "${yy} 8${wh}.  Displays Users Who Do Multi Login SSH (${bl}ceklim${wh})"
echo -e "${yy} 9${wh}.  Set SSH Multi Login Limit (${bl}autokill${wh})"
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number [ 1-9 or x ] : " menu
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
delssh
;;
5)
cekssh
;;
6)
delexp
;;
7)
member
;;
8)
ceklim
;;
9)
autokill
;;
x)
menu
;;
esac
