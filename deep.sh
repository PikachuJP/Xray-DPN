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
echo "#############################################################"
echo -e "#              ${RED} Deepnote v2ray 一键安装脚本${PLAIN}                 #"
echo -e "# ${GREEN}作者${PLAIN}: MisakaNo の 小破站                                  #"
echo -e "# ${GREEN}博客${PLAIN}: https://blog.misaka.rest                            #"
echo -e "# ${GREEN}GitHub 项目${PLAIN}: https://github.com/Misaka-blog               #"
echo -e "# ${GREEN}Telegram 频道${PLAIN}: https://t.me/misakablogchannel             #"
echo -e "# ${GREEN}Telegram 群组${PLAIN}: https://t.me/misakanoxpz                   #"
echo -e "# ${GREEN}YouTube 频道${PLAIN}: https://www.youtube.com/@misaka-blog        #"
echo "#############################################################"
echo ""

yellow "Please Note Before Use !"
red "1. This Might Be Illegal For Github TOS (I Didn't Face Any Issue Till Now) !"
red "2. It's May Not Be Stable Completely !"
read -rp "Do You Accept ？ [Y/N]：" yesno

if [[ $yesno =~ "Y"|"y" ]]; then
    rm -f web config.json
    yellow "Start Installing..."
    wget -O temp.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
    unzip temp.zip
    rm -f temp.zip
    mv v2ray web
    read -rp "Enter UUID (Enter For Defalt Value )" uuid
    if [[ -z $uuid ]]; then
        uuid="8d4a8f5e-c2f7-4c1b-b8c0-f8f5a9b6c384"
    fi
    rm -f config.json
    cat << EOF > config.json
{
    "log": {
        "loglevel": "warning"
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
    green "Github Codespaces X2ray Core！"
    yellow "Please Config Project Before Using It !"
    yellow "Project Edited By PikachuJP !"
    echo ""
    yellow "Running !!"
else
    red "Canceled !!!!"
    exit 1
fi
