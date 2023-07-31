# sftp-deploy-centos7
Implementing a SFTP container using Docker 

### Create Dockerfile 
We will create a Dockerfile and build the image according this file. 
Dockerfile is provided in another file in this repo.

### Explanation of Dockerfile
- The ```openssh-server``` is needed to allow ssh/sftp/scp service inside the container
- ``useradd`` command is used to create new user
- ``sftppasswordhere`` parameter is used to add secured password for the sftp-user
- 
