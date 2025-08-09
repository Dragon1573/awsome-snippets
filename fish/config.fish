# Switch to Chinese Language Mode

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Enable TrueColor
set -gx COLORTERM "truecolor"
set -gx fish_term24bit 1

# User's abbreviations
abbr -ga lg lazygit
abbr -ga neofetch 'yarn exec neowofetch'
