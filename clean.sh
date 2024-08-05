#!/bin/bash

docker stop $(docker ps -qa)
docker system prune -f -a --volume
docker volume prune -f -a