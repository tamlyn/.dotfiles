set --export EDITOR micro

thefuck --alias | source

eval (direnv hook fish)

alias ls="ls -laFGog"
alias watch="watch -ctn1"

#source /usr/local/anaconda3/etc/fish/conf.d/conda.fish
#set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths

#status --is-interactive; and source (rbenv init -|psub)
#status --is-interactive; and . (pyenv init -|psub)

set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

#set -g fish_user_paths "/usr/local/opt/php@7.4/bin" $fish_user_paths
#set -g fish_user_paths "/usr/local/opt/php@7.4/sbin" $fish_user_paths
# ghcup-env
#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
#test -f /Users/tamlyn/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/tamlyn/.ghcup/bin $PATH
