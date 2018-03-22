#!/bin/bash
# \author		Niek Bats
# \file			concurrentiRodsUsers.sh
# \brief		Counts the number of unique users that have one or more active connections
# \				except for the connection used by this script.
# \				This script assumes usernames dont have a # or a space.
# \copyright	Copyright (c) 2018, Utrecht University. All rights reserved.

function add {
		for user in ${uniqueUsers[@]}
		do
				if [ $user == $1 ]
				then
						return
				fi
		done
		uniqueUsers+=($1)
}

IFS='#' read -ra array <<< $(sudo -u irods ips)
declare -a uniqueUsers

for (( i=1; i<${#array[@]} - 1; i++ ));
do
		IFS=' ' read -ra array2 <<< ${array[$i]}
		add ${array2[-1]}
done

echo ${#uniqueUsers[@]}