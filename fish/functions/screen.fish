set layout_dir $HOME/.screenlayout

function screen
    set -l layout $argv[1]

    if test -z $layout
        echo "No layout specified." "Please enter a display layout"
        return 1
    end

    if test -e "$layout_dir/$layout.sh"
        $layout_dir/$layout.sh
        echo "🖥️  screen layout $layout set"
    else
        echo "Screen layout $layout not found"
        return 1
    end
end
