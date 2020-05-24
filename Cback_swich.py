import telnetlib
import datetime
import time



def login_telnet(Host, username, password, finish, commands):

        tn = telnetlib.Telnet(Host, port=23, timeout=20)
        tn.set_debuglevel(2)

        tn.read_until(b'Username:')
        tn.write(username.encode('ascii') + b"\n")

        tn.read_until(b'Password:')
        tn.write(password.encode('ascii') + b"\n")

        tn.read_until(b'') #等待字符出现
        file_object = open(filepath, 'wb')
        for command in commands:
                tn.write(command.encode('ascii') + b"\n")
                time.sleep(2)
                for i in range(0, 20):
                        time.sleep(1)
                        tn.write(b" ")
                time.sleep(1)
                result = tn.read_very_eager()

                file_object.write(result)
                print('Finish.............')


        file_object.close()
        tn.close()




if __name__ == '__main__':
        Host = ''#账号
        username = ''#账号
        password = ''#密码
        finish = ''#等待此字符出现（可不输入）
        date = datetime.datetime.now()
        filepath = '/home/%s'%date#保存路径
        commands = ['dis cur']#输入命令
        login_telnet(Host, str(username), password, finish, commands) # 主机 用户 密码 等待字符 命令
