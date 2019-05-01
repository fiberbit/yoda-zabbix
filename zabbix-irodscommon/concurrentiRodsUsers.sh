#!/bin/bash

# \file      concurrentiRodsUsers.sh
# \brief     Counts the number of unique users that have one or more active connections
#            except for the connection used by this script.
#            This script assumes usernames dont have a # or a space.
# \author    Niek Bats
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

# Adds its first parameter to uniqueUsers if uniqueUsers doesnt already have it.
function addUniqueUser {
    for user in ${uniqueUsers[@]}
    do
        if [ $user == $1 ]
        then
            return
        fi
    done
    uniqueUsers+=($1)
}

# Runs the ips command with sudo -u irods rights.
# Then splits the result on # by setting bashes delimeter(IFS) to '#'.
# And then reads the result into an array named ipsOutput.
IFS='#' read -ra ipsOutput <<< $(sudo -u irods ips)

# Makes an array named uniqueUsers.
declare -a uniqueUsers

# For each element of ipsOutput besides the first and the last.
for ((i = 1; i < ${#ipsOutput[@]} - 1; i++));
do
    # Split the element on ' ' and read it into splitIpsOutputElement.
    IFS=' ' read -ra splitIpsOutputElement <<< ${ipsOutput[$i]}
    # Passes the last element of splitIpsOutputElement
    # which should always be a username to the function addUniqueUser.
    addUniqueUser ${splitIpsOutputElement[-1]}
done

# Prints the length of uniqueUsers.
echo ${#uniqueUsers[@]}
