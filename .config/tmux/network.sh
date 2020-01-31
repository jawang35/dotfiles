#!/usr/bin/env bash

NETWORK_IO=$(ifstat -awTSq 1 1 | tail -n1)
DOWNLOAD=$(echo "${NETWORK_IO}" | awk '{print $(NF-1)}')
DOWNLOAD_RATE=KB/s
DOWNLOAD_COLOR="${TMUX_COLOR_GREEN}"
UPLOAD=$(echo "${NETWORK_IO}" | awk '{print $NF}')
UPLOAD_RATE=KB/s
UPLOAD_COLOR="${TMUX_COLOR_GREEN}"

if [ "$(echo "${DOWNLOAD} >= 100000" | bc -l)" == 1 ]; then
    DOWNLOAD=$(echo "${DOWNLOAD} / 1000000" | bc -l)
    DOWNLOAD_RATE=GB/s
    DOWNLOAD_COLOR="${TMUX_COLOR_RED}"
elif [ "$(echo "${DOWNLOAD} >= 100" | bc -l)" == 1 ]; then
    DOWNLOAD=$(echo "${DOWNLOAD} / 1000" | bc -l)
    DOWNLOAD_RATE=MB/s
    DOWNLOAD_COLOR="${TMUX_COLOR_YELLOW}"
fi

if [ "$(echo "${UPLOAD} >= 100000" | bc -l)" == 1 ]; then
    UPLOAD=$(echo "${UPLOAD} / 1000000" | bc -l)
    UPLOAD_RATE=GB/s
    UPLOAD_COLOR="${TMUX_COLOR_RED}"
elif [ "$(echo "${UPLOAD} >= 100" | bc -l)" == 1 ]; then
    UPLOAD=$(echo "${UPLOAD} / 1000" | bc -l)
    UPLOAD_RATE=MB/s
    UPLOAD_COLOR="${TMUX_COLOR_YELLOW}"
fi

printf "#[fg=${TMUX_COLOR_LIGHT_GRAY}] #[fg=${DOWNLOAD_COLOR}]%.1f${DOWNLOAD_RATE} #[fg=${TMUX_COLOR_LIGHT_GRAY}] #[fg=${UPLOAD_COLOR}]%.1f${UPLOAD_RATE}" "${DOWNLOAD}" "${UPLOAD}"
