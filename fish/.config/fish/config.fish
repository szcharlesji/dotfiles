# NYU HPC modules + conda for fish, lazy-loaded for fast startup
function __nyu_lmod_init
    if not functions -q __nyu_lmod_real_module
        if test -f /share/apps/lmod/init/fish
            functions -e module
            source /share/apps/lmod/init/fish
            if functions -q module
                functions -c module __nyu_lmod_real_module
            end
        end
    end
end

function module
    __nyu_lmod_init
    if functions -q __nyu_lmod_real_module
        __nyu_lmod_real_module $argv
    else
        echo "module: Lmod init not found" >&2
        return 127
    end
end

function __nyu_conda_init
    __nyu_lmod_init
    if functions -q __nyu_lmod_real_module
        __nyu_lmod_real_module load anaconda3/2025.06
    else
        return 127
    end

    if test -x /share/apps/anaconda3/2025.06/bin/conda
        /share/apps/anaconda3/2025.06/bin/conda shell.fish hook | source
        return 0
    end

    echo "conda: /share/apps/anaconda3/2025.06/bin/conda not found" >&2
    return 127
end

function conda
    functions -e conda
    __nyu_conda_init; or return $status
    conda $argv
end

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

if set -q HERDR_PANE_ID
    set -gx SNACKS_WEZTERM 1
end

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
end

if status is-interactive
    atuin init fish | source
end
