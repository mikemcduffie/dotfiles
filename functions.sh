# https://mywiki.wooledge.org/BashFAQ/109
[[ $- != *i* ]] && exit 1  # file not sourced

# alternate declaration: function public_ip { ... }
public_ip() { printf '%b' "$(curl -s ipinfo.io)\n" ;}
public_ip_addr() { public_ip | jq '.ip' ;}

lsd() { [[ -z $1 ]] && levels='1' || levels=$1; fd -td -d"$levels" ;}


lsdupes() { 
  case "$1" in
    -[h?] | --help)
      cat <<-____HELP
Usage: ${0##*/} dir1 dir2 [ --help ]
List duplicates between two directories.
____HELP
      ;;
    *)
      ls "${1:?missing: dir1 dir2}" "${2:?missing: dir2}" | sort | uniq -d 
      ;;
  esac
}


# requires pypyp; pip3 install pypyp
nzbs() { echo "$1" |  pyp -b 'import xml.etree.ElementTree as ET' "ET.parse(line).getroot()[0].attrib['subject']"; }



colors-256() {
    for (( i = 0; i < 256; i++ )); do
        echo -e "\e[38;5;${i}m ██ Color: ${i} ······· use: echo -e \"\\\e[38;5;${i}m TEXT\""
    done
}


change_ext() {
    if [[ "$1" == "-c" ]]; then
        local CMD="cp -n" && shift 1
    else
        local CMD=mv && shift 1
    fi
    if [[ "$2" != "" ]]; then
        ext=".$2"
    else
        ext=""
    fi
    for file in "*.$1"; do
        eval "$CMD" -- "$file" "${file%.$1}$ext"
    done
}

dns-ip() { scutil --dns | grep nameserver | awk '{print $3}' ;}


loop() {
    if (( $# < 2 )); then # W: In POSIX sh, standalone ((..)) is undefined.
        echo 'Usage: loop CMD [ITEMS]'
        return
    fi
    CMD=$1
    shift
    if command -v $CMD &>/dev/null; then # W: In POSIX sh, &> is undefined.
        for i in "$@"; do
            $CMD "$i"
        done
    else
        echo "Command not found: $CMD"
        return 1
    fi
}

path() { echo $PATH | tr : '\n' ;}



# function checks each directory for the presence of a .DS_Store file and ensures that
# the directory contains no other files or subdirectories before deleting it.
### TEST MODE ###
clean_dsstore_folders() {
    find . -type d -exec sh -c 'test -f "$1/.DS_Store" && test ! -d "$1" && test ! -f "$1/*" && echo rm -rf "$1"' _ {} \;
}

clean_apple() { fd -H '^\._|^\.DS_Store' -x rm -r ; }


codec_info() {
	M4AINFO=$(mediainfo "$1" | grep 'Audio Codec' | awk -F ' : ' '{print $2}')
	[[ "$M4AINFO" == *"Apple Lossless Audio Codec" ]] && echo $CYAN "$1: " $M4AINFO || echo $YELLOW "$1: " $M4AINFO
}

m4a_info() {
	find . -type f -name '*.m4a' | cut -d/ -f2- | sort | while read file
	do
		codec_info "$file"
	done
}

flac_info() {
	find . -type f -name '*.flac' | while read file
	do
		codec_info "$file"
	done
}

# Search for text in brew formulae descriptions
bds() { HOMEBREW_EVAL_ALL=1 brew search --formula --desc "$1" | grep -e '\b'"$1"'\b' ;}

# Get info on all installed formulas
bnf() {
    brew leaves | while IFS= read -r FORMULA; do
        brew info --formula $FORMULA | head -n 3
        echo '================================================================================='
    done
}


# Get info on all installed casks
bnc() {
    brew list --cask | while IFS= read -r CASK; do
        brew info --cask $CASK | head -n 3
        echo '================================================================================='
    done
}

bfzf() { brew info --json --eval-all | jq -r '.[].name' | fzf --preview 'brew info {}' ;}

bric() { "brew  reinstall --cask $(brew outdated --cask)" ;}

buex() {
    if [ "$#" -eq 0 ]; then
        excluded_apps=('"microsoft-edge"', '"mkvtoolnix-app"')
    else
        excluded_apps="$@"
    fi
    echo "brew upgrade excluding:" ${excluded_apps}
    brew outdated --json | jq '.formulae[].name,.casks[].name' | \
    pyp "x if x not in ${excluded_apps} else None" | \
    xargs -n1 brew upgrade
}

bnh() { brew info $@ | head -2 ;}


stow_init() {
    local STOW_FOLDERS="gitconfig,zsh"

    local DOT_FILES="$HOME/.dotfiles"

    pushd "$DOT_FILES"
    for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
    do
        stow -D "$folder"
        stow "$folder"
    done
    popd
}

superfind() {
    echo "Errors are suppressed!"
    find "$@" 2> /dev/null
}

filename() { echo -e ${RED}\$${CYAN}\{${RESET_COLOR}file${GREEN}\%.\*${CYAN}\}${RESET_COLOR}: ${1%.*} ;}
fileext() { echo -e ${RED}\$${CYAN}\{${RESET_COLOR}file${GREEN}\#\#\*.${CYAN}\}${RESET_COLOR}: ${1##*.} ;}

alias cheatp=help

up() { levels=${1:1}; cd $(eval printf '../'%.0s {1..$1}); }
# e.g. `up 2` to move up by two directories. `up` without parameter defaults to 1

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

esay() { 
    if [ -f "$1" ]; then
        edge-playback -f "$1" -v en-US-AndrewNeural
    elif [ -n "$1" ]; then
        edge-playback -t "$1" -v en-US-AndrewNeural
    else
        edge-playback -t "$(pbpaste)" -v en-US-AndrewNeural
    fi
}


# merge/ovewrite my JDownloader 2 settings (sorted by key, pretty print)
# jdownloadercfg(){
# cat "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json" |\
# jq -S '. |= . + {
#    "bannerenabled" : false,
#    "premiumalertetacolumnenabled" : false,
#    "premiumalertspeedcolumnenabled" : false,
#    "premiumalerttaskcolumnenabled" : false,
#    "premiumdisabledwarningflashenabled" : false,
#    "premiumexpirewarningenabled" : false,
#    "specialdealoboomdialogvisibleonstartup" : false,
#    "specialdealsenabled" : false,
#    "statusbaraddpremiumbuttonvisible" : false,
#    "updatebuttonflashingenabled": false,
#    "clipboardmonitored": false,
#    "myjdownloaderviewvisible": false,
# }' > "/Applications/JDownloader 2.0/cfg/temp.json" \
# && mv "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json" \
# "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json.old" \
# && mv "/Applications/JDownloader 2.0/cfg/temp.json" "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json"
# }

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}


fftrim() { ffmpeg -i "$2" -ss $1 -vcodec copy -acodec copy "${2%.*}_trimmed.${3:-mp4}" ; }
ffremux() { ffmpeg -i "$1" -i "$2" -vcodec copy -acodec copy -map 0:0 -map 1:"${3:-0}" "${1%.*}_remuxed.${1##*.}" ; }


jmkv1() { mkvpropedit "$1" --edit track:s1 --set flag-default=1 --set flag-forced=1 --set language="eng" --edit track:v1 --set language="jpn" --edit track:a1 --set language="jpn" ;}
jmkv2() { mkvpropedit "$1" --edit track:s2 --set flag-default=1 --set flag-forced=1 --set language="eng" --edit track:v1 --set language="jpn" --edit track:a1 --set language="jpn" ;}
sub-check() { for f in **/*.mkv; do echo "$f"; ffmpeg -i "$f" 2>&1 | grep 'Subtitle'; echo; done ;} 
mkv-eng-only() { for f in *.mkv; do mkvmerge --output "${f%.*}-eng.mkv" -a "eng" -s "eng" "$f"; done ;}
checknfo() { egrep -Lir --include="$f/*.nfo" '<order4' ;}

remove-from-quarantine() { /usr/bin/xattr -r -d com.apple.quarantine "$@" ;}

check-title() {
    s="$@"
    fullpath=${s%:*}
    filename="$(basename "$fullpath")"
    name=""${filename%.*}""
    title=${s##*:}
    if [[ "$name" != "*$title" ]]; then
        echo "$name --> $title"
    fi
}

change-ext() { 
    if [ "$#" -eq 2 ] ; then
        find . -type f  -name "*.$1" -exec  rename -f -v -s ".$1" ".$2" {} ";" 
    else 
        echo "Usage: change_ext OLD_EXTENSION NEW_EXTENSION" >&2
        return 1 
    fi
}

copy-by-ext() {
	if [[ $2 != "" ]]; then
		new_ext=".$2"
	else
		new_ext="$2"
	fi
	for f in *.$1; do
		new_file="${f/.$1/$new_ext}"
		if [[ -f "$new_file" ]]; then
			echo "Error: $new_file already exists."
		else
			cp "$f" "$new_file"
		fi
	done
}


chd2iso() {
    echo chdman createcd -i \""$1"\" -o \""${1%.*}.chd"\"
    chdman createcd -i "$1" -o "${1%.*}.chd"
}


mcd() {
    mkdir -p "$1"
    cd "$1"
}



    fix-epub-dirs() {
      mkdir -p fixed
      find . -depth 1 -name "*.epub" | while read -r file; do
        (cd "$file" || exit && \
        find . -iname 'iTunesMetadata*.plist' -delete && \
        zip -r -X "../fixed/$file" mimetype .)
      done
    }



fd() {
    if [ "$PWD" = "$HOME" ]; then
        echo '\e[32m'Excluding Library...'\e[0m'
        /opt/homebrew/bin/fd --exclude Library "$@"
    else
        /opt/homebrew/bin/fd "$@"
fi  
}


rg() {
    if [ "$PWD" = "$HOME" ]; then
        echo '\e[32m'Excluding Documents, Downloads, and Library...'\e[0m'
        /opt/homebrew/bin/rg -g '!Library/' -g '!Documents/' -g '!Downloads/' "$@"
    else
        /opt/homebrew/bin/rg "$@"
fi  
}


pbplay() {
    echo "$(pbpaste | wc -c) bytes"
    gtime  --format="Elasped: %E" edge-playback -t "$(pbpaste)" -v en-US-AndrewNeural
}


rga() {
    if [ "$PWD" = "$HOME" ]; then
        echo '\e[32m'Excluding Library...'\e[0m'
        /opt/homebrew/bin/rga -g '!Library/' "$@"
    else
        /opt/homebrew/bin/rga "$@"
fi  
}


printargs() { printf '%s\n' $@ ;}
 
remove-exec() { fd -tx --exclude '*.app' -x chmod -x ; }



if [[ $SHELL == *zsh* ]]; then
    # STRING MANIPULATION
    to-lower() { echo ${1:l} ;}   
fi

tts () {
    echo "Processing ${1}..."
    echo "$(date +%T)    $(cat "$1" | wc -c) bytes"
    uv run $SCRIPTS/edge-tts-transcode.py "$1" && afplay ~/sounds/Single-Click.aiff || afplay ~/sounds/Uh-oh.aiff
}


help() {
    local cheatp_path="~/.config/cheat/cheatsheets/personal"
    local BATLANG

    display_md() { 
        if [[ $(wc -l < "$1") -gt 10 ]]; then
            glow -p "$1"
        else
            glow "$1"
        fi
    }

    if [[ ! -d $cheatp_path || -z "$(ls $cheatp_path)" ]]; then
        # cheatp_path="$(cat .config/cheat/conf.yml | shyaml get-value cheatpaths.1.path)"
        if [[ ! -f /opt/homebrew/bin/yq ]]; then
            echo "yq must be installed.\nbrew install yq\n"
            return 1
        fi

        cheatp_path="$(yq eval '.cheatpaths.1.path'  ~/.config/cheat/conf.yml)"
    fi

    if [[ $1 == "-o" ]]; then
        open "$cheatp_path"
    elif [[ $1 == "-g" ]]; then
        cd "$cheatp_path"
    elif [[ $1 == "-s" ]]; then
        cheat -p personal -s "${@:2}"
    elif [[ $1 == "-rg" ]]; then
        cd $cheatp_path
        rg "${@:2}"
        cd - > /dev/null
    elif [[ $1 == "-e" ]]; then    
        cheat -e "${@:2}"
    elif [[ -f "$cheatp_path/$1.md" ]]; then
        display_md "$cheatp_path/$1.md"
    elif [[ -f "$cheatp_path/$1" ]]; then
        #  help command.md
        if [[ $filename == *.md ]]; then
            display_md "$cheatp_path/$1"
        elif [[ "windows win" == *"$1"* ]]; then
            BATLANG="PowerShell"
        elif [[ "$1" == *"python"* ]]; then
            BATLANG="python"
        elif [[ "$1" == "awk" ]]; then
            BATLANG="awk"
        else
            BATLANG="bash"
        fi
        bat "$cheatp_path/$1" -l $BATLANG --plain
    else
        echo $BRIGHT_MAGENTA
        echo "Personal Cheatsheets:"
        echo $RESET_COLOR
        ls "$cheatp_path"
        echo $YELLOW
        echo "Use help <filename> or help -s <search term> or help -rg <search term>"
        echo $RESET_COLOR
    fi
}

rename-camelcase-split() { rename -e 's/([A-Z][a-z]+)(?=[A-Z])/$1 /g;' "$1"  ;}
