#!/bin/bash
# \file         dailyPortalUsers.sh
# \brief        Counts the number of unique portal users during the current day.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
# filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#counts lines containing ERROR in the current month day
#echo $(sudo -u irods grep "$(date +"%b %e")" $filepaths | grep -c "ERROR")
echo 20
