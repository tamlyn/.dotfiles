set --export EDITOR micro

thefuck --alias | source

eval (direnv hook fish)

alias ls="ls -laFGog"
alias watch="watch -ctn1"

set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

# ASDF version manager
source (brew --prefix asdf)/libexec/asdf.fish

# Android
set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set --export ANDROID_SDK_ROOT $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH /Applications/WebStorm.app/Contents/MacOS $PATH
