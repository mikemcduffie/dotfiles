# https://mywiki.wooledge.org/BashFAQ/109
[[ $- != *i* ]] && exit 1  # file not sourced

# neofetch (customisable system info script) is no longer supported; replaced with fastfetch
neofetch() { glow  <<< 'Use `fastfetch` or `ff`' }

exa() {echo "${CYAN}exa${YELLOW} is is not maintained. Running ${CYAN}eza${YELLOW}...${RESET_COLOR}"; eza $@ }

splitnsp() {
    echo "Opening SplitNSP-GUI..."
    open -a SplitNSP-Swift-GUI
}

alias chat="echoerr 'This is not the cheat you are looking for! Unless you meant /usr/sbin/chat (ppp/modem tool).'"

alias nspsplitty=splitnsp
alias nspsplit=splitnsp

alias nsp2nsz="echo USE nsz (from pip3 install)"

alias unace=acefile-unace

