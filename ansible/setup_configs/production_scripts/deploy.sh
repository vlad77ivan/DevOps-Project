#!/bin/bash

docker rm -f $(docker ps -aq --filter name=helloworld) 2>/dev/null

docker run --name helloworld -d -it -p 8888:8080 --restart always vlad0297/helloworld-maven
