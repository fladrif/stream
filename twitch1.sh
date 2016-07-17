#!/bin/bash
TOPXY="60,30"
INRES="1280x720"
OUTRES="852x480"
BITRATE="64k"
FPS="10"
QUAL="medium"
STREAM_KEY=$(cat ./.twitch_key)
avconv \
	-f video4linux2 -s $INRES -i /dev/video1 \
	-f alsa -ac 2 -i pulse \
	-vcodec libx264 -s $OUTRES -b 320k -maxrate 320k -minrate 320k -bufsize 640k\
	-acodec libmp3lame -ar 44100 -threads 4 \
	-f flv "rtmp://live.twitch.tv/app/$STREAM_KEY"
