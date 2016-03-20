#!/usr/bin/env bash

HTTP_IP=0.0.0.0 HTTP_PORT=4567 APP_DIR=$(pwd) WORKING_DIR=$(pwd) HOME=$(pwd) emacs --daemon $*
