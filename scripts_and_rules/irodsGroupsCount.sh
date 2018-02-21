#count number of irods groups
totalnumberofgroups=$(sudo -u irods iadmin lg |wc -l)
echo $totalnumberofgroups