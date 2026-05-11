# PATH (universal — safe outside interactive)
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
else if test -x /usr/local/bin/brew
    /usr/local/bin/brew shellenv | source
end

if type -q brew
    fish_add_path (brew --prefix ruby)/bin
end
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

set -g fish_greeting

if status is-interactive
    # Zoxide
    if type -q zoxide
        zoxide init fish | source
    end

    # FZF
    if type -q fzf
        fzf --fish | source
    end

    # Aliases
    alias n nvim

    # Pet config (if a fish version exists)
    if test -f "$HOME/.config/fish/pet.fish"
        source "$HOME/.config/fish/pet.fish"
    end
end

# opencode
fish_add_path /Users/chengji/.opencode/bin
