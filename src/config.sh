source funcs.sh
source print.sh
###########################################
################# CONFIG ##################
###########################################

LOGO_FILE="logo.txt"
LOGO_COLOR="$BLUE"
stats="\
${BLUE}$(get_user)${RESET}${WHITE}@${RESET}${RED}$(get_hostname)${RESET}

${GREEN}PC:${RESET} ${CYAN}$(get_model)${RESET} ${PURPLE}$(get_version)${RESET}
${YELLOW}CPU:${RESET} ${CYAN}$(get_cpu_model)${RESET}
$(get_gpu_info | sed "s/\:/\:\\${RESET}\\${BLUE}/" | sed "s/^/\\${PURPLE}/; s/$/\\${RESET}/")

${GREEN}Distro:${RESET} ${WHITE}$(get_os_name)${RESET}
${CYAN}Kernel:${RESET} ${YELLOW}$(get_kernel_version)${RESET}
${PURPLE}Shell:${RESET} ${GREEN}$(get_shell)${RESET}

${RED}Uptime:${RESET} ${CYAN}$(get_uptime)${RESET}
"

###########################################
###########################################
###########################################
