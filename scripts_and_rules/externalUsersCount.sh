#!/bin/bash

# \file      externalUsersCount.sh
# \brief     Count number of external Yoda users.
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

totalExternalUsers=$(sudo -u irods iadmin lu | grep -v @uu.nl | wc -l)
echo $totalExternalUsers
