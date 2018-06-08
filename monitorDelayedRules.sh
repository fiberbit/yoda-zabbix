#!/bin/bash

# \file		monitorDelayedRules.sh
# \brief	Call rule to count the actual delayed rules for monitoring.
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -F /etc/zabbix/zabbix_agentd.d/monitorDelayedRules.r
