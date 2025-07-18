
###########################################
################# CONFIG ##################
###########################################

LOGO_FILE="logo.txt"

stats="$BLUE$(get_user)$RESET@$RED$(get_hostname)$RESET
 
PC: $(get_model) $(get_version)
CPU: $(get_cpu_model)
$(get_gpu_info)
 
Distro: $(get_os_name)
Kernel: $(get_kernel_version)
Shell: $(get_shell)
 
Uptime: $(get_uptime)
"

###########################################
###########################################
###########################################
