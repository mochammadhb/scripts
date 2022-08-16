#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;31m"
yl="\033[0;1;33m"
bl="\033[0;1;34m"
wh="\033[0m"
echo -e "-----========[ Shadowsocks & ShadowsocksR Section ]========-----\n         JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d girl 
echo -e ""
echo -e "${yy} 1${wh}.  Create Shadowsocks OBFS (SS) Account (${bl}addss${wh})"
echo -e "${yy} 2${wh}.  Deleting Shadowsocks OBFS (SS) Account (${bl}delss${wh})"
echo -e "${yy} 3${wh}.  Extending Shadowsocks OBFS (SS) Account Active Life (${bl}renewss${wh})"
echo -e "${yy} 4${wh}.  Check Detail Logs Login Shadowsocks OBFS (SS) Account (${bl}cekss${wh})"
echo -e ""
echo -e "${yy} 5${wh}.  Create Shadowsocks WS (SS) Account (${bl}addssws${wh})"
echo -e "${yy} 6${wh}.  Deleting Shadowsocks WS (SS) Account (${bl}delssws${wh})"
echo -e "${yy} 7${wh}.  Extending Shadowsocks WS (SS) Account Active Life (${bl}renewssws${wh})"
echo -e ""
echo -e "${yy} 8${wh}.  Create Shadowsocks GRPC (SS) Account (${bl}addssrpc${wh})"
echo -e "${yy} 9${wh}.  Deleting Shadowsocks GRPC (SS) Account (${bl}delssrpc${wh})"
echo -e "${yy} 11${wh}. Extending Shadowsocks GRPC (SS) Account Active Life (${bl}renewssrpc${wh})"
echo -e ""
echo -e "${yy} 11${wh}. Create ShadowsocksR (SSR) Account (${bl}addssr${wh})"
echo -e "${yy} 12${wh}. Deleting ShadowsocksR (SSR) Account (${bl}delssr${wh})"
echo -e "${yy} 13${wh}. Extending ShadowsocksR (SSR) Account Active Live (${bl}renewssr${wh})"
echo -e "${yy} 14${wh}. Show Other ShadowsocksR (SSR) Menu (${bl}ssr${wh})"
echo -e ""
echo -e "${yy} x${wh}.  Back To Main Menu (${bl}menu${wh})"
echo -e ""
read -p "Please Enter Number [ 1-14 or x ] : " menu
case $menu in
1)
addss
;;
2)
delss
;;
3)
renewss
;;
4)
cekss
;;
5)
addssws
;;
6)
delssws
;;
7)
renewssws
;;
8)
addssrpc
;;
9)
delssrpc
;;
10)
renewssrpc
;;
11)
addssr
;;
12)
delssr
;;
13)
renewssr
;;
14)
ssr
;;
x)
menu
;;
esac
