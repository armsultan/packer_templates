#!/bin/sh

user=armand

# set a default HOME_DIR environment variable if not set
HOME_DIR="/home/$user";
adduser -D -H -h $HOME_DIR $user
echo $user:$user | chpasswd