# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$DOTFILES"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "rice"; then

    new_window "terminal"
    run_cmd "cd ~ && clear"

    new_window "nvim_config"
    run_cmd "cd ~/.config/nvim && clear"
    run_cmd "nvim ."

    new_window "dotfiles"
    run_cmd "cd $DOTFILES && clear"
    run_cmd "nvim ."
    split_h 50
    select_pane 1

    new_window "bashrc"
    run_cmd "nvim $BASHRC"

    new_window "tmux"
    run_cmd "nvim ~/.config/tmux/tmux.conf"
    split_h 50
    run_cmd "cd ~/ && clear"
    select_pane 2  

    new_window "wiki"
    run_cmd "wiki"

    select_window "terminal"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

