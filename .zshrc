# .zshrc: loaded whenever you open a new terminal window or launch a
# subshell from a terminal window intended for customizing the look and
# feel of the interactive terminal allowing you to set aliases, customize
# your prompt, and configure other interactive settings

# https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where

# exports in .zshenv

source ~/.dotfiles/common

for s in $sources; do
    [ -f ~/.dotfiles/$s ] && source ~/.dotfiles/$s || echo "${RED}Not found: ~/.dotfiles/$s ${RESEST}"
done

if [[ "$(uname)" == "Darwin" ]]; then
    for s in $mac_sources; do
        [ -f ~/.dotfiles/$s ] && source ~/.dotfiles/$s || echo "${RED}Not found: ~/.dotfiles/$s ${RESEST}"
    done
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


# if [[ "$TERM" == "xterm-256color" &&  -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}" ]]; then
#     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}"
# fi

if [[ "$TERM" == "xterm-256color" ]]; then
    # source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    # [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    if command -v starship; then
        eval "$(starship init zsh)"
    fi
else
    # Simple prompt for Cool Retro Term
    PS1="$ "
fi



# To activate these completions, add the following to your .zshrc:
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -u
fi


zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# https://stackoverflow.com/questions/67136714/how-to-properly-call-compinit-and-bashcompinit-in-zsh
autoload -Uz bashcompinit
bashcompinit

# cd options
setopt AUTOCD                   # use path with cd command
setopt CORRECT                  # small spelling corrections

# history size
HISTSIZE=10000
HISTFILESIZE=10000
SAVEHIST=10000
#HISTFILE=${ZDO TDIR:-$HOME}/.zsh_history
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt APPEND_HISTORY            # append to history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
# setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
# setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
# setopt HIST_BEEP                 # Beep when accessing nonexistent history.


# zsh widgets: put cursor at end of line when displaying command line history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# perl
# By default non-brewed cpan modules are installed to the Cellar. If you wish
# for your modules to persist across updates we recommend using `local::lib`.
perl_err_msg="Run once on install:  PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)" || echo "$perl_err_msg"


echoerr() { printf "%s\n" "$*" >&2; return 1; }

# bat --list-themes | fzf --preview="bat --theme={} --color=always <filename>""

# autocomplete aliases
setopt completealiases


# autojump
[ -f /opt/homebrew/etc/profile.d/autojump ] && source /opt/homebrew/etc/profile.d/autojump


# PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"


# if command -v fastfetch &>/dev/null; then fastfetch -c ${HOME}/.config/fastfetch/config.json; fi
# [ -n $(tty -s) ] && [ -d ~/ ] && fastfetch -c ${HOME}/.config/fastfetch/config.json


# To activate the autosuggestions, add the following at the end of your .zshrc:
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To activate zsh-syntax-highlighting, add the following at the end of your .zshrc:
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# leave at end of zshrc to ensure priority for PATH

# Safe way to append to PATH
if [[ ":$PATH:" != *"${HOME}/.local/bin:"* ]]; then
    export PATH="${HOME}/.local/bin:$PATH"
fi

remove_path_dupes

test -e "${HOME}/.iterm2_shell_integration" && source "${HOME}/.iterm2_shell_integration"


omp_theme=catppuccin_frappe
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/$omp_theme.omp.json)"
