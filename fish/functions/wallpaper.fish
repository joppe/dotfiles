function wallpaper
    set -l wallpaper_dir ~/stack/images/wallpapers-2/*

    DISPLAY=:1 feh --bg-fill --scale-down --randomize $wallpaper_dir
end
