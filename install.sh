#!/bin/bash
echo -e "checking ROOT privilege..."
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
sleep 3
echo -e "checking OPENVZ is Supporting..."
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
sleep 3
# My Telegram : https://t.me/mochammadhb
# ==========================================
# Color
RED='\033[0;1;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
bl='\033[0;1;34m'
# ==========================================
echo -e "Detecting Operating System is `lsb_release -i | awk '{print $3}'` ..."
sleep 3
#Instal Pesan Box
apt-get install ruby -y
apt install boxes

#Pesan VPS
clear
echo -e "-----========[ AutoScript Installer ]========-----\n    By Onetunnel Autoscript - onetunnel.id\n---------------Server Information-----------------\n    CPU Model : $(lscpu | grep -w "Model name" | cut -d: -f2|sed 's/ //g')\n    Total Amount Of Ram: $(expr $(grep MemTotal /proc/meminfo | awk '{print $2}') / 1024)MB  SWAP: 0MB\n    Date: $(date)" | boxes -d diamonds -a hcvc
echo -e ""
echo -e "${RED} 1${NC}. Autoscript Installation From Onetunnel Panel"
echo -e "${RED} 2${NC}. Use Autoscript Installation With Trial Mode"
echo -e "${RED} x${NC}. Exit Installation (${bl}exit${NC})"
echo -e ""
read -p "Please Enter The Number [1-2 or x ] : " menu
case $menu in
1)
clear
MYIP=$(curl -s -X GET https://checkip.amazonaws.com);
echo "Checking VPS"
IZIN=$( curl http://miss.my.id:3009/api/v1/users | grep -o "$MYIP" );
if [ $MYIP = $IZIN >/dev/null 2>&1 ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
sleep 1
clear
rm -f install.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
# Link Hosting Kalian Untuk Ssh Vpn
hasandnc="raw.githubusercontent.com/mochammadhb/scripts/main/ssh"
# Link Hosting Kalian Untuk Sstp
hasandnc2="raw.githubusercontent.com/mochammadhb/scripts/main/sstp"
# Link Hosting Kalian Untuk Ssr
hasandnc3="raw.githubusercontent.com/mochammadhb/scripts/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
hasandnc4="raw.githubusercontent.com/mochammadhb/scripts/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
hasandnc5="raw.githubusercontent.com/mochammadhb/scripts/main/wireguard"
# Link Hosting Kalian Untuk Xray
hasandnc6="raw.githubusercontent.com/mochammadhb/scripts/main/xray"
# Link Hosting Kalian Untuk Ipsec
hasandnc7="raw.githubusercontent.com/mochammadhb/scripts/main/ipsec"
# Link Hosting Kalian Untuk Backup
hasandnc8="raw.githubusercontent.com/mochammadhb/scripts/main/backup"
# Link Hosting Kalian Untuk Websocket
hasandnc9="raw.githubusercontent.com/mochammadhb/scripts/main/websocket"
# Link Hosting Kalian Untuk Ohp
hasandnc10="raw.githubusercontent.com/mochammadhb/scripts/main/ohp"

mkdir /var/lib/hasandancow;
echo "IP=" >> /var/lib/hasandancow/ipvps.conf
wget https://${hasandnc}/cf.sh && chmod +x cf.sh && ./cf.sh
#install v2ray
wget https://${hasandnc6}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
wget https://${hasandnc}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://${hasandnc2}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://${hasandnc3}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://${hasandnc4}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://${hasandnc5}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install L2TP
wget https://${hasandnc7}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://${hasandnc8}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
wget https://${hasandnc9}/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
wget https://${hasandnc10}/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/mochammadhb

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${hasandnc}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo "."
echo "Installation has been completed!!"
echo "================  Script Create By HasanDancow (Onetunnel)  ================" | tee -a ~/log-install.txt
echo "   >>> Service & Port"  | tee -a ~/log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a ~/log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a ~/log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a ~/log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a ~/log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a ~/log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a ~/log-install.txt
echo "   - Nginx                   : 89"  | tee -a ~/log-install.txt
echo "   - Wireguard               : 7070"  | tee -a ~/log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a ~/log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a ~/log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a ~/log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a ~/log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a ~/log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a ~/log-install.txt
echo "   - SS-XRAY GRPC            : 8443"  | tee -a ~/log-install.txt
echo "   - SS-XRAY WS              : 8443"  | tee -a ~/log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a ~/log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a ~/log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a ~/log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a ~/log-install.txt
echo "   - XRAYS Trojan GFW        : 8443"  | tee -a ~/log-install.txt
echo "   - XRAYS Vmess GRPC        : 8443"  | tee -a ~/log-install.txt
echo "   - XRAYS Vless GRPC        : 8443"  | tee -a ~/log-install.txt
echo "   - XRAYS Trojan GRPC       : 8443"  | tee -a ~/log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a ~/log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a ~/log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a ~/log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a ~/log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a ~/log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a ~/log-install.txt
echo "   - Trojan Go               : 2087"  | tee -a ~/log-install.txt
echo "   - Snell Service           : 2078"  | tee -a ~/log-install.txt
echo "===============================================================================" | tee -a ~/log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a ~/log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a ~/log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a ~/log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a ~/log-install.txt
echo "   - IPtables                : [ON]"  | tee -a ~/log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a ~/log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a ~/log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a ~/log-install.txt
echo "   - Autobackup Data" | tee -a ~/log-install.txt
echo "   - Restore Data" | tee -a ~/log-install.txt
echo "   - Auto Delete Expired Account" | tee -a ~/log-install.txt
echo "   - Full Orders For Various Services" | tee -a ~/log-install.txt
echo "   - White Label" | tee -a ~/log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a ~/log-install.txt
echo "===============================================================================" | tee -a ~/log-install.txt
echo " Reboot 15 Sec"
sleep 15
rm -f ~/install.sh >/dev/null 2>&1
reboot
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}WhatsApp : 082233341225"
echo -e "${NC}${LIGHT}Telegram : https://t.me/mochammadhb"
sleep 5
exit 0
fi
;;
2)
echo -e "Trial is cooming soon ;)"
exit 0
;;
x)
echo -e "GOODBYE!!!"
echo -e "Onetunnel Store AutoScript"
echo -e ""
sleep 3
rm /root/install.sh
exit 0
;;
esac