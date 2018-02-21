#Author Niek Bats
log=$(grep ".*reServerMain: checking the queue for jobs" /var/lib/irods/iRODS/server/log/reLog.* | tail -n 1)
rawdatetime=${log:38:26}
read -ra array <<< "$rawdatetime"

year=${array[0]}
year=${year:0:4}
month=${array[0]}
month=${month:11:3}
day=${array[1]}
time=${array[2]}

currenttime=$(date +%s)
refineddatetime="$day$month$year $time"
logtime=$(date -d "$refineddatetime" +%s)
echo $((currenttime - logtime))
