#! /bin/bash
 
VBR="1500k"
FPS="30"
QUAL="ultrafast"
TWITTER_URL="rtmp://de.pscp.tv:80/x"
TWITTER_KEY="XXXXXXXXXX"
VIDEO_SOURCE="sample.jpg"
AUDIO_SOURCE="sample.mp3"
AUDIO_ENCODER="aac"
 
ffmpeg \
 -loop 1 \
 -re \
 -framerate $FPS \
 -i "$VIDEO_SOURCE" \
 -thread_queue_size 512 \
 -i "$AUDIO_SOURCE" \
 -c:v libx264 -tune stillimage -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS *2)) -b:v $VBR \
 -c:a $AUDIO_ENCODER -threads 6 -ar 44100 -b:a 128k -bufsize 512k -pix_fmt yuv420p \
 -f flv $TWITTER_URL/$TWITTER_KEY
