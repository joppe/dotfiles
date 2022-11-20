function vol
    set -l cmd $argv[1]

    if test -z $cmd
        echo "No command specified." "Please use 'up','down' or 'toggle'"
        return 1
    end

    switch $cmd
        case up
            amixer -D pulse set Master 5%+ > /dev/null
        case down
            amixer -D pulse set Master 5%- > /dev/null
        case toggle
            amixer -D pulse set Master toggle > /dev/null
        case '*'
            echo "Unknown command" $cmd "please use 'up','down' or 'toggle'"
            return 1
    end
end
