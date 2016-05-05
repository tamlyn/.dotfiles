#!/bin/sh

# Install Docker toolbox
brew install docker docker-machine docker-compose

# Create virtual machine
docker-machine create --driver virtualbox default
eval "$(docker-machine env default)"

# Install databases
#docker create --name=redis redis
#docker create --name=mysql mysql
#docker create --name=mongo mongo
