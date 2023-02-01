# Switch to Chinese Language Mode
set -gx LC_ALL 'zh_CN.utf8'
set -gx LANG 'zh_CN.utf8'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Python Poetry
set -gx POETRY_HOME /opt/poetry
set -gx PATH $PATH $POETRY_HOME/bin

# Enable TrueColor
set -gx COLORTERM "truecolor"
set -gx fish_term24bit 1

# User's abbreviations
abbr -ga lg lazygit
abbr -ga neofetch 'yarn exec neowofetch'
