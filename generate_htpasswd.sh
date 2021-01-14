#!/bin/bash
# https://www.hostwinds.com/guide/create-use-htpasswd/

USER="user"
htpasswd -c ./nginx_config/.htpasswd/code.htpasswd ${USER}