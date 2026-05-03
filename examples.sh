case "$(uname)" in
  "Linux") echo "Linux" ;;
  "Darwin") echo "macOS" ;;
  "FreeBSD") echo "FreeBSD" ;;
  *) echo "Unknown" ;;
esac   


[[ $OSTYPE == 'darwin'* ]] && echo 'macOS'
# e.g. "darwin23.0"
# other OS: linux-gnu, darwin, msys, or cygwin


[[ -n "$SSH_CLIENT" || -n "$SSH_TTY" || -n "$SSH_CONNECTION" ]] && echo ssh
[[  "$SSH_CLIENT" || "$SSH_TTY" ||  "$SSH_CONNECTION" ]] && echo ssh

[[ "$BASH_VERSION" ]] && echo "BASH" || echo "Not BASH"
[[ "$ZSH_VERSION" ]] && echo "ZSH" || echo "Not ZSH"

# reset IFS to default after changing
IFS=,
unset IFS
# or execute in subshell to prevent changing current IFS
arr=("foo","bar","baz bat")  # define array
(IFS=,; echo "${arr[@]}")
# "${arr[@]}" <- iterate elements
# "${arr[@]}" <- stringify (join/concat) elements 
# if quotes are not used, elemnets will be split by IFS

# use feature detection, not version detection (e.g. declare associative array in bash)
declare -A arr || exit 1
arr[foo]=1
# Output: 1
arr[bar]=2
# Output: 2
key=foo
arr[$key]
# Output: 1

# keys in associative array
for key in "${!arr[@]}"; do
    printf 'Key: %s  Value: %s' "$key" "${array[$key]}"
done

# Note: nested arrays are not supported in BASH


