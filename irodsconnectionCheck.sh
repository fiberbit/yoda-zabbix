#!/bin/bash
# \file         irodsConnectionCheck.sh
# \brief        Check irods connection (port 1247) by requesting basic server information.
# \author       Hans Kleinloog
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

# gets irods basic server information (also used by Zabbix to check connection via port 1247)
echo $(sudo -u irods imiscsvrinfo)
