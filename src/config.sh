source funcs.sh
source print.sh
###########################################
################# CONFIG ##################
###########################################

LOGO_FILE="logo.txt"
LOGO_COLOR="$BLUE"
stats="\
${BLUE}$(get_user)${WHITE}@${RED}$(get_hostname)${RESET}

${GREEN}PC: ${CYAN}$(get_model)${RESET} ${PURPLE}$(get_version)${RESET}
${YELLOW}CPU: ${CYAN}$(get_cpu_model)${RESET}
$(get_gpu_info | sed "s/\:/\:\\${RESET}\\${BLUE}/" | sed "s/^/\\${PURPLE}/; s/$/\\${RESET}/")

${GREEN}Distro: ${WHITE}$(get_os_name)${RESET}
${CYAN}Kernel: ${YELLOW}$(get_kernel_version)${RESET}
${PURPLE}Shell: ${GREEN}$(get_shell)${RESET}

${RED}Uptime: ${CYAN}$(get_uptime)${RESET}
"

###########################################
###########################################
###########################################
