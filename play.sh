#!/bin/bash
. .config
cat video.dat | mplayer - -demuxer rawvideo -rawvideo w=376:h=240:format=y8:fps=100 -vo x11

