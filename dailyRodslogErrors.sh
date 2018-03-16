#!/bin/bash
# \author		Niek Bats
# \file			dailyRodslogErrors.sh
# \brief		Count number of current errors of the current day found in the rodsLog
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.
#
#gets latest log file
filepaths=$(sudo -u irods ls /var/lib/irods/iRODS/server/log/rodsLog.* | tail -n 2)

#gets current month and day
monthDay=$(date +"%b %d")

#gets lines containing error and month day
echo $(sudo -u irods grep "$monthDay" $filepaths | grep "ERROR" | wc -l)