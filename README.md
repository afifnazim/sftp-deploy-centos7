# sftp-deploy-centos7
Implementing a SFTP container using Docker 

### Create Dockerfile 
We will create a Dockerfile and build the image according this file. 
Dockerfile is provided in another file in this repo.

### Explanation of Dockerfile
- The ```openssh-server``` is needed to allow ssh/sftp/scp service inside the container
- ``useradd`` command is used to create new user
- ``sftpuserpasswordhere`` parameter is used to add secured password for the sftp-user
- Then we are going to ``EXPOSE`` the ssh port to ``22`` and bind it to port ``2o36``
- We created directory to keep the files in the container
- We need to give permission to the files as per required

### Build the image
We can build the image using below command - 
```
docker build -t sftp-image .
```

### Run the container
We will run the container using below command - 
```
docker run -d --name sftp-server -p 2036:22 sftp-image
```
In the above command we can change the ``--name`` tag as per our project

### Test the container
To test the container we can access it using browser and exposed port ``http://localhost:2036`` and we should be promted to put our sftp-user and password.
