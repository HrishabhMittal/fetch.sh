BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'
box() {
    local x="$1" y="$2" width="$3" height="$4" text="$5"
    local inner_width=$width
    local inner_height=$height
    IFS=$'\n' read -rd '' -a lines <<<"$text"
    for (( i=0; i<inner_height && i < ${#lines[@]}; i++ )); do
        tput cup $(( y + i )) "$x"
        # ik this doesnt take into account ansi escape codes but thats a problem for future me :)
        echo -e "$(printf "%-${inner_width}.${inner_width}s" "${lines[i]}")"
    done
}
measure_text() {
    local text="$1"
    local max_width=0
    local lines=()
    IFS=$'\n' read -rd '' -a lines <<<"$text"

    local height=${#lines[@]}

    for line in "${lines[@]}"; do
        local clean_line=$(echo "$line" | sed 's/\033\[[0-9;]*[a-zA-Z]//g')
        local len=${#clean_line}
        if (( len > max_width )); then
            max_width=$len
        fi
    done

    echo "$max_width $height"
}
