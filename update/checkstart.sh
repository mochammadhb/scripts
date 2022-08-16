#!/bin/bash
wh="\033[0m"
red="\033[0;1;31m"
gr="\033[0;32m"
snell=$(systemctl is-active --quiet snell && echo "Snell Proxy Service ${gr}is running${wh}" || echo "Snell Proxy Service ${red}is NOT running${wh}")
dp=$(systemctl is-active --quiet dropbear && echo "DropBear Service ${gr}is running${wh}" || echo "DropBear Service ${red}is NOT running${wh}")
ssh=$(systemctl is-active --quiet ssh && echo "OpenSSH Service ${gr}is running${wh}" || echo "OpenSSH Service ${red}is NOT running${wh}")
stn=$(systemctl is-active --quiet stunnel5 && echo "Stunnel Service ${gr}is running${wh}" || echo "Stunnel Service ${red}is NOT running${wh}")
ovpn1=$(systemctl is-active --quiet openvpn && echo "OpenVPN TCP Service ${gr}is running${wh}" || echo "OpenVPN TCP Service ${red}is NOT running${wh}")
ovpn2=$(systemctl is-active --quiet openvpn && echo "OpenVPN UDP Service ${gr}is running${wh}" || echo "OpenVPN UDP Service ${red}is NOT running${wh}")
sqd=$(systemctl is-active --quiet squid && echo "Squid Service ${gr}is running${wh}" || echo "Squid Service ${red}is NOT running${wh}")
ngx=$(systemctl is-active --quiet nginx && echo "Nginx Service ${gr}is running${wh}" || echo "Nginx Service ${red}is NOT running${wh}")
wstls=$(systemctl is-active --quiet ws-tls && echo "WebSocket TLS Service ${gr}is running${wh}" || echo "WebSocket TLS Service ${red}is NOT running${wh}")
wsntls=$(systemctl is-active --quiet ws-nontls && echo "WebSocket Non TLS Service ${gr}is running${wh}" || echo "WebSocket Non TLS Service ${red}is NOT running${wh}")
xray1=$(systemctl is-active --quiet xray.service && echo "V2Ray Vmess TLS Service ${gr}is running${wh}" || echo "V2Ray Vmess TLS Service ${red}is NOT running${wh}")
xray2=$(systemctl is-active --quiet xray.service && echo "V2Ray Vmess Non TLS Service ${gr}is running${wh}" || echo "V2Ray Vmess Non TLS Service ${red}is NOT running${wh}")
xray3=$(systemctl is-active --quiet xray.service && echo "V2Ray Vless TLS Service ${gr}is running${wh}" || echo "V2Ray Vless TLS Service ${red}is NOT running${wh}")
xray4=$(systemctl is-active --quiet xray.service && echo "V2Ray Vless Non TLS Service ${gr}is running${wh}" || echo "V2Ray Vless Non TLS Service ${red}is NOT running${wh}")
xray5=$(systemctl is-active --quiet xray.service && echo "V2Ray Trojan GFW Service ${gr}is running${wh}" || echo "V2Ray Trojan GFW Service ${red}is NOT running${wh}")
tgo=$(systemctl is-active --quiet trojan-go && echo "Trojan GO Service ${gr}is running${wh}" || echo "Trojan GO Service ${red}is NOT running${wh}")
wg=$(systemctl is-active --quiet wg-quick@wg0 && echo "WireGuard Service ${gr}is running${wh}" || echo "WireGuard Service ${red}is NOT running${wh}")
sstp=$(systemctl is-active --quiet accel-ppp && echo "SSTP Service ${gr}is running${wh}" || echo "SSTP Service ${red}is NOT running${wh}")
l2tp=$(systemctl is-active --quiet xl2tpd && echo "L2TP Service ${gr}is running${wh}" || echo "L2TP Service ${red}is NOT running${wh}")
pptp=$(systemctl is-active --quiet pptpd && echo "PPTP Service ${gr}is running${wh}" || echo "PPTP Service ${red}is NOT running${wh}")
sdsck=$(systemctl is-active --quiet shadowsocks-libev.service && echo "ShadowSocks Service ${gr}is running${wh}" || echo "ShadowSocks Service ${red}is NOT running${wh}")
sdsckr=$(systemctl is-active --quiet ssrmu && echo "ShadowSocksR Service ${gr}is running${wh}" || echo "ShadowSocksR Service ${red}is NOT running${wh}")
ipsec=$(systemctl is-active --quiet ipsec && echo "IPSEC Service ${gr}is running${wh}" || echo "IPSEC Service ${red}is NOT running${wh}")
sslh=$(systemctl is-active --quiet sslh && echo "SSL/SSLH Multiplexer Service ${gr}is running${wh}" || echo "SSL/SSLH Multiplexer Service ${red}is NOT running${wh}")
echo -e "╔═══=================❖•ೋ°Check Services°ೋ•❖==================═══╗"
echo -e ""
echo -e "DropBear                   : $dp"
echo -e "OpenSSH                    : $ssh"
echo -e "Stunnel                    : $stn"
echo -e "OpenVPN TCP                : $ovpn1"
echo -e "OpenVPN UDP                : $ovpn2"
echo -e "Squid                      : $sqd"
echo -e "Nginx                      : $ngx"
echo -e "SSL/SSLH Multiplexer       : $sslh"
echo -e "WebSocket TLS              : $wstls"
echo -e "WebSocket Non TLS          : $wsntls"
echo -e "V2RAY Vmess TLS            : $xray1"
echo -e "V2RAY Vmess Non TLS        : $xray2"
echo -e "V2RAY Vless TLS            : $xray3"
echo -e "V2RAY Vless Non TLS        : $xray4"
echo -e "V2RAY Trojan GFW           : $xray5"
echo -e "Trojan GO                  : $tgo"
echo -e "WireGuard                  : $wg"
echo -e "SSTP                       : $sstp"
echo -e "L2TP                       : $l2tp"
echo -e "PPTP                       : $pptp"
echo -e "ShadowSocks                : $sdsck"
echo -e "ShadowSocksR               : $sdsckr"
echo -e "Snell Proxy Server         : $snell"
echo -e "IPSEC                      : $ipsec"
echo -e ""
echo -e "╚═══============❖•ೋ°Service By JuraganSSH°ೋ•❖================═══╝"
echo -e "${wh}Type ${red}menu${wh} Show Menu List - ${red}notes${wh} List All Autoscript Manual Command${wh}"
echo -e ""