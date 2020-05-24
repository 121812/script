#!/bin/bash
#随机生成一段字符串，一般用于 passwd 中， $1 为 生成长度


num=$1

if [ ! $num ] ; then
        num=7
else
        num=$1
fi


echo ''
echo 'passwd: '   
head -c 10000 /dev/urandom | tr -dc A-Za-z | head -c $num
echo ''

