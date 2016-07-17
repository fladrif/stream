#!/bin/bash
TOPXY="60,30"
INRES="1280x720"
OUTRES="852x480"
BITRATE="64k"
FPS="10"
QUAL="medium"
STREAM_KEY=$(cat ./.twitch_key)
avconv \
	-f x11grab -s $INRES -i :0.0+$TOPXY \
	-f alsa -ac 2 -i pulse \
	-vcodec libx264 -s $OUTRES -b 480k -maxrate 480k -minrate 480k -bufsize 640k\
	-acodec libmp3lame -ar 11025 -threads 'auto' \
	-f flv "rtmp://live.twitch.tv/app/$STREAM_KEY"
