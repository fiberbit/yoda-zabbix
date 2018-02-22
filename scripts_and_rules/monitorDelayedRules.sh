#!/bin/bash

# \file      monitorDelayedRules.sh
# \brief     Call rule to monitor delayed rules.
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -F /etc/irods/yoda-zabbix/monitorDelayedRules.r
