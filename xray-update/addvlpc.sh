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
get=$(curl -s -X GET https://checkip.amazonaws.com);
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vless GRPC" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username \033[0;31m${CLIENT_EXISTS}\033[0m Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-grpc$/a\####### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
config="vless://${uuid}@${domain}:${tls}?encryption=none&security=tls&type=grpc&host=${domain}&path=xray-vless-grpc&serviceName=xray-vless-grpc&alpn=h2&sni=${domain}\n"
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "======-XRAYS/VLESS GRPC-======"
echo -e "Remarks     : ${user}"
echo -e "Protocol    : vless"
echo -e "IP/Host     : ${get}"
echo -e "Address     : ${domain}"
echo -e "Port        : ${tls}"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Security    : auto"
echo -e "Network     : grpc"
echo -e "ServiceName : xray-vless-grpc"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "==============================="
echo -e "Link TLS    : ${config}"
echo -e "==============================="