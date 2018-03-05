#!/bin/bash

raw=$(ioreg -c AppleBacklightDisplay -r -d 1 | grep brightness | grep -o '"brightness"={"max"=[0-9]*,"min"=[0-9]*,"value"=[0-9]*}' | grep -o '{.*}' | sed 's/=/:/g')

echo $raw
