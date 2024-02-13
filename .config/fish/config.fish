set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish | source
#source /Users/ericli/opt/anaconda3/etc/fish/conf.d/conda.fish
source /Users/ericli/anaconda3/etc/fish/conf.d/conda.fish
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/ericli/anaconda3/bin/conda
    eval /Users/ericli/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

