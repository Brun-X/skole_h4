#/bin/sh

sudo apt-get install vsftpd -y
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
sudo adduser vsftpd
sudo chown nobody:nogroup /home/pi
sudo chmod 777 /home/pi
sudo mkdir /home/pi/ftp_backup
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

sudo echo "listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
pasv_enable=Yes
pasv_min_port=10000
pasv_max_port=11000
user_sub_token=$USER
local_root=/home/pi
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" > /etc/vsftpd.conf

sudo echo "vsftp" > /etc/vsftpd.userlist
sudo systemctl restart vsftpd
