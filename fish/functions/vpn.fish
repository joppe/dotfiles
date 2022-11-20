set vpn_dir $HOME/.config/openconnect

function vpn
    set -l cmd $argv[1]
    set -l ctx $argv[2]

    if test -z $cmd
        echo "No command specified." "Please use 'start','stop' or 'status'"
        return 1
    end
    
    if test $cmd != "status"; and test -z $ctx
        echo "No connection specified" "Please enter a connection after the command"
        return 1
    end

    switch $cmd
        case status
            vpn-status
        case start
            vpn-start $ctx
        case stop
            vpn-stop $ctx
        case '*'
            echo "Unknown command" $cmd "please use 'start','stop' or 'status'"
            return 1
    end
end

function vpn-status
    set -l vpn_status (ip tuntap show)

    if string match -q "tun0: tun*" $vpn_status
        echo "⬆️VPN is active"
    else
        echo "⬇️VPN is off"
        sudo rm $vpn_dir/*.lock
    end
end

function vpn-start
    set -l connection $argv[1]
    set -l url ""

    if test -e "$vpn_dir/$connection.lock"
        echo "VPN connection for $connection already established. Please run 'vpn stop $connection' first before starting"
        return 1
    else if test -e "$vpn_dir/$connection.cfg"
        sudo openconnect --background --config="$vpn_dir/$connection.cfg" --pid-file="$vpn_dir/$connection.lock" $url
        echo "🚀  VPN $connection started"
    else
        echo "No configuration found for $connection"
        return 1
    end

    return 0
end

function vpn-stop
    set -l connection $argv[1]
    set -l lockfile "$vpn_dir/$connection.lock"

    if test -e $lockfile
        set -l pid (head -1 $lockfile)

        sudo kill $pid
        echo "🛑  VPN $connection stopped"
    else
        echo "The VPN has not been started. Please start the vpn by running 'vpn start $connection'"
        return 1
    end
end
