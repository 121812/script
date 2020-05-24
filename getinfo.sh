#!/bin/bash
#列出系统cpu个数、硬盘大小、内存大小 可用空间、ip、位数、软件个数






num=`cat /proc/cpuinfo | grep 'physical id'| wc -l`
size=`df -h |grep '/$' | awk {'print $2'} `
software=`dpkg -l | wc -l`
bit=`uname -a | awk {'print $13'} | awk -F'_' {'print $2'} `
ip=`ip a | grep inet | grep eth0 | awk {'print $2'} |awk -F'/' {'print $1'}`
free=`free -m | grep Mem |awk {'print $4'} `
total=`free -g | grep Mem |awk {'print $2'}`
process=`cat /proc/cpuinfo | grep process | wc -l`


echo 'cpu num: ' $num
echo 'memory total: ' $total
echo 'memory free: ' $free
echo 'disk size: ' $size
echo 'system bit: ' $bit
echo 'process: ' $process
echo 'software num: ' $num
echo 'ip: ' $ip
