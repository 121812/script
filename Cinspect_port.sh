#!/bin/bash

echo  
echo '以下是常用端口情况:'
echo 
lsof -i :80 | sed -n 2p
lsof -i :22 | sed -n 2p
lsof -i :10050 | sed -n 2p
lsof -i :10051 | sed -n 2p
lsof -i :3306 | sed -n 2p
echo  
echo  


lsof -i :80 | sed -n 2p |  awk '{print $1}'
lsof -i :22 | sed -n 2p |  awk '{print $1}'
lsof -i :10050 | sed -n 2p |  awk '{print $1}'
lsof -i :10051 | sed -n 2p |  awk '{print $1}'
lsof -i :3306 | sed -n 2p |  awk '{print $1}'
echo 
