#!/bin/bash

spotify_check=`ps aux | grep /Applications/Spotify.app/Contents/MacOS/Spotify | wc -l | awk '{$1=$1};1'`
if [[ $spotify_check == "1" ]]; then
  echo '{"state": "not running"}'
  exit 1
fi

state=`osascript -e 'tell application "Spotify" to player state as string'`
title=`osascript -e 'tell application "Spotify" to name of current track as string'`
artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`

resp='{ '
resp="${resp}\"state\": \"${state}\", "
resp="${resp}\"title\": \"${title}\", "
resp="${resp}\"artist\": \"${artist}\""
resp="${resp} }"

echo $resp
