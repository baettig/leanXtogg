leanXtogg
Author:  Reto Bättig
License: Lesser GPL V3
Oscar-Version: v1.3-p1

Description
-----------

LeanXtogg is a very simple application for streaming Video (uncompressed).
It allows the following basic tasks

o Watch a live video stream in Windows or Linux (using nc and mplayer)
o Save live images to a harddisk as .BMP
o Save video the a harddisk (uncompressed)
o Play video from the harddisk
o Watch live images over the web browser (one Image every 5 seconds)

How it works
------------

Client can connect with a TCP connection to port 8111. As soon as a client is connected, the camera sends the raw image data over the TCP connection. Multiple clients can connect at the same time, it just slows down the frame rate.

To receive the stream on a client, nc (netcat) can be used. The following command receives the stream and writes it to a file (Video recording)

 nc 192.168.1.10 8111 > video.dat

If you want to play the video, simply play the raw data with mplayer:
 
 cat test.dat| mplayer - -demuxer rawvideo -rawvideo w=752:h=480:format=y8:fps=100 -vo x11

If you just want to play a live video stream, you connect to the camera with nc and pipe the data directly to mplayer:

 nc 192.168.1.10 8111 | mplayer - -demuxer rawvideo -rawvideo w=752:h=480:format=y8:fps=100 -vo x11


Installation and usage
----------------------
 make config
 make
 make deploy
 
Run leanXstream on camera:

 telnet 192.168.1.10
 cd /root
 #(kill all applications that are still running and using the camera, eg. with the following line:)
 killall *target
 ./leanXtogg_target

In the linux virtualbox
 # Play live video stream
 nc 192.168.1.10 8111 | mplayer - -demuxer rawvideo -rawvideo w=752:h=480:format=y8:fps=100 -vo x11

 # Save video stream to file
 nc 192.168.1.10 8111 > video.dat
 
 # Replay the recorded video
 cat test.dat| mplayer - -demuxer rawvideo -rawvideo w=752:h=480:format=y8:fps=100 -vo x11

Using it with MS Windows
------------------------

There are nc and mplayer versions precompiled for windows. Just download them and use the same commands as above.

Enyoy!
