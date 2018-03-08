#!/bin/bash

# \file		monitorPublicationsPending.sh
# \brief	Call rule to monitor pending applications.
# \		The count of publications that are pending longer than the number of seconds,
# \             specified in the zabbix item key parameter is returned 
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -F /etc/irods/yoda-zabbix/monitorPublicationsPending.r
