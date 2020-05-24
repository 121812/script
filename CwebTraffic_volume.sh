#!/bin/bash
#审计nginx日志的浏览量、ip量并排序

if [ ! -n "$1" ]; then	#判断 $1 是否有输入，无输入则 默认
	tmp='/data/wwwlogs/access_nginx.log'	#nginx访问日志
	
	cat $tmp |awk  {'print $1'} | sort | uniq -c | sort  -n	#打印所有ip访问列表并显示访问次数
 
	echo -e "Traffice volume：\t"	`cat $tmp | wc -l`	#打印总浏览量
	echo -e "Traffice number: \t"	`cat $tmp | awk  {'print $1'} | sort | uniq | wc -l`	#打印总量ip数量
else	# $1 有输入则 过滤数据 $1
	cat $1 |awk  {'print $1'} | sort | uniq -c | sort  -n 
	echo -e "Traffice volume：\t"	`cat $1 | wc -l`
	echo -e "Traffice number: \t"	`cat $1 | awk  {'print $1'} | sort | uniq | wc -l`
fi
