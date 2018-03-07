#!/bin/bash

# \file      irodsGroupsCount.sh
# \brief     Count number of iRODS groups.
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

totalNumberOfGroups=$(sudo -u irods iadmin lg | wc -l)
echo $totalNumberOfGroups
