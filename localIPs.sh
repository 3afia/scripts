#!/bin/bash

# ping devices connected to the local network

# grabbing the first three octets of the local network IP
IP=$(ip a s | grep "inet\b" | grep wlp3s0 | cut -d " " -f6 | cut -d . -f1-3)


OUTPUT="liveIPs.txt"
echo -e  "Output will be saved to.. $OUTPUT\n"
# checking if output file exist and cteating new one
[ -f $OUTPUT ] && rm -f $OUTPUT && echo -e "deleted old $OUTPUT & created a new empty one...\n" || touch $OUTPUT

echo -e "grabbing the IPs of the devices connected to the local network..\n"
for i in {1..254}; do ping -c 1 $IP.$i | grep "64 bytes" | cut -d " " -f4 | cut -d : -f1 >> $OUTPUT & done
cat $OUTPUT
