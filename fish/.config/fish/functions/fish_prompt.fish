function fish_prompt
    set -l dir (basename (prompt_pwd))
    set -l branch (git symbolic-ref --short HEAD 2>/dev/null; or git rev-parse --short HEAD 2>/dev/null)
    set_color green
    echo -n "$dir"
    set_color normal
    if test -n "$branch"
        echo -n " ($branch)"
    end
    echo -n " > "
end
