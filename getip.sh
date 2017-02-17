#!/bin/bash

logfile="public_ip.log"
echo "## $(date)" >> $logfile
echo -n "ifconfig.co: " >> $logfile
wget -qO- ifconfig.co >> $logfile  ##can use curl ifconfig.co too.
echo -n "ipinfo.io: " >> $logfile
curl ipinfo.io/ip >> $logfile
opendns_ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "opendns.com: ${opendns_ip}" >> $logfile
echo -n "google.com: " >> $logfile
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}' >> $logfile
echo "ipify.org: " >> $logfile
curl https://api.ipify.org >> $logfile
echo "\n\n" >> $logfile
