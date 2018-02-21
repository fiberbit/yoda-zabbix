#count number of internal users
totalinternalusers=$(sudo -u irods iadmin lu |grep @uu.nl |wc -l)
echo $totalinternalusers
