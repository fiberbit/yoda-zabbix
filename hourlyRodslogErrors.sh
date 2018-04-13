#!/bin/bash
# \author       Niek Bats
# \file         hourlyRodslogErrors.sh
# \brief        Count number of current errors of the current hour found in the rodsLog
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.
#
#gets latest log file
filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#gets current month day and hour
month=$(date +"%b")
day=$(date +"%e")
hour=$(date +"%H")
space=" "
#month day hour is constructed according to format in the rodsLog
monthDayHour="$month$space$day$space$hour"

#counts lines containing ERROR in current month day hour
echo $(sudo -u irods grep "$monthDayHour" $filepaths | grep "ERROR" | wc -l)
