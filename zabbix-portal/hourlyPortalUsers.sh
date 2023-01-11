#!/bin/bash
# \file         hourlyPortalUsers.sh
# \brief        Counts the number of portal logins in the past hour
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/portal_access.log

# counts lines containing login HTTP in the past hour
./read-apache-logs.py --last hour "$filepath" | grep -c '"GET /user/login HTTP/1.1" 200'
