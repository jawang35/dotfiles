#!/usr/bin/env bash

# tmux status bar based on the onehalfdark theme.

if [ "${COLORTERM}" = truecolor ] || [ "${COLORTERM}" = 24bit ]; then
    TMUX_COLOR_WHITE='#dcdfe4'
    TMUX_COLOR_LIGHT_GRAY='#5d677a'
    TMUX_COLOR_DARK_GRAY='#313640'
    TMUX_COLOR_PURPLE='#c678dd'
else
    TMUX_COLOR_WHITE='colour255'
    TMUX_COLOR_LIGHT_GRAY='colour243'
    TMUX_COLOR_DARK_GRAY='colour238'
    TMUX_COLOR_PURPLE='colour176'
fi

TMUX_STATUS_COLOR="${TMUX_COLOR_PURPLE}"

tmux set -g status-justify 'centre'
tmux set -g status 'on'
tmux set -g status-left-style 'none'
tmux set -g status-interval '1'
tmux set -g message-command-style "fg=${TMUX_COLOR_WHITE}"
tmux set -g message-command-style "bg=${TMUX_COLOR_LIGHT_GRAY}"
tmux set -g status-right-style 'none'
tmux set -g pane-active-border-style "fg=${TMUX_STATUS_COLOR}"
tmux set -g status-style "none,bg=${TMUX_COLOR_DARK_GRAY}"
tmux set -g message-style "fg=${TMUX_COLOR_WHITE},bg=${TMUX_COLOR_LIGHT_GRAY}"
tmux set -g pane-border-style "fg=${TMUX_COLOR_LIGHT_GRAY}"
tmux set -g status-right-length '100'
tmux set -g status-left-length '100'
tmux setw -g window-status-activity-style "none"
tmux setw -g window-status-separator ''
tmux setw -g window-status-style "none,fg=${TMUX_COLOR_WHITE},bg=${TMUX_COLOR_DARK_GRAY}"
tmux set -g status-left "#[fg=${TMUX_COLOR_DARK_GRAY},bg=${TMUX_STATUS_COLOR}]#{?client_prefix,, }#S #[default]#[fg=${TMUX_STATUS_COLOR}] #(~/.config/tmux/network.sh)"
tmux set -g status-right "#[fg=${TMUX_STATUS_COLOR}] #(~/.config/tmux/memory.sh) #(~/.config/tmux/cpu.sh) #[fg=${TMUX_COLOR_DARK_GRAY},bg=${TMUX_STATUS_COLOR}] #h "
tmux setw -g window-status-format "#[fg=${TMUX_COLOR_LIGHT_GRAY}] #I:#W "
tmux setw -g window-status-current-format "#[fg=${TMUX_COLOR_WHITE},bg=${TMUX_COLOR_LIGHT_GRAY}] #{?window_zoomed_flag,,#I}:#W "
