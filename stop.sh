#!/usr/bin/env bash
HTTP_PORT=4567 HOME=$(pwd) emacsclient -e "(progn (require 'elnode) (elnode-stop (string-to-number (getenv \"HTTP_PORT\"))) (kill-emacs))"
