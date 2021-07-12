# docker-template

docker, nginx, .... dummy project

### Image build 
``` sh
docker build --platform linux/amd64 -t {Docker hub id}/docker-spring-test:0.0.1 .
# --platform : target system's architecture
```

### Check images
```
docker images
```

### Create and start container from image
``` sh
docker run -d -p 8080:8080 rimeilo324/docker-spring-test:0.0.1
# -d : run in the background
```

### Start or Stop, not Create
```
docker start {container id}
docker stop {container id}
```


### Push the image to Docker hub
``` sh
docker push rimeilo324/docker-spring-test:0.0.1
# docker push {Docker hub id}/{repo}:{tag}
```

### Pull from Docker hub
```
docker pull rimeilo324/docker-spring-test:0.0.1
# docker pull {Docker hub id}/{repo}:{tag}
```

