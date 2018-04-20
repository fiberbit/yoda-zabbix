# \file      listOrphanedGroups.r
# \brief     returns a list of groups without an internal user (...@uu.nl)
# \author    Niek Bats
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

getOrphanedGroups {
        foreach(*groups in SELECT USER_NAME
                           WHERE USER_TYPE = 'rodsgroup') {

                *group=*groups.USER_NAME;
                if(isOrphanedGroup(*group)) {
                        writeLine("stdout", "*group");
                }
        }
}

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

                #writeLine("stdout", "*group;*manager;" ++ str(*addToList))
        }
        *return;
}

input null
output ruleExecOut
