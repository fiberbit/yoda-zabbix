#Author Niek Bats
#Checks if an publication is pending longer then given time

check {
    *count = 0;
    msiGetIcatTime(*currentTime, "unix");
	
    foreach(*row in SELECT COLL_MODIFY_TIME
        WHERE META_COLL_ATTR_NAME = 'org_vault_status'
        AND META_COLL_ATTR_VALUE = 'APPROVED_FOR_PUBLICATION') {
        *time = *row.COLL_MODIFY_TIME;

        if((int(*currentTime)) - int(*time) > *allowedTimeDiff) {
            *count = *count+1;
        }
    }
    writeLine("stdout", *count)
}

input *allowedTimeDiff = 86400 #in seconds 1D=86400 1H=3600
output ruleExecOut
