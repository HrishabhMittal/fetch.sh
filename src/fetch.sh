source funcs.sh
source print.sh
source config.sh

read x y <<< $(measure_text "$(cat $LOGO_FILE)")
clear

COLUMNS=$(tput cols)
LINES=$(tput lines)
MAX_LINES=$y
read mx my <<< $(measure_text "$stats")
if [[ "$MAX_LINES" -le "$my" ]]; then
    MAX_LINES=$my
fi

print_specs() {
    box 0 0 $x $y "$(cat $LOGO_FILE)"
    box $((x+1)) 0 $((COLUMNS-x-1)) $LINES "$stats"
}
print_specs
tput cup $MAX_LINES 0
