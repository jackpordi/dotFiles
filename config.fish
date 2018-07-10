
test $TERM != "screen"; and exec tmux

export TERM=xterm-256color
#thefuck --alias | source 
set fish_function_path $fish_function_path "/usr/lib/python3.6/site-packages/powerline/bindings/fish"
powerline-setup

neofetch

