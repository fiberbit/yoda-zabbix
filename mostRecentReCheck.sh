#!/bin/bash

# \file      monitorDelayedRules.sh
# \brief     Call rule to monitor delayed rules.
# \author    Niek Bats
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

log=$(grep ".*reServerMain: checking the queue for jobs" /var/lib/irods/iRODS/server/log/reLog.* | tail -n 1)
rawDateTime=${log:38:26}
read -ra array <<< "$rawDateTime"

year=${array[0]}
year=${year:0:4}
month=${array[0]}
month=${month:11:3}
day=${array[1]}
time=${array[2]}

currentTime=$(date +%s)
refinedDateTime="$day$month$year $time"
logTime=$(date -d "$refinedDateTime" +%s)
echo $((currentTime - logTime))
