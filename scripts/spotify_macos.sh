#!/bin/bash

spotify_check=`ps aux | grep Spotify | grep -v grep | grep -v Helper | wc -l`
if [[ $spotify_check -eq 0 ]]; then
  echo '{ "state": "not running" }'
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
