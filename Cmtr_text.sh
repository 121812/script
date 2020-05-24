#!/bin/bash
#查看ip的mtr值、断点、是否ping通
#  $1 为 ip

log='/var/log/PING_ERROR.log'
logs='/var/log/tracer_all.log'
tracer='/root/tmp/.tracer.tmp'
tracers='/root/tmp/.tracer.tmps'


while true
do
	PING=`ping -c 1 $1 | grep '0 received' | wc -l`
	if [ $PING = 1 ] ; then
		echo '------------------------------' >> $log
		#`echo date` >> $log
		echo -e $1 \\t $PING \\t `date` >> $log
		echo ' ' >> $log
		`mtr -rw $1 > $tracer`
		`echo date >> $logs`
		`mtr -rw $1 >> $logs`
		`cat $tracer | sed -n 2p >> $log` 
		`cat $tracer | sed '/^$/!h;$!d;g ' > $tracers`
		pd=`awk {'print $2'} $tracers`
		if [ $pd = '???' ] ; then
		 	`tail -n 2 $tracer | head -n 1 >> $log`
		else 
			`cat $tracer | sed '/^$/!h;$!d;g' >> $log` 
		fi
		#echo '----------------' >> $log
		sleep 1	
		
	fi
	
done
