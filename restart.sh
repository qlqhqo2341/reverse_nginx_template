#!/bin/sh
# nginx container restart.

WORKSPACE="/home/pi/app"
NGINX_CONFIG="${WORKSPACE}/nginx/nginx_config/nginx.conf"
NGINX_CONFIG_CONFD="${WORKSPACE}/nginx/nginx_config/conf.d"
NGINX_CONFIG_HTPASSWD="${WORKSPACE}/nginx/nginx_config/.htpasswd"
NGINX_CONFIG_DHPARAM="${WORKSPACE}/nginx/nginx_config/dhparam.pem"
NGINX_WEBDAV="${WORKSPACE}/webdav"
CONTAINER_NAME="nginx"
DOCKER_PS_CONTAINER_CNT=`docker ps -a | awk '{print $NF}' | grep ${CONTAINER_NAME} | wc -l`

if [ ${DOCKER_PS_CONTAINER_CNT} = '1' ]; then
    echo 'nginx container exists. delete it'
    docker rm -f  ${CONTAINER_NAME}
fi;

echo 'nginx container create'
docker run -dt -p 80:80 -p 443:443 --name ${CONTAINER_NAME} \
--restart unless-stopped \
-v ${NGINX_CONFIG}:/etc/nginx/nginx.conf:ro \
-v ${NGINX_CONFIG_CONFD}:/etc/nginx/conf.d:ro \
-v ${NGINX_CONFIG_HTPASSWD}:/etc/nginx/.htpasswd:ro \
-v ${NGINX_CONFIG_DHPARAM}:/etc/nginx/dhparam.pem:ro \
-v /var/log/nginx/:/var/log/nginx/ \
-v /var/cache/jenkins/war:/var/cache/jenkins/war:ro \
-v /var/lib/jenkins/:/var/lib/jenkins/:ro \
-v /etc/letsencrypt:/etc/letsencrypt:ro \
-v ${NGINX_WEBDAV}:/webdav \
-e TZ='Asia/Seoul' \
nginx:alpine

