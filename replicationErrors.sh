#!/bin/bash
# \author       Niek Bats
# \file         replicationErrors.sh
# \brief        Returns number of replication errors from the last 60minutes
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

#gets the two latest rodslog files
filepaths=$(sudo -u irods ls /var/lib/irods/log/rodsLog.* | tail -n 2)

echo "$(awk -v d1="$(date --date="-60 min" "+%b %e %H:%M")" -v d2="$(date "+%b %e %H:%M")" '$0 > d1 && $0 < d2 || $0 ~ d2' $filepaths | grep -cE "uuReplicate|msiDataObjRepl")"
