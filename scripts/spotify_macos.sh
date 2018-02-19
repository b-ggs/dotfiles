#!/bin/bash

darwin_check=`uname -s`
if [[ $darwin_check != "Darwin" ]]; then
  echo "System is unsupported"
  exit 1
fi
spotify_check=`ps aux | grep /Applications/Spotify.app/Contents/MacOS/Spotify | wc -l | awk '{$1=$1};1'`
if [[ $spotify_check == "1" ]]; then
  echo "Spotify is not running"
  exit 1
fi
status=`osascript -e 'tell application "Spotify" to player state as string'`
if [[ $status == 'playing' ]]; then
  title=`osascript -e 'tell application "Spotify" to name of current track as string'`
  artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`
  echo "${title} - ${artist}"
else
  echo "Spotify is ${status}"
fi
