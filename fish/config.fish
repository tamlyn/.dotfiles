set --export EDITOR micro

thefuck --alias | source

alias ls="ls -laFGog"
alias watch="watch -ctn1"

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal

  printf '\n$ '
end

function fish_right_prompt
    if test $CMD_DURATION
        # Show duration of the last command
        set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.2fs", $1 / $2}')
        echo $duration

        # OS X notification when a command takes longer than notify_duration
        set notify_duration 10000
        set exclude_cmd "bash|less|man|more|ssh"
        if begin
                test $CMD_DURATION -gt $notify_duration
                and echo $history[1] | grep -vqE "^($exclude_cmd).*"
            end

            # Only show the notification if iTerm is not focused
            echo "
                tell application \"System Events\"
                    set activeApp to name of first application process whose frontmost is true
                    if \"iTerm\" is not in activeApp then
                        display notification \"Finished in $duration\" with title \"$history[1]\"
                    end if
                end tell
                " | osascript
        end
    end
end