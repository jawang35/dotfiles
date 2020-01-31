#!/usr/bin/env bash

PAGES=$(vm_stat | sed 's/\.//')
FREE=$(echo "${PAGES}" | grep 'Pages free' | awk '{print $NF}')
ACTIVE=$(echo "${PAGES}" | grep 'Pages active' | awk '{print $NF}')
INACTIVE=$(echo "${PAGES}" | grep 'Pages inactive' | awk '{print $NF}')
SPECULATIVE=$(echo "${PAGES}" | grep 'Pages speculative' | awk '{print $NF}')
OCCUPIED_BY_COMPRESSOR=$(echo "${PAGES}" | grep 'Pages occupied by compressor' | awk '{print $NF}')
WIRED=$(echo "${PAGES}" | grep 'Pages wired down' | awk '{print $NF}')

USED=$(echo "${ACTIVE} + ${WIRED}" | bc -l)
TOTAL=$(echo "${FREE} + ${ACTIVE} + ${INACTIVE} + ${SPECULATIVE} + ${OCCUPIED_BY_COMPRESSOR} + ${WIRED}" | bc -l)
USED_PCT=$(echo "100 * ${USED} / ${TOTAL}" | bc -l)

if [ "$(echo "${USED_PCT} < 75" | bc -l)" == 1 ]; then
    COLOR="${TMUX_COLOR_GREEN}"
elif [ "$(echo "${USED_PCT} < 90" | bc -l)" == 1 ]; then
    COLOR="${TMUX_COLOR_YELLOW}"
else
    COLOR="${TMUX_COLOR_RED}"
fi

BAR=$(spark 0 100 "${USED_PCT}" | grep -o '.$')

echo "#[fg=${TMUX_COLOR_LIGHT_GRAY}]M:#[fg=${COLOR}]${BAR}"
