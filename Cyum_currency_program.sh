#!/bin/bash
#yum常用软件安装


software=(vim tree lrzsz lsof elinks git wget net-tools )



for i in ${software[@]};
do
yum -y install $i
done 
	

