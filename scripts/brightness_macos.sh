#!/bin/bash

output=$(ioreg -c AppleBacklightDisplay -r -d 1 | grep -o '"brightness"={"max"=[0-9]*,"min"=[0-9]*,"value"=[0-9]*}' | grep -o '{.*}' | grep -o '"[a-z]*"=[0-9]*')

max=$(echo $output | head -1)
value=$(echo $output | tail -1)

echo $max
echo $value
