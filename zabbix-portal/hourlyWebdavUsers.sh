#!/bin/bash
# \file         hourlyWebdavUsers.sh
# \brief        Counts the number of unique webdav users in the past hour
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/webdav_access.log

# counts unique webdav users in the past hour
./read-apache-logs.py --last hour "$filepath" | grep '/ HTTP/1.1" 20' | awk '{print $3}' | sort | uniq | wc -l
