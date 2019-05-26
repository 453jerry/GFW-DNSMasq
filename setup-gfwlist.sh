#!/bin/bash

echo "downloading gfwlist2dnsmasq.sh"
wget https://raw.githubusercontent.com/cokebar/gfwlist2dnsmasq/master/gfwlist2dnsmasq.sh
echo "exec gfwlist2dnsmasq.sh"
sh /opt/gfwlist2dnsmasq.sh -d ${GFW_DNS} -o /etc/dnsmasq.gfwlist.conf
echo "apply dnsmasq.gfwlist.conf"
echo "conf-file=/etc/dnsmasq.gfwlist.conf" >> /etc/dnsmasq.conf
dnsmasq -k
exit 0