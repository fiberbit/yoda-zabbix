#!/bin/bash

# \file		mostRecentReCheck.sh
# \brief	Returns the number of seconds that the Delayed Rule Engine checked for jobs.
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.

filepath=$(ls /var/lib/irods/iRODS/server/log/reLog.* | tail -n 1)

log=$(grep ".*reServerMain: checking the queue for jobs" $filepath | tail -n 1)

year=${filepath:38:4}

read -ra array <<< "$log"
month=${array[0]}
day=${array[1]}
time=${array[2]}

currentTime=$(date +%s)
currentDate="$day $month $year $time"
logTime=$(date -d "$currentDate" +%s)

echo $(($currentTime - $logTime))