# ===========================================
# Hrithik Chauhan's .zshrc - Clean & Modular
# ===========================================

# Force conda to take priority
export PATH="$HOME/miniconda3/condabin:$PATH"
# =============================
#         ZSH SETTINGS
# =============================

export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  fzf-tab
  docker
  aws
  terraform
  web-search
  zsh-interactive-cd
)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Prevent zsh from creating Zcompdump files
unsetopt EXTENDED_HISTORY

# =============================
#         ENV VARS
# =============================

export AWS_PROFILE=dev
export AWS_REGION=ap-south-1
export KUBECONFIG=~/.kube/config
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# =============================
#         ALIASES
# =============================

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias fsb='~/.config/scripts/fsb.sh'
alias fshow='~/.config/scripts/fshow.sh'

# GitHub
alias ghboard="gh dash"
alias ghr="gh pr review"
alias ghm="gh pr merge"

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Kubernetes
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs -f"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'

# Tmux
alias ta='tmux attach -t'
alias tn='tmux new-session -s '
alias tk='tmux kill-session -t '
alias tl='tmux list-sessions'
alias td='tmux detach'
alias tc='clear; tmux clear-history; clear'
alias tss=tmux-session-switch

# EZA
alias ls="eza --color=always --grid --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias la=tree

# Others
alias cat=bat
alias fzf='fzf --preview="bat --color=always {}"'

# =============================
#         FUNCTIONS
# =============================

# Tmux session switcher
 tmux-session-switch() {
  local session
  session=$(tmux list-sessions -F "#S" | fzf --prompt=" Pick a tmux session: " \
    --height=30% --layout=reverse --border=rounded)

  if [ -n "$session" ]; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session"
    else
      tmux attach-session -t "$session"
    fi
  fi
}

# Fuzzy cd
fcd() {
  local dir
  dir=$(find * -type d 2>/dev/null | fzf +m) && cd "$dir"
}

# =============================
#         COMPLETIONS
# =============================

# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Docker CLI completions
fpath=(/Users/hrithikchauhan/.docker/completions $fpath)

# Compinit (after plugin setup)
autoload -Uz compinit
compinit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# =============================
#         FZF SETTINGS
# =============================

# fzf-tab integration
zstyle ':completion:*' fzf-preview 'bat --color=always --style=header,grid {} 2>/dev/null || eza --color=always -l {}'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-flags --height=40% --layout=reverse --border --preview-window=right:50%
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu select

# fzf previews
export FZF_DEFAULT_OPS="--extended"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh

# Ctrl+R history search
bindkey '^R' fzf-history-widget

# =============================
#       STARSHIP PROMPT
# =============================

eval "$(starship init zsh)"

# =============================
#       CONDA INITIALISE
# =============================
eval "$(conda "shell.$(basename "${SHELL}")" hook)"


# Enable AWS module in Starship if AWS_PROFILE or AWS_REGION is set
if [[ -n "$AWS_PROFILE" || -n "$AWS_REGION" ]]; then
  export STARSHIP_CONFIG_DISABLE_MODULES=""
else
  export STARSHIP_CONFIG_DISABLE_MODULES="aws"
fi

# =============================
#     SYNTAX HIGHLIGHTING
# =============================

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# =============================
#         HISTORY
# =============================

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

# =============================
#         KUBECTL
# =============================

source <(kubectl completion zsh)

# FZF shell integration
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2025-11-19 19:52:27
export PATH="$PATH:/Users/hrithikchauhan/.local/bin"
