#!/bin/bash
TOPXY="60,30"
INRES="1280x720"
OUTRES="852x480"
BITRATE="64k"
FPS="10"
QUAL="medium"
STREAM_KEY=$(cat ./.twitch_key)
avconv \
	-f x11grab -s $INRES -b "$BITRATE" -i $TOPXY \
	-f alsa -ac 2 -i pulse \
	-vcodec libx264 -s $OUTRES -preset $QUAL \
	-acodec libmp3lame -ar 44100 -threads 4 -qscale 4 -b 256k -bufsize 1024k \
	-f flv "rtmp://live.twitch.tv/app/$STREAM_KEY"
