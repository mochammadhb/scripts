#!/usr/bin/env bash
# By HasanDancow
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
domain=$(cat /etc/xray/domain);
hostname="s/xxxxxxxxxxxxxxxxxxxxxxx/$domain/g";
hostname2="s/xxxxxxxxx/$domain/g";
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
# ==================================================
#function
checkSystem() {
	if [[ -n $(find /etc -name "redhat-release") ]] || grep </proc/version -q -i "centos"; then
		mkdir -p /etc/yum.repos.d

		if [[ -f "/etc/centos-release" ]]; then
			centosVersion=$(rpm -q centos-release | awk -F "[-]" '{print $3}' | awk -F "[.]" '{print $1}')

			if [[ -z "${centosVersion}" ]] && grep </etc/centos-release -q -i "release 8"; then
				centosVersion=8
			fi
		fi

		release="centos"
		installType='yum -y install'
		removeType='yum -y remove'
		upgrade="yum update -y --skip-broken"

	elif grep </etc/issue -q -i "debian" && [[ -f "/etc/issue" ]] || grep </etc/issue -q -i "debian" && [[ -f "/proc/version" ]]; then
		release="debian"
		installType='apt -y install'
		upgrade="apt update"
		updateReleaseInfoChange='apt-get --allow-releaseinfo-change update'
		removeType='apt -y autoremove'

	elif grep </etc/issue -q -i "ubuntu" && [[ -f "/etc/issue" ]] || grep </etc/issue -q -i "ubuntu" && [[ -f "/proc/version" ]]; then
		release="ubuntu"
		installType='apt -y install'
		upgrade="apt update"
		updateReleaseInfoChange='apt-get --allow-releaseinfo-change update'
		removeType='apt -y autoremove'
		if grep </etc/issue -q -i "16."; then
			release=
		fi
	fi

	if [[ -z ${release} ]]; then
		echoContent red "\n?????????,????????????\n"
		echoContent yellow "$(cat /etc/issue)"
		echoContent yellow "$(cat /proc/version)"
		exit 0
	fi
}

# Link Hosting Kalian
hasandnc="raw.githubusercontent.com/mochammadhb/scripts/main/ssh"

# Link Hosting Kalian Untuk Xray
hasandnc2="raw.githubusercontent.com/mochammadhb/scripts/main/xray"

# Link Hosting Kalian Untuk Trojan Go
hasandnc3="raw.githubusercontent.com/mochammadhb/scripts/main/trojango"

# Link Hosting Kalian Untuk Stunnel5
hasandnc4="raw.githubusercontent.com/mochammadhb/scripts/main/stunnel5"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=akbarstorevpn
organizationalunit=akbarstorevpn
commonname=akbarstorevpn
email=akbarssh21@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://${hasandnc}/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.

screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Install Requirements Tools
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
#apt install libssl1.0-dev -y
apt install dos2unix -y


# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile
echo "checkstart" >> .profile

# install webserver
#function
installNginxTools() {

	if [[ "${release}" == "debian" ]]; then
		sudo apt install apt-transport-https gnupg2 ca-certificates lsb-release -y 
		wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
		echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
		echo "deb http://nginx.org/packages/mainline/debian $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list 
		echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | sudo tee /etc/apt/preferences.d/99nginx 
		curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key >/dev/null 2>&1
		# gpg --dry-run --quiet --import --import-options import-show /tmp/nginx_signing.key
		sudo mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
		sudo apt update >/dev/null 2>&1

	elif [[ "${release}" == "ubuntu" ]]; then
		sudo apt install gnupg2 ca-certificates lsb-release -y 
		echo "deb http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list 
		echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | sudo tee /etc/apt/preferences.d/99nginx 
		curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key 
		# gpg --dry-run --quiet --import --import-options import-show /tmp/nginx_signing.key
		sudo mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
		add-apt-repository ppa:ondrej/php -y
		sudo apt update >/dev/null 2>&1
	fi
	${installType} nginx 
	systemctl daemon-reload
	systemctl enable nginx
}

clear
echo "installing Nginx Webserver.."
sleep 3
checkSystem
installNginxTools
sudo apt-get -y install php7.2 php7.2-mysql php7.2-fpm php7.2-curl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
rm -f /etc/nginx/conf.d/default.conf
curl https://${hasandnc}/nginx.conf > /etc/nginx/nginx.conf
curl https://${hasandnc}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i $hostname /etc/nginx/nginx.conf;
sed -i $hostname2 /etc/nginx/nginx.conf;
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://${hasandnc}/index.html1"
/etc/init.d/nginx restart
cd

# install badvpn
clear
echo "installing badvpn-udpgw64.."
sleep 3
cd
wget -O /usr/bin/badvpn-udpgw "https://${hasandnc}/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://${hasandnc}/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# Install SSLH
apt -y install sslh
rm -f /etc/default/sslh

# Settings SSLH
cat > /etc/default/sslh <<-END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:8880 --pidfile /var/run/sslh/sslh.pid -n"

END

# Restart Service SSLH
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh restart

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel 5 
cd /root/
wget -q -O stunnel5.zip "https://${hasandnc4}/stunnel5.zip"
unzip -o stunnel5.zip
cd /root/stunnel
chmod +x configure
./configure
make
make install
cd /root
rm -r -f stunnel
rm -f stunnel5.zip
mkdir -p /etc/stunnel5
chmod 644 /etc/stunnel5

# Download Config Stunnel5
cat > /etc/stunnel5/stunnel5.conf <<-END
cert = /etc/xray/xray.crt
key = /etc/xray/xray.key
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 445
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:443

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# make a certificate
#openssl genrsa -out key.pem 2048
#openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
#-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
#cat key.pem cert.pem >> /etc/stunnel5/stunnel5.pem

# Service Stunnel5 systemctl restart stunnel5
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://stunnel.org
Documentation=https://github.com/mochammadhb
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/bin/stunnel5 /etc/stunnel5/stunnel5.conf
Type=forking

[Install]
WantedBy=multi-user.target
END

# Service Stunnel5 /etc/init.d/stunnel5
wget -q -O /etc/init.d/stunnel5 "https://${hasandnc4}/stunnel5.init"

# Ubah Izin Akses
chmod 600 /etc/stunnel5/stunnel5.pem
chmod +x /etc/init.d/stunnel5
cp /usr/local/bin/stunnel /usr/local/bin/stunnel5

# Remove File
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
#rm -f /usr/local/bin/stunnel5

# Restart Stunnel 5
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart

#OpenVPN
wget https://${hasandnc}/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# Install BBR
wget https://${hasandnc}/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# Ganti Banner
wget -O /etc/issue.net "https://${hasandnc}/issue.net"

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

#Install Snell Proxy
wget https://github.com/surge-networks/snell/releases/download/v3.0.1/snell-server-v3.0.1-linux-amd64.zip && unzip snell-server-v3.0.1-linux-amd64.zip && mv snell-server /usr/local/bin/
rm -f snell-server-v3.0.1-linux-amd64.zip
touch /etc/systemd/system/snell.service

# Create An File "snell.service" in "/etc/systemd/system/"
cat > /etc/systemd/system/snell.service <<-END
[Unit]
Description=Snell Proxy Service
After=network.target

[Service]
Type=simple
LimitNOFILE=infinity
ExecStart=/usr/local/bin/snell-server -c /etc/snell-server.conf
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=snell-server

[Install]
WantedBy=multi-user.target
END

#Add Directory
mkdir -p /etc/snell/
touch /etc/snell/snell-server.conf

#Generate Password Snell
psksnell=$(openssl rand -base64 32)

# Create An File "snell-server.conf" in "/etc/snell/"
cat > /etc/snell/snell-server.conf <<EOF
[snell-server]
listen = 0.0.0.0:2078	
psk = $psksnell	
obfs = tls		
EOF

#Restart Snell
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2078 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2078 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload
systemctl start snell.service
systemctl enable snell.service

# download script
cd /usr/bin
echo  -e "${GREEN}Please wait for install main menu. . .${NC}"
wget -O addhost "https://${hasandnc}/addhost.sh" >/dev/null 2>&1
wget -O about "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/about.sh" >/dev/null 2>&1
wget -O menu "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu.sh" >/dev/null 2>&1
wget -O menu-proxy "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-proxy.sh" >/dev/null 2>&1
wget -O addssh "https://${hasandnc}/addssh.sh" >/dev/null 2>&1
wget -O trialssh "https://${hasandnc}/trialssh.sh" >/dev/null 2>&1
wget -O showsnell "https://${hasandnc}/showsnell.sh" >/dev/null 2>&1
wget -O delssh "https://${hasandnc}/delssh.sh" >/dev/null 2>&1
wget -O member "https://${hasandnc}/member.sh" >/dev/null 2>&1
wget -O delexp "https://${hasandnc}/delexp.sh" >/dev/null 2>&1
wget -O cekssh "https://${hasandnc}/cekssh.sh" >/dev/null 2>&1
wget -O restart "https://${hasandnc}/restart.sh" >/dev/null 2>&1
wget -O speedtest "https://${hasandnc}/speedtest_cli.py" >/dev/null 2>&1
wget -O info "https://${hasandnc}/info.sh" >/dev/null 2>&1
wget -O ram "https://${hasandnc}/ram.sh" >/dev/null 2>&1
wget -O renewssh "https://${hasandnc}/renewssh.sh" >/dev/null 2>&1
wget -O autokill "https://${hasandnc}/autokill.sh" >/dev/null 2>&1
wget -O ceklim "https://${hasandnc}/ceklim.sh" >/dev/null 2>&1
wget -O tendang "https://${hasandnc}/tendang.sh" >/dev/null 2>&1
wget -O clearlog "https://${hasandnc}/clearlog.sh" >/dev/null 2>&1
wget -O changeport "https://${hasandnc}/changeport.sh" >/dev/null 2>&1
wget -O portovpn "https://${hasandnc}/portovpn.sh" >/dev/null 2>&1
wget -O portwg "https://${hasandnc}/portwg.sh" >/dev/null 2>&1
wget -O porttrojan "https://${hasandnc}/porttrojan.sh" >/dev/null 2>&1
wget -O portsstp "https://${hasandnc}/portsstp.sh" >/dev/null 2>&1
wget -O portsquid "https://${hasandnc}/portsquid.sh" >/dev/null 2>&1
wget -O portvlm "https://${hasandnc}/portvlm.sh" >/dev/null 2>&1
wget -O wbmn "https://${hasandnc}/webmin.sh" >/dev/null 2>&1
wget -O xp "https://${hasandnc}/xp.sh" >/dev/null 2>&1
wget -O swapkvm "https://${hasandnc}/swapkvm.sh" >/dev/null 2>&1
wget -O addvmess "https://${hasandnc2}/addv2ray.sh" >/dev/null 2>&1
wget -O addvless "https://${hasandnc2}/addvless.sh" >/dev/null 2>&1
wget -O addtrojan "https://${hasandnc2}/addtrojan.sh" >/dev/null 2>&1
wget -O delvmess "https://${hasandnc2}/delv2ray.sh" >/dev/null 2>&1
wget -O delvless "https://${hasandnc2}/delvless.sh" >/dev/null 2>&1
wget -O deltrojan "https://${hasandnc2}/deltrojan.sh" >/dev/null 2>&1
wget -O cekvmess "https://${hasandnc2}/cekv2ray.sh" >/dev/null 2>&1
wget -O cekvless "https://${hasandnc2}/cekvless.sh" >/dev/null 2>&1
wget -O cektrojan "https://${hasandnc2}/cektrojan.sh" >/dev/null 2>&1
wget -O renewvmess "https://${hasandnc2}/renewv2ray.sh" >/dev/null 2>&1
wget -O renewvless "https://${hasandnc2}/renewvless.sh" >/dev/null 2>&1
wget -O renewtrojan "https://${hasandnc2}/renewtrojan.sh" >/dev/null 2>&1
wget -O certv2ray "https://${hasandnc2}/certv2ray.sh" >/dev/null 2>&1
wget -O addtrgo "https://${hasandnc3}/addtrgo.sh" >/dev/null 2>&1
wget -O deltrgo "https://${hasandnc3}/deltrgo.sh" >/dev/null 2>&1
wget -O renewtrgo "https://${hasandnc3}/renewtrgo.sh" >/dev/null 2>&1
wget -O cektrgo "https://${hasandnc3}/cektrgo.sh" >/dev/null 2>&1
wget -O portsshnontls "https://raw.githubusercontent.com/mochammadhb/scripts/main/websocket/portsshnontls.sh" >/dev/null 2>&1
wget -O portsshws "https://raw.githubusercontent.com/mochammadhb/scripts/main/websocket/portsshws.sh" >/dev/null 2>&1
wget -O menu-ssh "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-ssh.sh" >/dev/null 2>&1
wget -O menu-v2ray "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-v2ray.sh" >/dev/null 2>&1
wget -O menu-trojan "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-trojan.sh" >/dev/null 2>&1
wget -O menu-shadow "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-shadow.sh" >/dev/null 2>&1
wget -O menu-vpn "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-vpn.sh" >/dev/null 2>&1
wget -O menu-backup "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-backup.sh" >/dev/null 2>&1
wget -O menu-tools "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/menu-tools.sh" >/dev/null 2>&1
wget -O checkstart "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/checkstart.sh" >/dev/null 2>&1
wget -O notes "https://raw.githubusercontent.com/mochammadhb/scripts/main/update/notes.sh" >/dev/null 2>&1
wget -O addssrpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/addssrpc.sh" >/dev/null 2>&1
wget -O addssws "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/addssws.sh" >/dev/null 2>&1
wget -O addtrpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/addtrpc.sh" >/dev/null 2>&1
wget -O addvlpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/addvlpc.sh" >/dev/null 2>&1
wget -O addvmpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/addvmpc.sh" >/dev/null 2>&1
wget -O delssrpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/delssrpc.sh" >/dev/null 2>&1
wget -O delssws "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/delssws.sh" >/dev/null 2>&1
wget -O deltrpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/deltrpc.sh" >/dev/null 2>&1
wget -O delvlpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/delvlpc.sh" >/dev/null 2>&1
wget -O delvmpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/delvmpc.sh" >/dev/null 2>&1
wget -O renewssrpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/renewssrpc.sh" >/dev/null 2>&1
wget -O renewssws "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/renewssws.sh" >/dev/null 2>&1
wget -O renewtrpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/renewtrpc.sh" >/dev/null 2>&1
wget -O renewvlpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/renewvlpc.sh" >/dev/null 2>&1
wget -O renewvmpc "https://raw.githubusercontent.com/mochammadhb/scripts/main/xray-update/renewvmpc.sh" >/dev/null 2>&1


chmod +x portsshnontls
chmod +x portsshws
chmod +x menu-ssh
chmod +x notes
chmod +x menu-proxy
chmod +x menu-v2ray
chmod +x showsnell
chmod +x menu-trojan
chmod +x menu-shadow
chmod +x menu-vpn
chmod +x menu-backup
chmod +x menu-tools
chmod +x checkstart

chmod +x addhost
chmod +x menu
chmod +x addssh
chmod +x trialssh
chmod +x delssh
chmod +x member
chmod +x delexp
chmod +x cekssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renewssh
chmod +x clearlog
chmod +x changeport
chmod +x portovpn
chmod +x portwg
chmod +x porttrojan
chmod +x portsstp
chmod +x portsquid
chmod +x portvlm
chmod +x wbmn
chmod +x xp
chmod +x swapkvm
chmod +x addvmess
chmod +x addvless
chmod +x addtrojan
chmod +x delvmess
chmod +x delvless
chmod +x deltrojan
chmod +x cekvmess
chmod +x cekvless
chmod +x cektrojan
chmod +x renewvmess
chmod +x renewvless
chmod +x renewtrojan
chmod +x certv2ray
chmod +x addtrgo
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo
chmod +x addssrpc
chmod +x addssws
chmod +x addtrpc 
chmod +x addvlpc 
chmod +x addvmpc 
chmod +x delssrpc 
chmod +x delssws 
chmod +x deltrpc
chmod +x delvlpc 
chmod +x delvmpc
chmod +x renewssrpc
chmod +x renewssws
chmod +x renewtrpc
chmod +x renewvlpc
chmod +x renewvmpc

echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "@reboot root pkill python && systemctl restart sslh && systemctl restart ws-tls && systemctl restart ws-nontls && systemctl restart cron" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
/etc/init.d/squid restart
pkill python && systemctl restart sslh && systemctl restart ws-tls && systemctl restart ws-nontls && systemctl restart cron
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
