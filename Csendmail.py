# coding=utf-8
#!/usr/local/bin/python3
#发送邮件脚本 $1=收件人，$2=发送者 $3=收件人姓名 $4=标题
import sys
import smtplib
from email.mime.text  import  MIMEText
from  email.header import  Header



receiver = sys.argv[1]
From = sys.argv[2]
To = sys.argv[3]
subject = sys.argv[4]


def config(sender='', receiver = '', From='None', To='None', Subject='None'):
    sender = ''
    receiver = '%s'%receiver
    msg = MIMEText("您好。<br><br><br><br>"
                   "<br> <br>"

                   "xx技术股份有限公司 <br>"
                   "手机: xx<br>"
                   "座机：xxx<br>"
                   "邮箱：xxxx@xx.com<br>"
                   "地址：xxxx<br>"
                   "邮编：xxxx<br>"
                   "===================================<br>"
                   "", 'HTML', 'utf-8')
    msg['From'] = Header('%s'%From, 'utf-8')
    msg['To'] = Header('%s'%To, 'utf-8')
    msg['Subject'] = Header('%s'%Subject, 'utf-8')
    sendm(sender, receiver, msg)





def sendm(sender, receiver, msg):
    try:
        smtp = smtplib.SMTP()
        smtp.connect('smtp.qq.com')
        smtp.login('', '')
        smtp.sendmail(sender, receiver, msg.as_string())
        smtp.quit()
        print('邮件发送成功!\n%s'%sender)
    except:
        print('发送失败！\n%s'%sender)


if __name__ == '__main__':
    config(receiver=receiver, From=From, To=To, Subject=subject)

