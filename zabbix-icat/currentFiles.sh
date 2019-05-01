#!/bin/bash
# \file         currentFiles.sh
# \brief        returns the current number of irods files from the irods database.
# \author       Hans Kleinloog
# \copyright    Copyright (c) 2019, Utrecht University. All rights reserved.

resultstring=$(sudo -u irods iquest "select count(DATA_ID)")
results=( $resultstring )
echo ${results[2]}
