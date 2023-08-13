#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PLAIN='\033[0m'

red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}

yellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}

clear
echo "##############################################"
echo -e "${RED} Shell Xray 一 Installer Script${PLAIN}"
echo -e "${GREEN} Froker${PLAIN} : Edited By Freedom"
echo "##############################################"
echo ""

yellow "Please Note Before Use !"
red "1. This Might Be Illegal For Github TOS (I Didn't Face Any Issue Till Now) !"
red "2. It's May Not Be Stable Completely !"
echo ""

rm -f web config.json
yellow "Start Installing..."
wget -O temp.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -o temp.zip
rm -f temp.zip
mv v2ray web
uuid="8d4a8f5e-c2f7-4c1b-b8c0-f8f5a9b6c384"
rm -f config.json
cat << EOF > config.json
{
    "log": {
        "loglevel": "none"
    },
    "routing": {
        "domainStrategy": "AsIs",
        "rules": [
            {
                "type": "field",
                "ip": [
                    "geoip:private"
                ],
                "outboundTag": "block"
            }
        ]
    },
    "inbounds": [
        {
            "listen": "0.0.0.0",
            "port": 8080,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "tag": "direct"
        },
        {
            "protocol": "blackhole",
            "tag": "block"
        }
    ]
}
EOF
nohup ./web run &>/dev/null &
green "Infromations!"
green "Server Address / SNI /  WS Host : Local / Server"
green "UUID : 8d4a8f5e-c2f7-4c1b-b8c0-f8f5a9b6c384"
green "Port : 443"
green "WS Path : /"
green "TLS Enabled | Alpn : Http 1.1 | uTLS : Chrome or etc"
yellow "Please Config Project Before Using It!"
yellow "Project Edited By Freedom!"
yellow "Running !!"
