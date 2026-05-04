# [\e[0;35m]:           Sets the text color to purple (light intensity 0, color code 35).
# \u:                   Displays the current username.
# [\e[0;0m]:            Resets all formatting attributes (bold, color, etc.) to default.
# @:                    A literal at symbol.
# [\e[0;36m]:           Sets the text color to cyan.
# \h:                   Displays the hostname (up to the first dot).
#                       Alternately "\H" displays the fully qualified domain name (FQDN)
# :                     A literal space.
# [\e[0;33m]:           Sets the text color to brown (or dark yellow).
# \w:                   Displays the current working directory (full path, with ~ for home).
# :                     A literal space.
# [\e[2;32m]:           Sets the text to dimmed green (intensity 2 is dim, color code 32 is green).
# $ :                   Displays the prompt character ($ for regular users, # for root) followed by a space.
# [\e[0;0m]:            Resets formatting again.
# [\e]0;\u@\h: \w\a]:   Sets the terminal window title to username@hostname: current_directory.
#                       The \e]0;... sequence initiates the title change, and \a (bell character) terminates it.
# Note: The use of \[\e[...m\] is critical. The square brackets \[ and \] tell Bash that the enclosed escape codes
#       are non-printing characters.  Without them, Bash miscalculates the prompt length,
#       causing line-wrapping and history navigation issues.

source ~/.dotfiles/common

PS1='\[\e[0;35m\]\u\[\e[0;0m\]@\[\e[0;36m\]\h \[\e[0;33m\]\w \[\e[2;32m\]$ \[\e[0;0m\]\[\e]0;\u@\h: \w\a\]'
[ -f ~/ble.sh/out/ble.sh ] && source ~/ble.sh/out/ble.sh
