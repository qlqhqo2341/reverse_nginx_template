#!/bin/sh
# nginx config reload

CONTAINER_NAME='nginx'
DOCKER_PS_CONTAINER_CNT=`docker ps -a | awk '{print $NF}' | grep ${CONTAINER_NAME} | wc -l`

if [ ${DOCKER_PS_CONTAINER_CNT} = '1' ]; then
    echo 'nginx container exists. reload'
    docker exec ${CONTAINER_NAME} nginx -s reload
else
    echo 'nginx container does not exists.'
fi;

