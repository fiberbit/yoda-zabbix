#!/bin/bash
# \author Niek Bats
# \file			concurrentiRodsClientConnections.sh
# \brief		Count number of actual concurrent irods client connections.
# \				IPS lists all connections. The amount of irods client connections is:
# \				total lines - the first line (server:...) - ips connection for this script 
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.

echo $(($(ips | wc -l) -2))