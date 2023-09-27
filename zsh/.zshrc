# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To activate these completions, add the following to your .zshrc:
  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi


export EDITOR=/opt/homebrew/bin/bbedit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# https://stackoverflow.com/questions/67136714/how-to-properly-call-compinit-and-bashcompinit-in-zsh
autoload -Uz bashcompinit
bashcompinit


# bindkey \^S backward-kill-line
# https://superuser.com/questions/417627/oh-my-zsh-history-completion/418299#418299
# map the ↑ and ↓ Keys to history search with partial command (from start)
# '\e' can be replaced with '\033'
bindkey '\e[A' history-beginning-search-backward  # ↑ Key
bindkey '\e[B' history-beginning-search-forward   # ↓ Key
#  Terminal Settings>Profiles>Keyboard: added shift-delete to "forward-delete"
bindkey 'foward-delete' delete-char
# option-delete: requires Settings>Profiles>Keyboard: "Use Option as Meta key"
#   else Esc then delete
bindkey "^[^?" backward-kill-word


# ANSI 16 colors :  \033 or \e
black='\e[30m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
magenta='\e[35m'
cyan='\e[36m'
white='\e[37m'
bright_black='\e[30;1m'
bright_red='\e[31;1m'
bright_green='\e[32;1m'
bright_yellow='\e[33;1m'
bright_blue='\e[34;1m'
bright_magenta='\e[35;1m'
bright_cyan='\e[36;1m'
bright_white='\e[37;1m'
reset_color='\e[0m'

echoerr() { printf "%s\n" "$*" >&2; return 1; }

alias chat="echoerr 'This is not the cheat you are looking for! Unless you meant /usr/sbin/chat (ppp/modem tool).'"
alias tu='echo "\nUpdating TLDR database..." && tldr --update'

alias bb=bbedit

alias bu='brew update'
# modification date/time: find -mtime +(# of days); -mmin +(# of minutes)
alias bup='brew upgrade $@ && [[ $(find ~/.tldrc/*  -name date -mtime +10) ]] && tu || echo ""'
alias bd='brew doctor'
alias bnfo='brew info'
alias bn='brew info'
alias bi='brew install'
alias bic='brew install --cask'
alias biq='brew install --no-quarantine'
alias biqc='brew install --no-quarantine --cask'
alias bo='brew outdated'
alias bs='brew search'

alias asu='open "macappstore://showUpdatesPage"'
alias fd-appstore-apps='mdfind kMDItemAppStoreHasReceipt=1'

alias bz='bbedit ~/.zshrc'
alias sz='source ~/.zshrc'

alias c='clear'

alias d='du -h -d1 | sort -h'
alias el='exa -l'
alias e1='exa -1'
alias tree='exa -T'

alias ..='cd ..'
alias ~='cd ~'
alias cdp='cd ~/scripts/python/'

alias cheatp='cheat -p personal'
# alias help='cheatp -s combo'

alias b0="bbedit ~/scripts/python/check_0day_comics.py"
alias v0="codium ~/scripts/python/check_0day_comics.py"


alias bkas="bbedit ~/Library/Application\ Support/Kodi/userdata/advancedsettings.xml"

# from pip3 install epy-reader
# https://github.com/wustho/epy
alias ebook=epy

alias gh="history 0 | grep"
alias hg="history 0 | grep"

alias isitup=is-up
alias nzbking='echo -n "NZBKing.com is " && is-up nzbking.com'
alias booksdl='echo -n "booksdl.org is " && is-up booksdl.org'
 
alias nspsplitty="open -a SplitNSP-Swift-GUI"
alias splitnsp="open -a SplitNSP-Swift-GUI"
alias nsp2nsz="echo USE nsz"

alias par2m4a='par2 create "${PWD##*/} [M4A]" *.m4a'
alias par2flac='par2 create "${PWD##*/} [FLAC]" *.flac'
alias path="echo $PATH | sed 's/:/\n/g'"

alias swul="softwareupdate -l --include-config-data"
alias swudl="softwareupdate -d --include-config-data"

# https://www.stefanjudis.com/today-i-learned/suffix-aliases-in-zsh/
# cli file associations
alias -s {js,json,env,md,html,css,toml,url}=bat
alias -s {mp4,mkv,avi}=iina

alias 0day=~/scripts/python/comics/0day_comics.py
alias 0=0day
alias lb=~/scripts/python/comics/thelongbox.py

alias storycheck=~/scripts/python/sc/storycheck.py
alias s=storycheck
alias bsc="bbedit ~/scripts/python/storycheck.py"
alias vsc="codium ~/scripts/python/storycheck.py"


# SMB network shares mount
data()    { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/data"';   cd /Volumes/data }
media1()  { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/media1"'; cd /Volumes/media1 }
media2()  { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/media2"'; cd /Volumes/media2 }
media3()  { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/media3"'; cd /Volumes/media3 }
music()   { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/music"';  cd /Volumes/Music }
movies()  { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/movies"'; cd /Volumes/Movies }
tvshows() { /usr/bin/osascript -e 'mount volume "smb://media@media-server.local/tv_shows"'; cd /Volumes/TV_Shows }

codec_info () {
	echo -n "$1: "
	echo $(mediainfo "$1" | grep 'Audio Codec' | awk -F ' : ' '{print $2}')
}

m4a_info () {
	find . -type f -name '*.m4a' | while read file
	do
		codec_info "$file"
	done
}

flac_info () {
	find . -type f -name '*.flac' | while read file
	do
		codec_info "$file"
	done
}

# Get info on all installed formulas
bnf() {
    brew leaves | while IFS= read -r FORMULA; do
        brew info --formula $FORMULA
        echo '================================================================================='
    done
}


# Get info on all installed casks
bnc() {
    brew list --cask | while IFS= read -r CASK; do
        brew info --cask $CASK
        echo '================================================================================='
    done
}

# enable Touch ID authentication for Terminal sudo command
touchid_sudo() { sudo gawk -i inplace 'NR==2{print "auth       sufficient     pam_tid.so"}1' /etc/pam.d/sudo }


# cd to the path of the front Finder window
cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
	    # macOS bug returns POSIX path for some volumes with /Volumes prefix: workaround code follows
	    root_dirs="$(ls -d /*/)"
	    target_dir=$(echo $target | awk -F/ '{print $2}')
	    [[ $target != /Volumes/* && $root_dirs != *"/$target_dir/"* ]] && target=/Volumes"$target"
		cd "$target" && echo -n "--> " && pwd
	else
		echo 'No Finder window found' >&2
	fi
}

filename() {echo -e ${red}\$${blue}\{${reset_color}file${green}\%.\*${blue}\}${reset_color}: ${1%.*}}
fileext(){echo -e ${red}\$${blue}\{${reset_color}file${green}\#\#\*.${blue}\}${reset_color}: ${1##*.}}

help() {
    cheatp_path="~/.config/cheat/cheatsheets/personal"
    if [[ ! -d $cheatp_path || -z "$(ls $cheatp_path)" ]]; then
        # cheatp_path="$(cat .config/cheat/conf.yml | shyaml get-value cheatpaths.1.path)"
        if [[ ! -f /opt/homebrew/bin/yq ]]; then
            echo "yq must be installed.\nbrew install yq\n"
            return 1
        fi

        cheatp_path="$(yq eval '.cheatpaths.1.path'  ~/.config/cheat/conf.yml)"
    fi
    if [[ $1 == "-s" ]]; then
        cheat -p personal -s "${@:2}"
    elif [[ $1 == "-e" ]]; then
        cheat -e "${@:2}"
    elif [[ -f "$cheatp_path/$1" ]]; then
        cheat -p personal $1
    else
        echo "Personal Cheatsheets:\n"
        ls "$cheatp_path"
        echo "\nUse help <filename> or help -s <search term>"
    fi
}

# print python script to screen and run script with all args
run() {
  if [[ -z $1 ]]; then
    echo "No script filename entered."
    return 1
  else
      bat --paging=never "$1"
      if [[ "$1"  == *".py" ]]; then
        python3 "$1"
      else
        bash "$1"
      fi
  fi
}


# setup command line tool for VSCode/VSCodium
vscodium() {VSCODE_CWD="$PWD" open -n -b "com.vscodium" --args $* ;}
alias code=vscodium
### causes vscode function to be defined regardless of if statement
# if [ -f "/Applications/Visual Studio Code.app" ]; then
#     vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
# else
#     alias vscode=vscodium
# fi


# merge/ovewrite my JDownloader 2 settings (sorted by key, pretty print)
jdownloadercfg(){
cat "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json" |\
jq -S '. |= . + {
   "bannerenabled" : false,
   "premiumalertetacolumnenabled" : false,
   "premiumalertspeedcolumnenabled" : false,
   "premiumalerttaskcolumnenabled" : false,
   "premiumdisabledwarningflashenabled" : false,
   "premiumexpirewarningenabled" : false,
   "specialdealoboomdialogvisibleonstartup" : false,
   "specialdealsenabled" : false,
   "statusbaraddpremiumbuttonvisible" : false,
   "updatebuttonflashingenabled": false,
   "clipboardmonitored": false,
   "myjdownloaderviewvisible": false,
}' > "/Applications/JDownloader 2.0/cfg/temp.json" \
&& mv "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json" \
"/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json.old" \
&& mv "/Applications/JDownloader 2.0/cfg/temp.json" "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json"
}

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

jmkv1() { mkvpropedit "$1" --edit track:s1 --set flag-default=1 --set flag-forced=1 --set language="eng" --edit track:v1 --set language="jpn" --edit track:a1 --set language="jpn" }
jmkv2() { mkvpropedit "$1" --edit track:s2 --set flag-default=1 --set flag-forced=1 --set language="eng" --edit track:v1 --set language="jpn" --edit track:a1 --set language="jpn" }
sub_check() {for f in **/*.mkv; do echo "$f"; ffmpeg -i "$f" 2>&1 | grep 'Subtitle'; echo; done}
checknfo() { egrep -Lir --include="$f/*.nfo" '<order4' }

check_title() {
s="$@"
fullpath=${s%:*}
filename="$(basename "$fullpath")"
name=""${filename%.*}""
title=${s##*:}
if [[ "$name" != "*$title" ]]; then
    echo "$name --> $title"
fi
}

chd2iso() {
 echo chdman createcd -i \""$1"\" -o \""${1%.*}.chd"\"
 chdman createcd -i "$1" -o "${1%.*}.chd"
}

# bat --list-themes | fzf --preview="bat --theme={} --color=always <filename>""


# history size
HISTSIZE=5000
HISTFILESIZE=10000

SAVEHIST=5000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE

#HISTFILE=${ZDO TDIR:-$HOME}/.zsh_history

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_ALL_DUPS # or just immediate re[eats: HIST_IGNORE_DUPS]
# autocomplete aliases
setopt completealiases


export PATH=$HOME/bin:$PATH
 source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh


# To activate the autosuggestions, add the following at the end of your .zshrc:
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
