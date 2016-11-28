#!/bin/bash
pmset -g batt | awk 'FNR == 2 {print $5}'
