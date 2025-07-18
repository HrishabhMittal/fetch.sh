#!/usr/bin/env bash
get_os_name() {
    grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"'
}

get_kernel_version() {
    uname -r
}

get_architecture() {
    uname -m
}

get_hostname() {
    hostname
}

get_user() {
    whoami
}

get_shell() {
    echo "$SHELL"
}

get_terminal() {
    echo "$TERM"
}

get_language() {
    echo "$LANG"
}

get_timezone() {
    timedatectl show --property=Timezone --value 2>/dev/null || cat /etc/timezone 2>/dev/null || echo "N/A"
}

get_current_time() {
    date
}

get_uptime() {
    local uptime_seconds=$(cut -d'.' -f1 /proc/uptime)
    local days=$((uptime_seconds / 86400))
    local hours=$(((uptime_seconds % 86400) / 3600))
    local minutes=$(((uptime_seconds % 3600) / 60))
    echo "${days}d ${hours}h ${minutes}m"
}

get_manufacturer() {
    [[ -f /sys/class/dmi/id/sys_vendor ]] && cat /sys/class/dmi/id/sys_vendor || echo "Unknown"
}

get_model() {
    [[ -f /sys/class/dmi/id/product_name ]] && cat /sys/class/dmi/id/product_name || echo "Unknown"
}

get_version() {
    [[ -f /sys/class/dmi/id/product_version ]] && cat /sys/class/dmi/id/product_version || echo "Unknown"
}

get_bios_vendor() {
    [[ -f /sys/class/dmi/id/bios_vendor ]] && cat /sys/class/dmi/id/bios_vendor || echo "Unknown"
}

get_bios_version() {
    [[ -f /sys/class/dmi/id/bios_version ]] && cat /sys/class/dmi/id/bios_version || echo "Unknown"
}

get_bios_date() {
    [[ -f /sys/class/dmi/id/bios_date ]] && cat /sys/class/dmi/id/bios_date || echo "Unknown"
}

detect_virtualization() {
    if command -v systemd-detect-virt &>/dev/null; then
        local virt=$(systemd-detect-virt)
        [[ "$virt" != "none" ]] && echo "$virt" || echo "None"
    elif grep -q "hypervisor" /proc/cpuinfo 2>/dev/null; then
        echo "VM (detected)"
    else
        echo "None"
    fi
}
get_cpu_model() {
    grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2- | sed 's/^ *//'
}

get_cpu_vendor() {
    grep -m 1 'vendor_id' /proc/cpuinfo | cut -d: -f2- | sed 's/^ *//'
}

get_cpu_family() {
    grep -m 1 'cpu family' /proc/cpuinfo | cut -d: -f2- | sed 's/^ *//'
}

get_cpu_model_number() {
    grep -m 1 '^model' /proc/cpuinfo | cut -d: -f2- | sed 's/^ *//'
}

get_cpu_cores() {
    grep -c ^processor /proc/cpuinfo
}
get_cpu_frequency() {
    grep -m 1 'cpu MHz' /proc/cpuinfo | cut -d: -f2- | sed 's/^ *//'
}


get_gpu_info() {
    if command -v lspci &>/dev/null; then
        local gpus
        mapfile -t gpus < <(lspci | grep -iE 'vga|3d|display' | cut -d ':' -f3- | sed 's/^ *//')
        if [[ "${#gpus[@]}" -eq 0 ]]; then
            echo "No GPUs detected"
        else
            for i in "${!gpus[@]}"; do
                echo -e "GPU$((i+1)): ${gpus[i]}"
            done
        fi
    else
        echo "lspci command not available"
    fi
}

# just checking
# exec_func() {
#     echo $1 "->"
#     $1
# }
# exec_func get_os_name
# exec_func get_kernel_version
# exec_func get_architecture
# exec_func get_hostname
# exec_func get_user
# exec_func get_shell
# exec_func get_terminal
# exec_func get_language
# exec_func get_timezone
# exec_func get_current_time
# exec_func get_uptime
# exec_func get_manufacturer
# exec_func get_model
# exec_func get_version
# exec_func get_bios_vendor
# exec_func get_bios_version
# exec_func get_bios_date
# exec_func detect_virtualization
# exec_func get_cpu_model
# exec_func get_cpu_vendor
# exec_func get_cpu_family
# exec_func get_cpu_model_number
# exec_func get_cpu_cores
# exec_func get_cpu_frequency
# exec_func get_gpu_info
