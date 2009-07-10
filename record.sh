#!/bin/bash
. .config
echo Displaying live video from $CONFIG_TARGET_IP
nc $CONFIG_TARGET_IP 8111 > video.dat
