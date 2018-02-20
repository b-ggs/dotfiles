#!/bin/bash

status_line=`pmset -g batt | grep %`
status=`echo "${status_line}" | awk '{print $4}' | sed 's/;//g'`
percentage=`echo "${status_line}" | awk '{print $3}' | sed 's/;//g'`
remaining=`echo "${status_line}" | awk '{print $5}' | sed 's/;//g'`

resp='{ '
resp="${resp}\"status\": \"${status}\", "
resp="${resp}\"percentage\": \"${percentage}\", "
resp="${resp}\"remaining\": \"${remaining}\""
resp="${resp} }"

echo $resp
