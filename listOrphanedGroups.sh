#!/bin/bash

# \file     listOrphanedGroups.sh
# \brief    Call rule to list Orphaned Groups.
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -F /etc/irods/yoda-zabbix/listOrphanedGroups.r
