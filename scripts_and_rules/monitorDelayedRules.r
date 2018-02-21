count {
	*count = 0;
	foreach (*row in SELECT RULE_EXEC_ID) {
		*count=*count+1;
	}
	writeLine("stdout","*count");
}

input null
output ruleExecOut
