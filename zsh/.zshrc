# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/joppeaarts/.zsh/completions:"* ]]; then export FPATH="/Users/joppeaarts/.zsh/completions:$FPATH"; fi
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME}/.local/share/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Path
export PATH=$PATH:/usr/local/go/bin:/Users/joppeaarts/zk:/home/joppe/nvim-linux64/bin:/home/joppe/.emacs.d/bin/

if [[ ! "$PATH" == */Users/joppeaarts/.fzf/bin* ]]; then
  PATH="${PATH}:/Users/joppeaarts/.fzf/bin"
fi
# fnm
FNM_PATH="/Users/joppeaarts/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/joppeaarts/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Variables
export ZK_NOTEBOOK_DIR=/Users/joppeaarts/stack/notes/
export EDITOR=nvim
export VISUAL="$EDITOR"
# "prettier" "biome"
export NVIM_FORMAT="prettier"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light jeffreytse/zsh-vi-mode

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# fzf-tab needs to be loaded after compinit
zinit light Aloxaf/fzf-tab
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias l="exa --group-directories-first --icons -F -T -L=1"
alias ll="ls -la"
alias work="cd /Users/joppeaarts/work"
alias tmp="cd /Users/joppeaarts/tmp"
alias pn="pnpm"
alias vim="nvim"
alias nano="nvim"
alias http-server="python3 -m http.server"
#alias volup="sh ~/scripts/volume_up"
#alias voldown="sh ~/scripts/volume_down"
#alias voltoggle="sh ~/scripts/toggle_mute"

# fnm
export FNM_COREPACK_ENABLED=true

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(fnm completions --shell zsh)"
eval "$(starship init zsh)"
