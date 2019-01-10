

yum install curlftpfs


nano /etc/fstab


curlftpfs#ftpUsername:ftpPassword@ftpUrl /localDirectory fuse rw,uid=1000,umask=0777,user,suid,allow_other,exec,auto,utf8  0   1
