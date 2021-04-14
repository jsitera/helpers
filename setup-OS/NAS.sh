#sftp server
#===========

#directory
# All components of the pathname must be root-owned directories that are not writable 
# by any other user or group.
# If you want writtable part for the user, create subdirectory
mkdir /backup
# create sftp only users
groupadd sftpusers
useradd -g sftpusers -d /backup/user1 -s /usr/sbin/nologin user1
passwd user1
mkdir /backup/user1
mkdir /backup/user1/data
chown user1:user1 /backup/user1/data
# sshd config
# modify subsystem sftp
#Subsystem      sftp    /usr/libexec/openssh/sftp-server
Subsystem       sftp    internal-sftp
# add match for sftupsers group
Match Group sftpusers
        ChrootDirectory /backup/%u
        ForceCommand internal-sftp
        PasswordAuthentication yes

# samba server
# ============
apt install docker.io
cd /root
use docker-compose https://github.com/jsitera/helpers/tree/master/samba
