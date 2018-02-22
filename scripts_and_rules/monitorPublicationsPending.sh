#!/bin/bash

# \file      monitorPublicationsPending.sh
# \brief     Call rule to monitor pending publications.
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

sudo -u irods irule -F /etc/irods/yoda-zabbix/monitorPublicationsPending.r $1
