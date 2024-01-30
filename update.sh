#!/bin/sh
wget https://gcore.jsdelivr.net/gh/IceCodeNew/4Share@master/geoip_china/china_ip_list.txt -O /etc/mosdns/geoip_cn.txt > /dev/null 2>&1
wget https://gcore.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/reject-list.txt -O /etc/mosdns/geosite_category-ads-all.txt > /dev/null 2>&1
wget https://gcore.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/proxy-list.txt -O /etc/mosdns/geosite_geolocation-!cn.txt > /dev/null 2>&1
wget https://gcore.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/direct-list.txt -O /etc/mosdns/geosite_cn.txt > /dev/null 2>&1
echo "Update geoip rule completed."

# mosdns
if pid=$(pgrep mosdns); then
    kill $pid
fi
/usr/bin/mosdns start --dir /etc/mosdns