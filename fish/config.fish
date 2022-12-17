# Switch to Chinese Language Mode
set -gx LC_ALL 'zh_CN.UTF-8'
set -gx LANG 'zh_CN.UTF-8'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Python Poetry
set -gx POETRY_HOME /opt/poetry
set -gx PATH $PATH $POETRY_HOME/bin

# Homebrew
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Enable TrueColor
set -gx COLORTERM "truecolor"
set -gx fish_term24bit 1

# User's abbreviations
abbr -ga lg lazygit
