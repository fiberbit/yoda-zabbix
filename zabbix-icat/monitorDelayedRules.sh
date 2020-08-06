#!/bin/bash

# \file		monitorDelayedRules.sh
# \brief	Call rule to count the actual delayed rules for monitoring.
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -r irods_rule_engine_plugin-irods_rule_language-instance -F /etc/zabbix/zabbix_agentd.d/monitorDelayedRules.r
