# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Path
export PATH=$PATH:/usr/local/go/bin:/home/joppe/zk:/home/joppe/nvim-linux64/bin

if [[ ! "$PATH" == */home/joppe/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/joppe/.fzf/bin"
fi
# fnm
FNM_PATH="/home/joppe/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/joppe/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Variables
export ZK_NOTEBOOK_DIR=/mnt/extra/stack/notes/
export EDITOR=nvim
export VISUAL="$EDITOR"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# Load completions
autoload -Uz compinit && compinit

# fzf-tab needs to be loaded after compinit
zinit light Aloxaf/fzf-tab
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# eval "$(starship init zsh)"

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
alias pn="pnpm"
alias vim="nvim"
alias nano="nvim"
alias bat="batcat"

# fnm
export FNM_COREPACK_ENABLED=true

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd)"
#eval "$(fnm completions --shell zsh)"

