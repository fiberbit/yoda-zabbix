#!/bin/bash

# \file      concurrentiRodsClientConnections.sh
# \brief     Count number of actual concurrent irods client connections.
#            IPS lists all connections. The amount of irods client connections is:
#            total lines - the first line (server:...) - ips connection for this script
# \author    Niek Bats
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

echo $(($(sudo -u irods ips | wc -l) -2))
