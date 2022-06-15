#/!bin/bash

# Get the name of vpn connection
server=$(nmcli | egrep "^.{7}VPN.{6}" | cut -d" " -f 1-3)

# Check if server is not connected and attempt to connect
[ ! "$server" ] && nmcli con up id "$server" > /dev/null 2>&1

# add this to corntab -e */10 * * * * * ~/connect.sh
