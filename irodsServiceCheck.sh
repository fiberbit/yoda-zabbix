#!/bin/bash
# \file         irodsServiceCheck.sh
# \brief        Check irods service (via port 1247) by requesting basic server information.
# \             If (local) irodsservice is down, a connection error with the local server on port 1247 is returned
# \author       Hans Kleinloog
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets irods basic server information (also used by Zabbix to check if irods service is still up and running
echo "$(sudo -u irods imiscsvrinfo)"
