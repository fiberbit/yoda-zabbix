#!/bin/bash
# \author       Niek Bats
# \file         replicationErrors.sh
# \brief        Returns number of replication errors from the last 60minutes
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

#gets the two latest rodslog files
filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#gets lines that contain uuReplicate
replicationErrors=$(sudo -u irods grep "uuReplicate" $filepaths )

counter=0
#gets current time in seconds
time=$(date "+%s")

#checks time matches from now till 60min ago with replicationErrors
for ((i = 0; i < 60; i++ ));
do
 #transforms time to a Jan  1 00:00 like format
 timestamp=$(date --date="@$time" "+%b %e %H:%M")

 #counter+replicationErrors that match timestamp
 counter=$(($counter+$(echo "$replicationErrors" | grep -c "$timestamp")))

 #time - 60sec(1min)
 time=$(($time-60))
done

echo "$counter"
