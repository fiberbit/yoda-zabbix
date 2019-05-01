#!/bin/bash
# \file         dailyRodslogErrors.sh
# \brief        Counts the number of errors of the current day found in the rodsLog.
# \author       Niek Bats
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

# gets latest log file.
filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#counts lines containing ERROR in the current month day
echo $(sudo -u irods grep "$(date +"%b %e")" $filepaths | grep -c "ERROR")