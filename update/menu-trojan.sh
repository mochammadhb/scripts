#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ Trojan GFW & Trojan GO Section ]========-----\n     JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d mouse 
echo -e ""
echo -e "${yy} 1${wh}.  Create Trojan GFW Account (${bl}addtrojan${wh})"
echo -e "${yy} 2${wh}.  Deleting Trojan GFW Account (${bl}deltrojan${wh})"
echo -e "${yy} 3${wh}.  Extending Trojan GFW Account Active Life (${bl}renewtrojan${wh})"
echo -e "${yy} 4${wh}.  Check Detail Logs Login Trojan GFW Account (${bl}cektrojan${wh})"
echo -e ""
echo -e "${yy} 5${wh}.  Create Trojan GO Account (${bl}addtrgo${wh})"
echo -e "${yy} 6${wh}.  Deleting Trojan GO Account (${bl}deltrgo${wh})"
echo -e "${yy} 7${wh}.  Extending Trojan GO Account Active Live (${bl}renewtrgo${wh})"
echo -e "${yy} 8${wh}.  Check Detail Logs Login Trojan GO Account (${bl}cektrgo${wh})"
echo -e ""
echo -e "${yy} 9${wh}.  Create Trojan GRPC Account (${bl}addtrpc${wh})"
echo -e "${yy} 10${wh}. Deleting Trojan GRPC Account (${bl}deltrpc${wh})"
echo -e "${yy} 11${wh}. Extending Trojan GRPC Account Active Live (${bl}renewtrpc${wh})"
echo -e ""
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number [ 1-11 or x ] : " menu
case $menu in
1)
addtrojan
;;
2)
deltrojan
;;
3)
renewtrojan
;;
4)
cektrojan
;;
5)
addtrgo
;;
6)
deltrgo
;;
7)
renewtrgo
;;
8)
cektrgo
;;
9)
addtrpc
;;
10)
deltrpc
;;
11)
renewtrpc
;;
x)
menu
;;
esac
