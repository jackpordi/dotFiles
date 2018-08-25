
test $TERM != "screen"; and exec tmux

powerline-daemon -q
set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup

neofetch
