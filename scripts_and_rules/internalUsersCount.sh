#!/bin/bash

# \file      internalUsersCount.sh
# \brief     Count number of internal Yoda users.
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

totalInternalUsers=$(sudo -u irods iadmin lu | grep @uu.nl | wc -l)
echo $totalInternalUsers
