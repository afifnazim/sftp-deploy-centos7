FROM centos:centos7.7.1908

RUN yum update -y && yum install -y openssh-server

# Configure users
RUN useradd -rm -d /home/sftp_user -s /bin/bash -G sudo -u 10001 sftp_user 
RUN echo "sftp_user:SFTPUSERPASSWORDHERE" | chpasswd 

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# Configure directory for sftp use
RUN mkdir -p /var/sftp/uploads ## We can change the directory name as per required
RUN chown root:root /var/sftp
RUN chmod 755 /var/sftp
RUN chown sftp_user:sftp_user /var/sftp/uploads


# update to only allow sftp and not ssh tunneling to limit the non-necessary activity 
RUN echo '\n\
Match User sftp_user  \n\
ForceCommand internal-sftp \n\ 
PasswordAuthentication yes \n\ 
ChrootDirectory /var/sftp \n\ 
PermitTunnel no  \n\ 
AllowAgentForwarding no \n\ 
AllowTcpForwarding no \n\ 
X11Forwarding no ' >> /etc/sshd/sshd_config 
