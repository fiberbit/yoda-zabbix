# \file      listOrphanedGroups.r
# \brief     Returns a list of groups without an internal user
#            (a user whos name ends at: @uu.nl) as groupmanager.
# \author    Niek Bats
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

#prints all groups without an internal groupmanager
getOrphanedGroups {
        foreach(*groups in SELECT USER_NAME
                           WHERE USER_TYPE = 'rodsgroup') {

                *group=*groups.USER_NAME;
                if(isOrphanedGroup(*group)) {
                        writeLine("stdout", "*group");
                }
        }
}

#returns false if group has an internaluser else true
isOrphanedGroup(*group) = {
        *return = true;
        foreach(*managers in SELECT META_USER_ATTR_VALUE
                WHERE USER_NAME = '*group'
                AND META_USER_ATTR_NAME = 'manager') {

                *manager=trimr(*managers.META_USER_ATTR_VALUE, '#');

                *addToList=(*manager like "*@uu.nl")
                if(bool(*addToList)) {
                        *return = false;
                        break();
                }
        }
        *return;
}

input null
output ruleExecOut
