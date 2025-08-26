# Managed by stow
export PATH=/opt/homebrew/bin:$PATH

# Enable auto CD and set CD path for easier navigation
setopt auto_cd
cdpath=($HOME/code)

# ---------- Environment Configuration Start ---------- #
# python3
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

# Go environment setup
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# ZSH configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"

# Homebrew prefix for sourcing specific packages
HOMEBREW_PREFIX=$(brew --prefix)

# ZSH plugins and themes
source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker)

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# FZF for fuzzy finding
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH compinit
autoload -U compinit && compinit

# Ruby Version Manager
export PATH="$PATH:$HOME/.rvm/bin"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  # This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# PNPM configuration
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
alias npm="pnpm"

# Kubernetes configuration
export KUBECONFIG="$HOME/.kube/config"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
alias k="kubectl"

# Docker BuildKit configuration
if command -v docker-buildx > /dev/null && [ ! -e ~/.docker/cli-plugins/docker-buildx ]; then
  mkdir -p ~/.docker/cli-plugins
  ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
fi

# Set k9s configuration
export K9S_CONFIG_DIR="$HOME/.config/k9s"

# Google Cloud SDK setup
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# AWS configuration
export AWS_PAGER=""

# Starship prompt customization
export SPACESHIP_KUBECONTEXT_SHOW=true
export SPACESHIP_KUBECTL_VERSION_SHOW=false
eval "$(starship init zsh)"

# SSH configuration
export PATH="/usr/local/opt/openssh/bin:$PATH"

# ---------- Environment Configuration End ---------- #

# ---------- Local Overrides ---------- #

# Load local overrides
if [ -f ~/.local.zsh ]; then
  source ~/.local.zsh
fi

# ---------- Local Overrides End ---------- #
. "$HOME/.local/bin/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
