# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins for comprehensive completions
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
  kubectl
  npm
  node
  pip
  python
  rust
  golang
  sudo
  command-not-found
  colored-man-pages
  extract
  z
  dirhistory
  copyfile
  copypath
  web-search
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Zoxide
eval "$(zoxide init zsh)"

# FZF
source <(fzf --zsh)

# Aliases
alias n='nvim'

# Yazi function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Source secrets (not managed by stow)
if [ -f "$HOME/.secrets/.env" ]; then
  source "$HOME/.secrets/.env"
fi

export PATH="$(brew --prefix ruby)/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Added by Antigravity
export PATH="/Users/chengji/.antigravity/antigravity/bin:$PATH"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
