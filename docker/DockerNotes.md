
#DockerHub

```
docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname
```

### Make Dockerfile
```
cat > Dockerfile <<EOF
FROM busybox
CMD echo "DSMS - Test Image"
EOF
```
###Build
```
docker build -t wavescholar/data-science-microservices .
```
#### Push to Microservices Docker Repository
```
docker push wavescholar/data-science-microservices:tagname
```

### List and Display Commands

```
docker
docker container --help

docker version
sudo docker info

## Execute Docker image
sudo docker run hello-world

## List Docker images
sudo docker image ls

## List Docker containers (running, all, all in quiet mode)
sudo docker container ls
sudo docker container ls --all
sudo docker container ls -aq
```

Run a simple embedded Linux image, list active docker images, and remove the cached container instances
```
docker pull busybox
docker run -it busybox sh
docker ps -a
docker rm 9224d285f0da
docker container prune
docker stop $(docker ps -a -q) #STOP ALL
docker rm $(docker ps -a -q) #REMOVE ALL
docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
docker exec -it CONTAINER #log into
```

##Base Images
These are maintained by our friends at DockerHub.

Docker Ubuntu
```
docker pull ubuntu:18.04
```

Suppose we want to host a Python Flask App.
```
python:3-onbuild
```
The onbuild images include multiple ONBUILD triggers, which should be all you need to bootstrap most applications. The build will COPY a requirements.txt file, RUN pip install on said file, and then copy the current directory into /usr/src/app. The onbuild version of the image includes helpers that automate the boring parts of getting an app running. Rather than doing these tasks manually (or scripting these tasks), these images do that work for you. We now have all the ingredients to create our own image - a functioning web app and a base image. This is all accomplished through the Dockerfile.

Dockerfile:
```
FROM python:3-onbuild
EXPOSE 5000 #Port We're going to run the Flask App on
CMD ["python", "./app.py"]
```

Run ```docker build .``` to create a Docker image from a Dockerfile.

Make sure the requirements.txt is in the build location   
The simple flask one has only one line : ```Flask==0.10.1```
To build and push the image to DockerHub :
```
docker build -t wavescholar/test .
docker push wavescholar/test:latest
```
Now run the image.
```
docker run -p 8888:5000 wavescholar/test
```



## More complicated Dockerfile

```
FROM centos:7

RUN yum -y update && \

yum -y install httpd && \

yum clean all

# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```
