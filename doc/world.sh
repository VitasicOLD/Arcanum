#!/bin/sh
echo ""
while true ; do
servlog='/home/server/wow/lum/logs/Server.log';
outpath='/home/server/wow/lum/logs/';
date=`date "+%Y-%m-%d_%H:%M:%S"`;
echo "Server CRASHED !!! Start Bugreport System." >> $outpatch$date.txt;
echo "Server.log Log FILE Last 30 Lines:" >> $outpatch$date.txt;
cat $servlog | tail -n 30 >> $outpath$date.txt;
echo "" >> $outpatch$date.txt;
echo "END bugtracker system." >> $outpatch$date.txt;
/home/server/wow/lum/bin/worldserver -c /home/server/wow/lum/etc/worldserver.conf
done
