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
# Link Hosting Kalian
hasandnc="raw.githubusercontent.com/mochammadhb/scripts/main/sstp"

MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
OS=$ID
ver=$VERSION_ID
if [[ $OS == 'ubuntu' ]]; then
if [[ "$ver" = "18.04" ]]; then
yoi=Ubuntu18
elif [[ "$ver" = "20.04" ]]; then
yoi=Ubuntu20
fi
elif [[ $OS == 'debian' ]]; then
if [[ "$ver" = "9" ]]; then
yoi=Debian9
elif [[ "$ver" = "10" ]]; then
yoi=Debian10
fi
fi
mkdir /home/sstp
touch /home/sstp/sstp_account
touch /var/lib/hasandancow/data-user-sstp
#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=akbarstorevpn
organizationalunit=akbarstorevpn
commonname=akbarstorevpn
email=akbarssh21@gmail.com

#install sstp
apt-get install -y build-essential cmake gcc linux-headers-`uname -r` git libpcre3-dev libssl-dev liblua5.1-0-dev ppp
git clone https://github.com/accel-ppp/accel-ppp.git /opt/accel-ppp-code
mkdir /opt/accel-ppp-code/build
cd /opt/accel-ppp-code/build/
cmake -DBUILD_IPOE_DRIVER=TRUE -DBUILD_VLAN_MON_DRIVER=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DKDIR=/usr/src/linux-headers-`uname -r` -DLUA=TRUE -DCPACK_TYPE=$yoi ..
make
cpack -G DEB
dpkg -i accel-ppp.deb
mv /etc/accel-ppp.conf.dist /etc/accel-ppp.conf
wget -O /etc/accel-ppp.conf "https://${hasandnc}/accel.conf"
sed -i $MYIP2 /etc/accel-ppp.conf
chmod +x /etc/accel-ppp.conf
systemctl start accel-ppp
systemctl enable accel-ppp
#gen cert sstp
cd /home/sstp
openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
openssl genrsa -out server.key 4096
openssl req -new -key server.key -out ia.csr \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
openssl x509 -req -days 3650 -in ia.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
cp /home/sstp/server.crt /home/vps/public_html/server.crt
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 444 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 444 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
#input perintah sstp
wget -O /usr/bin/addsstp https://${hasandnc}/addsstp.sh && chmod +x /usr/bin/addsstp
wget -O /usr/bin/delsstp https://${hasandnc}/delsstp.sh && chmod +x /usr/bin/delsstp
wget -O /usr/bin/ceksstp https://${hasandnc}/ceksstp.sh && chmod +x /usr/bin/ceksstp
wget -O /usr/bin/renewsstp https://${hasandnc}/renewsstp.sh && chmod +x /usr/bin/renewsstp
rm -f /root/sstp.sh
