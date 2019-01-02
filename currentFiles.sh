#!/bin/bash
# \file         currentFiles.sh
# \brief        Provides and overview of number of files within filesize ranges.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
# filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#counts lines containing ERROR in the current month day
#echo $(sudo -u irods grep "$(date +"%b %e")" $filepaths | grep -c "ERROR")
echo "0 - 1000, 1 - 3000, 2 - 50, 3 - 5"
