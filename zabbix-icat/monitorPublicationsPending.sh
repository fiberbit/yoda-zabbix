#!/bin/bash

# \file     monitorPublicationsPending.sh
# \brief    Call rule to monitor pending applications.
# \     The count of publications that are pending longer than the number of seconds,
# \             specified in the zabbix item key parameter is returned
# \copyright    Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -r irods_rule_engine_plugin-irods_rule_language-instance -F /etc/zabbix/zabbix_agentd.d/monitorPublicationsPending.r $1
