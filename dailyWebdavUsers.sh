#!/bin/bash
# \file         dailyWebdavUsers.sh
# \brief        Counts the number of unique webdav users of the previous day.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/webdav_access.log

#counts unique webdav user logins in the current day
echo $(grep "$(date +'%d/%b/%Y')" $filepath | grep '"GET / HTTP/1.1" 200' | awk '{print $3}' | sort | uniq | wc -l)
