#!/usr/bin/env bash

IDLE=$(top -F -R -l3 | grep "CPU usage" | tail -1 | grep -Eo '\d+\.\d+% idle' | sed 's/% idle//')
USAGE_PCT=$(echo "100 - ${IDLE}" | bc -l)

printf "C:%.1f%%" "${USAGE_PCT}"
