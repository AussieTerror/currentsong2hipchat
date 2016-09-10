#!/bin/bash

#Set log path - enter your enter your currentsong file path here, as per the example below
log=/shared/sf_currentsong/song.txt

#Hipchat API URL , replace [ROOM_ID] with your room id is an integer and [AUTH_TOKEN] with your rooms Notification Authentication Token 
api_url='https://api.hipchat.com/v2/room/[ROOM_ID]/notification?auth_token=[AUTH_TOKEN]'

#Tail the currentsong file for song title changes from the specified log path and set the latest line as the $line variable, then post $line to the api_url with Hipchat formatting
tail -f $log|while read line;do

    msg=`echo "$line" -`
    echo 'Got' $msg
    curl $api_url -vv -d "room_id=ops&from=CurrentSong&notify=1&color=purple&message_format=text" --data-urlencode "message=$msg"

done




