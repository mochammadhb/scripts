#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ V2Ray Vmess & Vless Section ]========-----\n    JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d cat 
echo -e ""
echo -e "${yy} 1${wh}.  Create V2RAY Vmess Websocket Account (${bl}addvmess${wh})"
echo -e "${yy} 2${wh}.  Deleting V2RAY Vmess Account (${bl}delvmess${wh})"
echo -e "${yy} 3${wh}.  Extending Vmess Account Active Life (${bl}renewvmess${wh})"
echo -e "${yy} 4${wh}.  Check Detail Logs Login V2RAY Vmess Account (${bl}cekvmess${wh})"
echo -e ""
echo -e "${yy} 5${wh}.  Create V2RAY Vless Websocket Account (${bl}addvless${wh})"
echo -e "${yy} 6${wh}.  Deleting V2RAY Vless Account (${bl}delvless${wh})"
echo -e "${yy} 7${wh}.  Extending Vless Account Active Live (${bl}renewvless${wh})"
echo -e "${yy} 8${wh}.  Check Detail Logs Login V2RAY Vless Account (${bl}cekvless${wh})"
echo -e ""
echo -e "${yy} 9${wh}.  Create V2RAY Vmess GRPC Account (${bl}addvmpc${wh})"
echo -e "${yy} 10${wh}. Deleting V2RAY Vmess GRPC Account (${bl}delvmpc${wh})"
echo -e "${yy} 11${wh}. Extending Vmess GRPC Account Active Live (${bl}renewvmpc${wh})"
echo -e ""
echo -e "${yy} 12${wh}. Create V2RAY Vless GRPC Account (${bl}addvlpc${wh})"
echo -e "${yy} 13${wh}. Deleting V2RAY Vless GRPC Account (${bl}delvlpc${wh})"
echo -e "${yy} 14${wh}. Extending Vless GRPC Account Active Live (${bl}renewvlpc${wh})"
echo -e ""
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter The Number [ 1-14 or x ] : " menu
case $menu in
1)
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
5)
addvless
;;
6)
delvless
;;
7)
renewvless
;;
8)
cekvless
;;
9)
addvmpc
;;
10)
delvmpc
;;
11)
renewvmpc
;;
12)
addvlpc
;;
13)
delvlpc
;;
14)
renewvlpc
;;
x)
menu
;;
esac
