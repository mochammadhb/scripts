#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ Bypass & Tunneling Section ]========-----\n JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d dog 
echo -e ""
echo -e "${yy} 1${wh}.  Show Snell Proxy Account (${bl}showsnell${wh})"
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number or x to Back to Main Menu : " menu
case $menu in
1)
showsnell
;;
x)
menu
;;
esac
