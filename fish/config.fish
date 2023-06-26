if status is-interactive
    # Commands to run in interactive sessions can go here
end

status --is-interactive; and source (nodenv init -|psub)

set -gx EDITOR nvim

starship init fish | source

alias l="exa --group-directories-first --icons -F -T -L=1"
alias ll="ls -la"

zoxide init fish | source
