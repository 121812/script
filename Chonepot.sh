#!/bin/bash
#蜜罐陷阱
#详细链接：http://www.forever121.cn/?p=245

nginxlog='/data/wwwlogs/access_nginx.log'
nginxlogbak='/data/wwwlogs/honeypot.log'
logs='/root/logs/Choneypot.log'
logss='/root/logs/hk_aces.log'

`echo y | cp $nginxlog $nginxlogbak `
fd=`sudo cat $nginxlogbak | awk  '{print $1,$7}' | grep dama| sort  | uniq -c |sort -n`
hk=`echo $fd | grep '/wp-content/plugins/jetpack/bin/dama.php?' |awk '{print $2}'`

echo "--------------------------" >> "$logs"
echo `date` >> "$logs"
echo $fd >> "$logs"
echo "--------------------------" >> "$logs"
echo ' ' >> "$logs"

#sed -e  "100a\\\t\\deny $hk ;" '/usr/local/nginx/conf/nginx.conf'
`sed -i '/dama.php/d' $nginxlogbak`

echo ' ' >> "$logss"
echo "--------------------------" >> "$logss"
`iptables  -A INPUT  -s $hk -j DROP`
echo `date` >> "$logss"
echo $fd >> "$logs"
echo "iptables  -A INPUT  -s $hk -j DROP" >> "$logss"
echo $fd >> "$logss"
echo "--------------------------" >> "$logss"
echo ' ' >> "$logss"

#find
`sed -e '/iptables  -A INPUT  -s  -j DROP/d' $logss | grep  -C 3 iptable > /root/logs/.hk_aces.log.temp`
`echo y | cp /root/logs/.hk_aces.log.temp /root/logs/hk_aces.log`
`echo y | rm /root/logs/.hk_aces.log.temp`

`echo y | cp $nginxlogbak $nginxlog `
echo -e 'Execution complete:' \\n \\t$hk 

