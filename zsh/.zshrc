# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions docker aws terraform web-search zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

# Prevent zsh from creating Zcompdump files 
unsetopt EXTENDED_HISTORY

# Env Variables for AWS
export AWS_PROFILE=dev
export AWS_REGION=ap-south-1

#gh-dash
alias ghboard="gh dash"
alias ghr="gh pr review"
alias ghm="gh pr merge"

#Git
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

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# K8S
export KUBECONFIG=~/.kube/config
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
alias podname=''

# Tmux 
alias ta='tmux attach -t'
alias tn='tmux new-session -s '
alias tk='tmux kill-session -t '
alias tl='tmux list-sessions'
alias td='tmux detach'
alias tc='clear; tmux clear-history; clear'
alias tss=tmux-session-switch

# EZA ->
alias ls="eza --color=always --grid --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

alias la=tree
alias cat=bat
alias fzf='fzf --preview="bat --color=always {}"'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1

#Tmux list-sessions into fzf 
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

# Enable shell autocompletion
source <(kubectl completion zsh)

# setup fzf key bindings and fuzzy completition
source <(fzf --zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

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

# Enable AWS module in Starship if AWS_PROFILE or AWS_REGION is set
if [[ -n "$AWS_PROFILE" || -n "$AWS_REGION" ]]; then
  export STARSHIP_CONFIG_DISABLE_MODULES=""
else
  export STARSHIP_CONFIG_DISABLE_MODULES="aws"
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

# Search previous commands from history 
bindkey '^R' fzf-history-widget

# fzf mapping with cd command
fcd() {
    local dir
    dir=$(find * -type d 2>/dev/null | fzf +m) && cd "$dir"
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Docker CLI completions
fpath=(/Users/hrithikchauhan/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Zoxide - smarter cd
eval "$(zoxide init --cmd cd zsh)"

# 🚀 Starship prompt initialization
eval "$(starship init zsh)"

