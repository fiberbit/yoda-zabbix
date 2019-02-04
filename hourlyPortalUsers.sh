#!/bin/bash
# \file         hourlyPortalUsers.sh
# \brief        Counts the number of unique portal users of the current hour.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/portal_access.log

#counts lines containing login HTTP in the current hour
echo $(grep "$(date +'%d/%b/%Y:%H')" $filepath | grep -c '"GET /user/login HTTP/1.1" 200')
