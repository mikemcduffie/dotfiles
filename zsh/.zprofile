# This file is loaded for login shells, ensuring that the environment variables are set once when you log in, 
# rather than every time a new terminal window is opened
# typically used for setting environment variables such as $PATH without being overridden by macOS.


eval "$(/opt/homebrew/bin/brew shellenv)"

# [ -n $(tty -s) ] && [ -d ~/ ] && fastfetch -c $HOME/.config/fastfetch/config.json
# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
