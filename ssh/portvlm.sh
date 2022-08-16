#!/bin/bash
# My Telegram : https://t.me/mochammadhb
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(curl -s -X GET https://checkip.amazonaws.com);
echo "Checking VPS"
IZIN=$( curl http://miss.my.id:3009/api/v1/users | grep -o "$MYIP" );
if [ $MYIP = $IZIN >/dev/null 2>&1 ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}WhatsApp : 082233341225"
echo -e "${NC}${LIGHT}Telegram : https://t.me/mochammadhb"
exit 0
fi
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "[1]. Change Port V2Ray TLS ($tls)"
echo -e "[2]. Change Port V2Ray None TLS ($none)"
echo -e "[3]. Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "Select From Options [ 1-3 ] : " prot
echo -e ""
case $prot in
1)
read -p "New Port Vmess TLS : " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/xray/config.json

iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
sed -i "s/   - XRAYS Vmess TLS         : $tls/   - XRAYS Vmess TLS         : $tls1/g" /root/log-install.txt
sed -i "s/   - XRAYS Vless TLS         : $tls/   - XRAYS Vless TLS         : $tls1/g" /root/log-install.txt
sed -i "s/   - XRAYS Trojan GFW        : $tls/   - XRAYS Trojan GFW        : $tls1/g" /root/log-install.txt
sed -i "s/   - XRAYS Vmess GRPC        : $tls/   - XRAYS Vmess GRPC        : $tls1/g" /root/log-install.txt
sed -i "s/   - XRAYS Vless GRPC        : $tls/   - XRAYS Vless GRPC        : $tls1/g" /root/log-install.txt
sed -i "s/   - XRAYS Trojan GRPC       : $tls/   - XRAYS Trojan GRPC       : $tls1/g" /root/log-install.txt
sed -i "s/   - SS-XRAY WS              : $tls/   - SS-XRAY WS              : $tls1/g" /root/log-install.txt
sed -i "s/   - SS-XRAY GRPC            : $tls/   - SS-XRAY GRPC            : $tls1/g" /root/log-install.txt
echo -e "\e[032;1mPort $tls1 modified successfully\e[0m"
else
echo "Port $tls1 is used"
fi
;;
2)
echo "Input Only 2 Character (ex : 80)"
read -p "New Port Vmess None TLS : " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/xray/config.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
sed -i "s/   - XRAYS Vmess None TLS    : $none/   - XRAYS Vmess None TLS    : $none1/g" /root/log-install.txt
sed -i "s/   - XRAYS Vless None TLS    : $none/   - XRAYS Vless None TLS    : $none1/g" /root/log-install.txt
echo -e "\e[032;1mPort $none1 modified successfully\e[0m"
else
echo "Port $none1 is used"
fi
;;
3)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac
