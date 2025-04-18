#!/usr/bin/bash
source ~/.env
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
server_health_log=$SERVER_HEALTH_LOG

echo -e "\n\n\n======CPU USAGE REPORT $timestamp=====\n" >> $server_health_log
mpstat >> $server_health_log
echo -e "\n\n-----checking for cpu errors-----" >> $server_health_log
mpstat | awk 'NR>3 {
if($12 < 20){
        print "Error: Warning CPU usage is above 80% only " $12 "% is idle"
}
}' >> $server_health_log



echo -e "\n\n\n======MEMORY USAGE REPORT $timestamp======\n" >> $server_health_log
free -h >> $server_health_log
echo -e "\n\n-----checking for memory errors-----" >> $server_health_log
free | awk 'NR>1 {
if ($2 > 0 && $4 / $2 < 0.2){
        print "Error: Warning in " $1 " memory is running low only " $4 / $2 "% is available"
}
}' >> $server_health_log



echo -e  "\n\n\n=====DISK USAGE REPORT $timestamp=====\n" >> $server_health_log
df -hP  >> $server_health_log;
echo -e "\n\n-----checking for disk errors-----" >> $server_health_log
df -hP  |  awk 'NR>1 {
used = $5;
gsub("%", "", used);

available = 100 - used;
if (available < 10) {
        print "Error: Warning in " $1 " disk space is low only " $5 "is available"
}
}' >> $server_health_log



echo -e "\n\n\n===== NGINX STATUS REPORT $timestamp=====\n" >> $server_health_log
service nginx status >> $server_health_log
echo -e "\n\n-----checking for errors-----" >> $server_health_log
if systemctl is-active --quiet nginx; then
        echo
else
        echo "Error: Warning NGINX is not active" >> $server_health_log
        journalctl -u nginx --since today | echo >> $server_health_log
fi

echo -e "\n\n\n===== ENDPOINT STATUS REPORT $timestamp=====" >> $server_health_log
status_code=$(curl -s -o /dev/null -w "%{http_code}" http://ec2-13-60-162-177.eu-north-1.compute.amazonaws.com/students/)
if [ "$status_code" -ne 200 ]; then
        echo "Error: Warning, students endpoint is down with status code" $status_code >> $server_health_log
else
        echo "Success: Students endpoint is ok with status code " $status_code >> $server_health_log
fi

status_code=$(curl -s -o /dev/null -w "%{http_code}" http://ec2-13-60-162-177.eu-north-1.compute.amazonaws.com/subjects/)

if [ "$status_code" -ne 200 ]; then
        echo "Error: Warning, subjects endpoint is down with status code" $status_code >> $server_health_log
else
        echo "Success: Subjects endpoint is ok with status code " $status_code >> $server_health_log
fi