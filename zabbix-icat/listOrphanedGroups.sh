#!/bin/bash
# \file     listOrphanedGroups.sh
# \brief    Call rule to return a list of groups without an internal user (...@uu.nl)
# \author    Niek Bats
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -r irods_rule_engine_plugin-irods_rule_language-instance -F /etc/zabbix/zabbix_agentd.d/listOrphanedGroups.r
