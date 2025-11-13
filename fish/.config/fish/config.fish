if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables
set -Ux ZK_NOTEBOOK_DIR /home/joppe/stack/notes/
set -Ux EDITOR nvim
set -Ux VISUAL "$EDITOR"
# "prettier" "biome"
set -Ux NVIM_FORMAT "prettier"

# Aliases
alias l="exa --group-directories-first --icons -F -T -L=1"
alias work="cd /home/joppe/work"
alias tmp="cd /home/joppe/tmp"
alias pn="pnpm"
alias vim="nvim"
alias nano="nvim"
alias http-server="python3 -m http.server"

set -g fish_key_bindings fish_vi_key_bindings

starship init fish | source
fnm env --use-on-cd --shell fish | source
