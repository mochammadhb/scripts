#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ Backup & Restore Section ]========-----\n   JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d ian_jones -a hcvc 
echo -e ""
echo -e "${yy} 1${wh}.  Autobackup Data Autoscript on VPS (${bl}autobackup${wh})"
echo -e "${yy} 2${wh}.  Manual Backup Data Autoscript on VPS (${bl}backup${wh})"
echo -e "${yy} 3${wh}.  Restore Data Autoscript on VPS (${bl}restore${wh})"
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number [ 1-3 or x ] : " menu
case $menu in
1)
autobackup
;;
2)
backup
;;
3)
restore
;;
x)
menu
;;
esac
