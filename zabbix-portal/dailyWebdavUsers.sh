#!/bin/bash
# \file         dailyWebdavUsers.sh
# \brief        Counts the number of unique webdav users of the last day.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/webdav_access.log

# Check logformat
grep -q "LogFormat.*X-Forwarded-For.*common$" /etc/httpd/conf/httpd.conf
logf_enabled="$?"

# counts unique webdav users in the past hour
if [ $logf_enabled == "0" ]
then /etc/zabbix/zabbix_agentd.d/read-apache-logs.py --last day "$filepath" | grep '/ HTTP/1.1" 20' | awk '{print $4}' | sort | uniq | wc -l
else /etc/zabbix/zabbix_agentd.d/read-apache-logs.py --last day "$filepath" | grep '/ HTTP/1.1" 20' | awk '{print $3}' | sort | uniq | wc -l
fi
