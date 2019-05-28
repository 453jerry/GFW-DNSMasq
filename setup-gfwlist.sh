#!/bin/bash

mkdir ./tmp
cd ./tmp
echo "downloading gfwlist2dnsmasq.sh"
wget https://raw.githubusercontent.com/cokebar/gfwlist2dnsmasq/master/gfwlist2dnsmasq.sh
echo "exec gfwlist2dnsmasq.sh"
sh ./gfwlist2dnsmasq.sh -d ${GFW_DNS} -p 53 -o ./dnsmasq.gfwlist.conf
echo "apply conf"
cp -rf ./dnsmasq.gfwlist.conf /etc/dnsmasq.gfwlist.conf
cd ..
rm -rf ./tmp
echo "start dnsmasq"
dnsmasq -k
exit 0