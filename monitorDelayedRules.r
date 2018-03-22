# \file      monitorDelayedRules.r
# \brief     Count the number of delayed rules in the queue.
# \copyright Copyright (c) 2018, Utrecht University. All rights reserved.

count {
        *count = 0;
        foreach (*row in SELECT count(RULE_EXEC_ID)) {
                *count=*row.RULE_EXEC_ID;
        }
        writeLine("stdout","*count");
}

input null
output ruleExecOut
