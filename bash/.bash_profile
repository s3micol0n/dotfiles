# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# start x server
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
   exec startx
fi

# add user's local bin directory to path
# export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/scripts/final:$PATH" 
