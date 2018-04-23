#!/bin/bash
# \file     listOrphanedGroups.sh
# \brief    Call rule to return a list of groups without an internal user (...@uu.nl)
# \author    Niek Bats
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -F /etc/irods/yoda-zabbix/listOrphanedGroups.r
