
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
