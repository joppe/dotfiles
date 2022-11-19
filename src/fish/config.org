if status is-interactive
    # Commands to run in interactive sessions can go here
end

status --is-interactive; and source (nodenv init -|psub)

starship init fish | source

alias l="exa --group-directories-first --icons -F -T -L=1"
alias ll="ls -la"
