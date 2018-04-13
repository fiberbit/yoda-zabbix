#!/bin/bash
# \file         dailyRodslogErrors.sh
# \brief        Count number of current errors of the current day found in the rodsLog.
# \author       Niek Bats
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

# gets latest log file.
filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#gets current month day
month=$(date +"%b")
day=$(date +"%e")
space=" "
#month day is constructed according to format in the rodsLog
monthDay="$month$space$day"

#counts lines containing ERROR in current month day
echo $(sudo -u irods grep "$monthDay" $filepaths | grep "ERROR" | wc -l)
