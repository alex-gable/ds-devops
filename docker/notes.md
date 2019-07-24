
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
