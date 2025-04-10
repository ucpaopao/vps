#!/usr/bin/env bash

# 颜色定义
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Yellow_font_prefix="\033[33m"
Blue_font_prefix="\033[34m"
Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Yellow_font_prefix}[注意]${Font_color_suffix}"
Header="${Blue_font_prefix}[操作]${Font_color_suffix}"

# 系统检测
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
KERNEL=$(uname -r)

# 备份文件路径
SYSCTL_BACKUP="/etc/sysctl.conf.backup_$(date +%s)"
LIMITS_BACKUP="/etc/security/limits.conf.backup_$(date +%s)"

# 版本信息
VERSION="2.3"

# 版权信息
copyright() {
    clear
    echo -e "\n\033[34m##########################################################"
    echo -e "#          Linux网络终极优化脚本 - 专业增强版         #"
    echo -e "#           支持智能检测内核特性/自动回滚            #"
    echo -e "#              Powered by NNC.SH ${VERSION}             #"
    echo -e "##########################################################\033[0m\n"
}

# 检查Root权限
check_root() {
    [[ $EUID -ne 0 ]] && echo -e "${Error} 必须使用root用户运行此脚本！" && exit 1
}

# 检查系统兼容性
check_system() {
    if ! grep -Eqi "centos|redhat|debian|ubuntu" /etc/issue; then
        echo -e "${Error} 仅支持CentOS/RedHat/Debian/Ubuntu系统！" && exit 1
    fi
}

# 备份系统文件
backup_files() {
    echo -e "${Info} 正在备份系统文件..."
    cp /etc/sysctl.conf "$SYSCTL_BACKUP" 2>/dev/null || echo -e "${Tip} sysctl.conf备份失败（文件可能不存在）"
    cp /etc/security/limits.conf "$LIMITS_BACKUP" 2>/dev/null || echo -e "${Tip} limits.conf备份失败（文件可能不存在）"
    echo -e "${Tip} 系统文件已备份至："
    [[ -f "$SYSCTL_BACKUP" ]] && echo -e "  - $SYSCTL_BACKUP"
    [[ -f "$LIMITS_BACKUP" ]] && echo -e "  - $LIMITS_BACKUP"
}

# 恢复备份
restore_backup() {
    echo -e "\n${Tip} 是否要恢复备份？(y/n)"
    read -r answer
    if [[ $answer =~ ^[Yy]$ ]]; then
        [[ -f "$SYSCTL_BACKUP" ]] && cp -f "$SYSCTL_BACKUP" /etc/sysctl.conf
        [[ -f "$LIMITS_BACKUP" ]] && cp -f "$LIMITS_BACKUP" /etc/security/limits.conf
        sysctl -p >/dev/null 2>&1
        echo -e "${Info} 系统配置已成功恢复！"
        exit 0
    fi
    echo -e "${Info} 已取消恢复操作。"
}

# 检查内核特性
kernel_check() {
    if [[ $(sysctl net.ipv4.tcp_available_congestion_control | grep -c bbr) -eq 0 ]]; then
        echo -e "${Error} 当前内核不支持BBR，建议升级到4.9+内核！"
        echo -e "${Tip} 可执行以下命令升级内核："
        [[ -f /etc/redhat-release ]] && echo -e "  yum install -y https://elrepo.org/linux/kernel/el7/x86_64/RPMS/kernel-ml-5.15.0-1.el7.elrepo.x86_64.rpm"
        [[ -f /etc/debian_version ]] && echo -e "  apt install -y linux-image-generic-hwe-20.04"
        exit 1
    fi
}

# 应用系统参数
apply_settings() {
    if sysctl -p >/dev/null 2>&1; then
        echo -e "${Info} 系统参数应用成功！"
    else
        echo -e "${Error} 系统参数应用失败，正在回滚..."
        restore_backup
        exit 1
    fi
}

# 智能TCP全栈优化
optimize_tcp() {
    echo -e "\n${Header} 正在执行智能TCP全栈优化..."
    
    # 动态删除旧参数
    local tcp_params=(
        net.ipv4.tcp_no_metrics_save net.ipv4.tcp_ecn net.ipv4.tcp_frto 
        net.ipv4.tcp_mtu_probing net.ipv4.tcp_rfc1337 net.ipv4.tcp_sack
        net.ipv4.tcp_fack net.ipv4.tcp_window_scaling net.ipv4.tcp_adv_win_scale
        net.ipv4.tcp_moderate_rcvbuf net.ipv4.tcp_rmem net.ipv4.tcp_wmem
        net.core.rmem_max net.core.wmem_max net.ipv4.udp_rmem_min
        net.ipv4.udp_wmem_min net.core.default_qdisc net.ipv4.tcp_congestion_control
    )
    
    for param in "${tcp_params[@]}"; do
        sed -i "/^${param}/d" /etc/sysctl.conf
    done

    # 智能写入优化参数
    cat >> /etc/sysctl.conf << EOF

# ---------------------------
# 深度TCP优化参数 (NNC.SH增强版)
# 内核版本: $KERNEL
# 操作系统: $OS
# 时间: $(date)
# ---------------------------
# 基础协议优化
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_ecn = 1
net.ipv4.tcp_frto = 0
net.ipv4.tcp_mtu_probing = 1
net.ipv4.tcp_rfc1337 = 1
net.ipv4.tcp_sack = 1
net.ipv4.tcp_fack = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_adv_win_scale = 2

# 内存缓冲区优化
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.ipv4.udp_rmem_min = 16384
net.ipv4.udp_wmem_min = 16384

# 拥塞控制与队列优化
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
EOF

    apply_settings
}

# 系统资源限制优化
optimize_limits() {
    echo -e "\n${Header} 正在优化系统资源限制..."
    
    local CPU_CORES=$(nproc)
    local MEM_GB=$(free -g | awk '/Mem:/ {print $2}')
    
    # 备份并清理旧配置
    sed -i '/# NNC.SH优化配置/,/# ---------------------------/d' /etc/security/limits.conf
    
    cat >> /etc/security/limits.conf << EOF

# ---------------------------
# 系统资源限制优化 (NNC.SH)
# 逻辑CPU核心数: $CPU_CORES
# 内存容量: ${MEM_GB}GB
# ---------------------------
* soft nofile 1048576
* hard nofile 1048576
* soft nproc 65535
* hard nproc 65535
* soft core unlimited
* hard core unlimited
EOF

    # 内核级限制调整
    echo "fs.file-max = 1048576" >> /etc/sysctl.conf
    echo "fs.nr_open = 1048576" >> /etc/sysctl.conf
    sysctl -p >/dev/null 2>&1

    echo -e "${Info} 资源限制优化完成！当前生效值："
    echo -e "  - 最大文件描述符: $(ulimit -n)"
    echo -e "${Tip} 完全生效需要重新登录或执行: ulimit -n 1048576"
}

# 开启内核转发功能
enable_forward() {
    echo -e "\n${Header} 正在开启内核转发功能..."
    
    sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf
    sed -i '/net.ipv4.conf.all.forwarding/d' /etc/sysctl.conf
    sed -i '/net.ipv4.conf.default.forwarding/d' /etc/sysctl.conf
    
    cat >> /etc/sysctl.conf << EOF

# 内核转发配置
net.ipv4.ip_forward = 1
net.ipv4.conf.all.forwarding = 1
net.ipv4.conf.default.forwarding = 1
EOF

    apply_settings
    echo -e "${Info} 内核转发功能已启用！"
}

# 配置抗DDOS参数
anti_ddos() {
    echo -e "\n${Header} 正在配置抗DDOS参数..."
    
    local ddos_params=(
        net.ipv4.tcp_syn_retries net.ipv4.tcp_synack_retries 
        net.ipv4.tcp_max_orphans net.ipv4.icmp_echo_ignore_all
        net.ipv4.icmp_echo_ignore_broadcasts net.netfilter.nf_conntrack_max
    )
    
    for param in "${ddos_params[@]}"; do
        sed -i "/^${param}/d" /etc/sysctl.conf
    done

    cat >> /etc/sysctl.conf << EOF

# ---------------------------
# 抗DDOS防护配置
# ---------------------------
# SYN攻击防护
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_max_orphans = 262144

# ICMP攻击防护
net.ipv4.icmp_echo_ignore_all = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1

# 连接追踪优化
net.netfilter.nf_conntrack_max = 1048576
net.netfilter.nf_conntrack_tcp_timeout_established = 3600
net.netfilter.nf_conntrack_tcp_timeout_time_wait = 60
EOF

    # 加载nf_conntrack模块（如未加载）
    modprobe nf_conntrack 2>/dev/null
    
    apply_settings
    echo -e "${Info} 抗DDOS参数已配置完成！"
    echo -e "${Tip} 建议配合iptables/nftables配置防火墙规则增强防护"
}

# 主菜单
menu() {
    while true; do
        copyright
        echo -e "  1. 智能TCP全栈优化（推荐）"
        echo -e "  2. 系统资源限制优化"
        echo -e "  3. 开启内核转发功能"
        echo -e "  4. 配置抗DDOS参数"
        echo -e "  5. 恢复系统默认配置"
        echo -e "  0. 退出脚本\n"
        
        read -p "请输入数字选择操作：" num
        case "$num" in
            1) check_root; check_system; backup_files; kernel_check; optimize_tcp ;;
            2) check_root; backup_files; optimize_limits ;;
            3) check_root; backup_files; enable_forward ;;
            4) check_root; backup_files; anti_ddos ;;
            5) restore_backup ;;
            0) exit 0 ;;
            *) echo -e "${Error} 输入无效，请重新选择！" && sleep 1 ;;
        esac
        
        read -p "按回车键返回主菜单..."
    done
}

# 异常处理
trap 'echo -e "\n${Error} 用户中断操作，正在退出..."; exit 1' SIGINT

# 主执行流程
check_root
menu
echo -e "\n${Info} 所有优化操作已完成！建议重启系统使设置完全生效。\n"