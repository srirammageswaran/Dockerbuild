#!/bin/bash


echo "killing all the containers"
docker ps | grep -v CONTAINER | awk '{print $1}' | xargs docker kill

echo "Removing the Residual Containers"
docker ps -a | grep -v CONTAINER | awk '{print $1}' | xargs docker rm

