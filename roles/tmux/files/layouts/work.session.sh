#r Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/work"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "work"; then

    new_window "terminal"
    run_cmd "cd ~ && clear"

    new_window "fhcm"
    run_cmd "cd ~/work/FHCM"
    run_cmd "nvim ."
    # split_h 50
    # run_cmd "cd ~/work/FHCM"
    # run_cmd "clear"

    new_window "fec"
    run_cmd "cd ~/work/FEC"
    run_cmd "nvim ."
    # split_h 50
    # run_cmd "cd ~/work/FEC"
    # run_cmd "clear"

    new_window "fzm"
    run_cmd "cd ~/work/fzm"
    run_cmd "nvim ."

    select_window "terminal"

    new_window "wiki"
    run_cmd "wiki"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

