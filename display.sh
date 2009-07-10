#!/bin/bash
. .config
echo Displaying live video from $CONFIG_TARGET_IP
nc $CONFIG_TARGET_IP 8111 | mplayer - -demuxer rawvideo -rawvideo w=376:h=240:format=y8:fps=100 -vo x11
