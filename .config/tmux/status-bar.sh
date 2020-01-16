#!/usr/bin/env bash

# tmux status bar based on the onehalfdark theme.

if [ "${COLORTERM}" = truecolor ] || [ "${COLORTERM}" = 24bit ]; then
    TMUX_COLOR_WHITE='#dcdfe4'
    TMUX_COLOR_LIGHT_GRAY='#5d677a'
    TMUX_COLOR_DARK_GRAY='#313640'
    TMUX_COLOR_PURPLE='#c678dd'
    TMUX_COLOR_GREEN='#98c379'
    TMUX_COLOR_YELLOW='#e5c07b'
    TMUX_COLOR_RED='#e06c75'
    TMUX_COLOR_BLUE='#61afef'
else
    TMUX_COLOR_WHITE='colour255'
    TMUX_COLOR_LIGHT_GRAY='colour243'
    TMUX_COLOR_DARK_GRAY='colour238'
    TMUX_COLOR_PURPLE='colour176'
    TMUX_COLOR_GREEN='colour114'
    TMUX_COLOR_YELLOW='colour180'
    TMUX_COLOR_RED='colour168'
    TMUX_COLOR_BLUE='colour75'
fi

TMUX_STATUS_COLOR="#{?client_prefix,${TMUX_COLOR_BLUE},${TMUX_COLOR_PURPLE}}"

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
tmux set -g status-left "#[fg=${TMUX_COLOR_DARK_GRAY},bg=${TMUX_STATUS_COLOR}] #S #[default] #(${HOME}/.config/tmux/mem-cpu.py '${TMUX_COLOR_GREEN}' '${TMUX_COLOR_YELLOW}' '${TMUX_COLOR_RED}')"
tmux set -g status-right "#[fg=${TMUX_STATUS_COLOR}]  %b %d  %H:%M #[fg=${TMUX_COLOR_DARK_GRAY},bg=${TMUX_STATUS_COLOR}] #h "
tmux setw -g window-status-format "#[fg=${TMUX_COLOR_LIGHT_GRAY}] #I:#W "
tmux setw -g window-status-current-format "#[fg=#{?window_zoomed_flag,${TMUX_COLOR_DARK_GRAY},${TMUX_COLOR_WHITE}},bg=#{?window_zoomed_flag,${TMUX_COLOR_GREEN},${TMUX_COLOR_LIGHT_GRAY}}] #I:#W "
