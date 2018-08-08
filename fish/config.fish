set --export EDITOR micro
set -gx PATH $HOME/.cargo/bin $HOME/opt/bin $PATH

thefuck --alias | source

alias ls="ls -laFGog"
alias watch="watch -ctn1"

status --is-interactive; and source (rbenv init -|psub)

set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish