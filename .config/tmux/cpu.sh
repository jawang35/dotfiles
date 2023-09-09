#!/usr/bin/env bash

IDLE=$(top -F -R -l3 | grep "CPU usage" | tail -1 | grep -Eo '\d+\.\d+% idle' | sed 's/% idle//')
USAGE_PCT=$(echo "100 - ${IDLE}" | bc -l)

if [ "$(echo "${USAGE_PCT} < 30" | bc -l)" == 1 ]; then
    COLOR="${TMUX_COLOR_GREEN}"
elif [ "$(echo "${USAGE_PCT} < 80" | bc -l)" == 1 ]; then
    COLOR="${TMUX_COLOR_YELLOW}"
else
    COLOR="${TMUX_COLOR_RED}"
fi

BAR=$(spark 0 100 "${USAGE_PCT}" | grep -o '.$')

echo "#[fg=${TMUX_COLOR_FG_1}]C:#[fg=${COLOR}]${BAR}"
