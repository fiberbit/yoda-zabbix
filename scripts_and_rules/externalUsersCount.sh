#count number of external users
totalusers=$(sudo -u irods iadmin lu |wc -l)
totalinternalusers=$(sudo -u irods iadmin lu |grep @uu.nl |wc -l)
totalexternalusers=$((totalusers-totalinternalusers))
echo $totalexternalusers
