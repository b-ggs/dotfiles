#!/bin/bash

darwin_check=`uname -s`
if [[ $darwin_check != "Darwin" ]]; then
  echo "System is unsupported"
  exit 1
fi
status_line=`pmset -g batt | grep %`
status=`echo "${status_line}" | awk '{print $4}' | sed 's/;//g'`
percentage=`echo "${status_line}" |awk '{print $3}' | sed 's/;//g'`
remaining=`echo "${status_line}" | awk '{print $5}' | sed 's/;//g'`

echo "${status}@${percentage}@${remaining}"
