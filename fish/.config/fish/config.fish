# PATH (universal — safe outside interactive)
fish_add_path (brew --prefix ruby 2>/dev/null)/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /Users/chengji/.antigravity/antigravity/bin

set -g fish_greeting

if status is-interactive
    # Zoxide
    zoxide init fish | source

    # FZF
    fzf --fish | source

    # Aliases
    alias n nvim

    # Pet config (if a fish version exists)
    if test -f "$HOME/.config/fish/pet.fish"
        source "$HOME/.config/fish/pet.fish"
    end
end
