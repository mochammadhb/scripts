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
echo -e "-----========[ Change Port Section ]========-----\n JuraganSSH Service AutoScript - juraganssh.my.id" | boxes -d dog
echo -e ""
echo -e "[1]. Change Port OpenVPN tunnel"
echo -e "[2]. Change Port Wireguard"
echo -e "[3]. Change Port V2Ray Core"
echo -e "[4]. Change Port Trojan GO"
echo -e "[5]. Change Port Squid"
echo -e "[6]. Change Port SSTP"
echo -e "[7]. Change Port SSH WS NON TLS"
echo -e "[8]. Change Port SSH WS TLS / SSL"
echo -e "[9]. Exit"
echo -e ""
read -p "Select From Options [ 1-8 or x ] : " port
echo -e ""
case $port in
1)
portovpn
;;
2)
portwg
;;
3)
portvlm
;;
4)
porttrojan
;;
5)
portsquid
;;
6)
portsstp
;;
7)
portsshnontls
;;
8)
portsshws
;;
9)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
