function y --description 'yazi with cwd-on-exit'
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set cwd (command cat -- "$tmp")
    if test -n "$cwd" -a "$cwd" != "$PWD" -a -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
