#!/bin/bash
# \file         hourlyWebdavUsers.sh
# \brief        Counts the number of unique webdav users of the previous hour.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/webdav_access.log

#counts unique webdav user logins in the current hour
echo $(grep "$(date +'%d/%b/%Y:%H')" $filepath | grep '/ HTTP/1.1" 20' | awk '{print $3}' | sort | uniq | wc -l)
