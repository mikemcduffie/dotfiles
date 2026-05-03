# https://mywiki.wooledge.org/BashFAQ/109
[[ $- != *i* ]] && exit 1  # file not sourced


# Regret prevention
alias mv='mv -i'
alias cp='cp -i'

# Display individual progess
alias mvprog="rsync -aP --remove-source-files --size-only"
alias cpprog="rsync -aP --size-only"

# Navigation
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls -p --color=auto'
alias ll='ls -l'

alias lsdirs='fd -d1 -td'
alias lsgrep='ls | grep'
alias lsifaces='ifconfig -a'
alias lsmkv='mkvmerge -i'



# list all in PATH
#alias which='which -a'


# Mac App Store
alias asu='open "macappstore://showUpdatesPage"'
alias fd-appstore-apps='mdfind kMDItemAppStoreHasReceipt=1'

# homebrew
alias balias='alias | grep brew'
alias bd='brew desc'
alias bdoc='brew doctor'
alias bdeps='brew deps'
alias bgrep='brew list | grep'
alias bh='brew home'                               # open homepage of package
alias bi='brew install'
alias bic='brew install --cask'
alias biq='brew install --no-quarantine'
alias biqc='brew install --no-quarantine --cask'
alias bl='brew list'                               # List installed
alias blc='brew list --cask'                       # List installed casks
alias blv='brew list --versions'
alias bn='brew info'
alias bnfo='brew info'
alias bo='brew outdated'
alias bs='brew search'
alias bsw='brew switch'                            # switch/change version of package: brew switch git 2.5.0
alias bu='brew upgrade'
alias buf='brew upgrade --force'
alias bume='brew upgrade --force microsoft-edge'
alias bui='brew uninstall'
alias buiz='brew uninstall --zap'
alias bupd='brew update'
alias buses='brew uses --installed'                 # list formula(s) that are used by [formula]
alias bver='brew list --versions'
alias bwf='brew which-formula'                      # determine which Homebrew formula installed a specific binary

alias dupes='czkawka'

alias ff='fastfetch -c $HOME/.config/fastfetch/config.json'
alias ffa='fastfetch --config all'

# -n flag: Open a new instance of the application even if one is already running.
alias charm='open -na "PyCharm CE"'
alias pycharm='charm'

alias bb='bbedit'
alias bbh="bbedit $HISTFILE"
alias bba="bbedit ${DOTFILES}/aliases.sh"
alias bbd="bbedit ${DOTFILES}"
alias bbe="bbedit ${DOTFILES}/exports.sh"
alias bbf="bbedit ${DOTFILES}/functions.sh"
alias bbz='bbedit ~/.zshrc'
alias bbze='bbedit ~/.zshenv'
alias bbzp='bbedit ~/.zprofile'

alias cz='code ~/.zshrc'
alias czp='code ~/.zprofile'
alias cze='code ~/.zshenv'
alias sz='source ~/.zshrc'


alias c='clear'
alias compress_app='ditto -c -k --sequesterRsrc --keepParent'

alias d='du -h -d1 | sort -h'
alias e='eza'
alias e1='eza -1'
alias el='eza -l'
alias ela='eza -l -a'
alias tree='eza -T'

alias reveal='open -R' # Show in Finder


alias b0="bbedit ~/sync/Mike/Programming/python/check_0day_comics.py"
alias c0="code ~/sync/Mike/Programming/python/check_0day_comics.py"


alias bkas="bbedit ~/Library/Application\ Support/Kodi/userdata/advancedsettings.xml"

alias dns='scutil --dns'

alias du=gdu-go

# from pip3 install epy-reader
# https://github.com/wustho/epy
alias ebook=epy


alias fdvideo='fd -e mp4 -e m4v -e mov -e avi -e webm'
alias fdaudio='fd -e m4a -e mp3 -e ape -e flac -e ogg'

alias grep='ggrep --color=auto'

alias hgrep="history 0 | grep"
alias hfzf='history 0 | fzf | pbcopy'

alias iina='/Applications/IINA.app/Contents/MacOS/iina-cli --mpv-fs'

# is-ip server is down
# alias isitup=is-up
# alias nzbking='echo -n "NZBKing.com is " && is-up nzbking.com'
# alias booksdl='echo -n "booksdl.org is " && is-up booksdl.org'

alias not='grep -vE'

alias myip="curl http://ipecho.net/plain 2>/dev/null; echo" # echo print newline only

alias par2m4a='par2 create "${PWD##*/} [M4A]" *.m4a'
alias par2flac='par2 create "${PWD##*/} [FLAC]" *.flac'

alias println='printf "%s\n"'

alias swul="softwareupdate -l --include-config-data"
alias swudl="softwareupdate -d --include-config-data"


alias l=eza


alias ytdc='yt-dlp "$(pbpaste)" -o  "~/Downloads/%(title)s.%(ext)s"'

alias sfc-check=cksfv

alias zhelp='man zshbuiltins'

# Reinstall the no-Tahoe 90 day policy
alias notahoe='open "$HOME/Developer/stop-tahoe-update/profiles/deferral-90days.mobileconfig"; sleep 2; open "x-apple.systempreferences:com.apple.preferences.configurationprofiles"'

if [ -n "$ZSH_VERSION" ]; then
    # https://www.stefanjudis.com/today-i-learned/suffix-aliases-in-zsh/
    # cli file associations
    alias -s {js,json,env,md,html,css,toml,url}=bat
fi


case "$(uname)" in
    "Linux")
        # echo "No Linux aliases."
        ;;
    "Darwin")
        # alias lb=~/sync/Mike/Programming/python/comics/thelongbox.py

        # test non-zero for true
        if [ -n "$ZSH_VERSION" ]; then
            alias -g bb=bbedit
            alias -s {mp4,mkv,avi}=iina
        fi

        alias plistprint=' pListBuddy -c "print"'
        alias tag="open -a 'Tag Editor'"

        USERBIN="SHOME/.local/bin"
        DEVDIR="/Volumes/Developer"

        alias storycheck="uv run --project ${HOME}/Developer/python//storycheck/ ${HOME}/Developer/python/storycheck/main.py"
#         alias storycheck="uv run ~/.local/bin/storycheck"
        alias s=storycheck
        alias bsc="bbedit $USERBIN/storycheck.py"
        alias vsc="code $USERBIN/storycheck.py"

        alias 0day=~/sync/Mike/Programming/python/comics/0day_comics.py
        alias 0=0day
        ;;
    "FreeBSD")
        # echo "No FreeBSD aliases."
        ;;
    *) echo "Error: Unknown OS: $(uname)" ;;
esac
