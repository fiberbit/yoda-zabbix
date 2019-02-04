#!/bin/bash
# \file         dailyPortalUsers.sh
# \brief        Counts the number of unique portal users of the current day.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
filepath=/var/log/httpd/portal_access.log

#counts lines containing login HTTP in the current day
echo $(grep "$(date +'%d/%b/%Y')" $filepath | grep -c '"GET /user/login HTTP/1.1" 200')
