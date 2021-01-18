#!/bin/bash
# https://www.hostwinds.com/guide/create-use-htpasswd/

USER="user"

mkdir ./nginx_config/.htpasswd
htpasswd -c ./nginx_config/.htpasswd/code.htpasswd ${USER}