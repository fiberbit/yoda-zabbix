#!/bin/bash
# \file         hourlyWebdavUsers.sh
# \brief        Counts the number of unique webdav users during the current clockhour.
# \author       
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets latest log file.
# filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

#counts lines containing ERROR in the current month day hour
#echo $(sudo -u irods grep "$(date +"%b %e %H")" $filepaths | grep -c "ERROR")
echo 1
