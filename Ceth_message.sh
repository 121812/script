#!/bin/bash
#快捷查看网卡信息、ip

iftmp='./.ifconfig.tmp'




`ip addr | egrep '^[1-9]+' | awk -F ': ' '{print $1,$2}' > $iftmp`
cat $iftmp

while true
do

	read -p "Please input Eth number: " rd

	echo ' '
	echo '---------------------------------'


	if [ $rd -gt 0  ] ; then 
		echo -e 'Network: \t' `ip addr | grep ^$rd | awk -F': ' '{print $2}'`
		echo -e 'IP:\t \t'  `ip addr  | grep inet | sed -n $rd\p | awk  '{print $2}'`	
	elif [ $rd = 'quit' ] ; then	
		echo ' '
		echo 'quit.....'
		echo y | rm $iftmp
		break
	else
		echo 'Please input number !'
		cat $iftmp
		
	fi


done




