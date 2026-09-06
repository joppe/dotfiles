function notes --description "Open ZK_NOTEBOOK_DIR in neovim"
    if not set -q ZK_NOTEBOOK_DIR
        echo "ZK_NOTEBOOK_DIR is not set"
        return 1
    end

    if set -q TMUX
        tmux rename-window "notes"
    end

    cd $ZK_NOTEBOOK_DIR
    nvim .
end

