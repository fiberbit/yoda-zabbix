#!/bin/bash

# \file      mostKilledProcesses.sh
# \brief     Returns the number of lines in /var/log/messages.for killed processes due to lack of virutal memory of the current day
#.\brief     Mar 29 09:29:50 combined kernel: Killed process 15639 (irodsServer) total-vm:913264kB, anon-rss:754528kB, file-rss:4kB, shmem-rss:22556kB
#.\          Initial version
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

#gets current month day
month=$(date +"%b")
day=$(date +"%e")
space=" "
#month day is constructed according to format in the rodsLog
monthDay="$month$space$day";

# returns count of lines containing Killed process and month day.
echo $(sudo -u root grep "$monthDay" /var/log/messages | grep "Killed process" | wc -l)

