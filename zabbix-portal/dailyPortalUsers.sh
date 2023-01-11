#!/bin/bash
# \file         dailyPortalUsers.sh
# \brief        Counts the number of portal logins of the last day.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/portal_access.log

# counts lines containing login HTTP of last day
./read-apache-logs.py --last day "$filepath" | grep -c '"GET /user/login HTTP/1.1" 200'
