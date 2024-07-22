#!/bin/bash

#Navigate to the directory containing the docker-compose.yml file
cd /home/home-server/Containers/surfshark-qbittorrent

#create the docker network if it doesn't exist
docker network create gluetun-network || true

#if there were any changes let's build the container
docker-compose build

# Start the Docker Compose
docker-compose up -d

