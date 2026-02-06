# Docker-Jenkins Project

![alt text](image.png)

![alt text](image-1.png)
# Terminolgies

1. Dockerfile -> Docker Image -> Docker Conatainer 

```
2. sudo apt-get update
3. sudo apt-get install docker.io
4. sudo apt-get install docker-compose-v2
5. docker --version
6. sudo systemctl status docker
7. sudo usermod -aG docker $USER
8. sudo newgrp docker
9. docker ps

10. RUN -> is build time command
11. CMD/ENTRYPOINT -> run-time commands -> array of string

```

# Online-shop Dockerfile

```
# Getting the base image
FROM node:18

# Setting the working directory
WORKDIR /app

# copy everything to the container
COPY . .

# Install dependencies
RUN npm install 

# Expose the port the app runs on
EXPOSE 5173

# serve the app
CMD ["npm", "run", "dev"]

```

```
1. docker build -t online_shop:latest .
2. docker images

3. docker run -d -p 5173:5173 online_shop:latest
4. docker ps
5. docker logs <container-id>
6. Edit the inbound traffic for port:5173
7. docker stop <container-id>
8. docker rm <container-id>

```

# Scenario -> I want to persist the logs of the container inside my host machine inside a folder

```
1. mkdir volume
2. cd volume
3. mkdir online_shop
4. docker run -d -p 5173:5173 -v /home/ubuntu/volume/online_shop:/logs --name online_shop_app online_shop:latest
5. docker exec -it 47cc666ea7c5 bash
6. cd /logs
7. echo "this is a log line" > app.log
8. echo "this is also log line" >> app.log
9. exit
10. docker stop 47cc666ea7c5
11. docker rm <container-id>
12. But, logs will be in: cat voloume/online_shop/app.log


```


# Docker Network
1. If container want to communicate with each other then, they need to be in the same newtwork -> bridge network (default).

2. Completely isolated container -> network: none
3. When the container runs on the same network as the host system -> network: host -> jaisa host ka port:80 | waisa container ka port:80 -> no port mapping needed

4. Bridge network -p 5173 ---- -p 5173 
5. user-defined bridge -> docker network create my-net
6. docker run --network -> to give network to container
7. IPVLAN -> when container are running on different host machines.
8. MACVLAN -> same as above but using the mac-address
9. OVERLAY -> in docker swarm cluster

```
1. docker network create my-net
2. docker network ls
3. docker inspect my-net
4. docker run -d --network my-net -p 80:80 --name nginx nginx:latest 

5. docker run -d --network my-net -p 5173:5173 --name online_shop_cnt online_shop:latest

6. Both the containers are in the same network so, they can access each other.

7. docker exec -it 81177e9aa986 bash  ->  <online-shop>
8.  curl http://nginx:80 -> container - IP address



```

