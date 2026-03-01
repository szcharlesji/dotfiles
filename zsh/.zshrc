# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme (or set to "random" for random theme)
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

# ===== YOUR CUSTOM CONFIGURATION =====

# Zoxide
eval "$(zoxide init zsh)"

# FZF
source <(fzf --zsh)

# Aliases
alias n='nvim'

# Custom prompt (if you want to override OMZ theme, uncomment below)
# PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# Yazi function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ===== END CUSTOM CONFIGURATION =====
export PATH="$(brew --prefix ruby)/bin:$PATH"
