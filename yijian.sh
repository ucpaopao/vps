#!/bin/bash

# 定义颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# 检查 root 权限
check_root() {
  if [ "$(id -u)" != "0" ]; then
    echo -e "${RED}错误：必须使用 root 权限运行此脚本！${NC}"
    exit 1
  fi
}

# 检查并安装依赖包
install_dependencies() {
  local dependencies=("curl" "wget" "awk" "sed" "grep" "systemd")
  for dep in "${dependencies[@]}"; do
    if ! command -v $dep &> /dev/null; then
      echo -e "${YELLOW}正在安装 $dep...${NC}"
      apt-get install -y $dep || {
        echo -e "${RED}安装 $dep 失败！${NC}"
        exit 1
      }
    fi
  done
}

# 更新系统
update_system() {
  echo -e "${YELLOW}开始更新系统以及软件包...${NC}"
  apt-get update && apt-get upgrade -y || {
    echo -e "${RED}系统更新失败！${NC}"
    return 1
  }
  echo -e "${GREEN}系统以及软件包更新完成。${NC}"
  read -p "按 Enter 键继续..."
}

# 修改SSH端口
change_ssh_port() {
  echo -e -n "${YELLOW}请输入新的SSH端口号（默认：9006）：${NC}"
  read ssh_port
  ssh_port=${ssh_port:-9006}
  # 备份 SSH 配置文件
  cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak || {
    echo -e "${RED}备份 SSH 配置文件失败！${NC}"
    return 1
  }
  # 修改 SSH 端口
  sed -i "s/^#Port 22/Port $ssh_port/" /etc/ssh/sshd_config
  sed -i "s/^Port 22/Port $ssh_port/" /etc/ssh/sshd_config
  # 重启 SSH 服务
  systemctl restart sshd || {
    echo -e "${RED}SSH 服务重启失败，已恢复原始配置！${NC}"
    cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config
    systemctl restart sshd
    return 1
  }
  echo -e "${GREEN}SSH端口已修改为$ssh_port，请用新端口重新连接！${NC}"
  read -p "按 Enter 键继续..."
}

# 安装与管理 UFW
setup_ufw() {
  echo -e "${YELLOW}正在安装 UFW...${NC}"
  # 安装 UFW
  if ! command -v ufw &> /dev/null; then
    apt-get install ufw -y || {
      echo -e "${RED}安装 UFW 失败！${NC}"
      return 1
    }
  fi
  # 检测 SSH 端口
  ssh_port=$(grep -i "^Port" /etc/ssh/sshd_config | awk '{print $2}')
  if [ -z "$ssh_port" ]; then
    ssh_port=9006
  fi
  # 放行 SSH 端口
  echo -e "${YELLOW}正在放行 SSH 端口 $ssh_port...${NC}"
  ufw allow $ssh_port/tcp || {
    echo -e "${RED}放行 SSH 端口 $ssh_port 失败！${NC}"
    return 1
  }
  # 检测并放行其他运行中的端口
  echo -e "${YELLOW}正在检测并放行运行中的端口...${NC}"
  for port in $(ss -tuln | awk '/LISTEN/ {print $5}' | awk -F':' '{print $NF}'); do
    if [ "$port" != "$ssh_port" ]; then
      ufw allow $port/tcp || {
        echo -e "${RED}放行端口 $port 失败！${NC}"
        return 1
      }
    fi
  done
  # 设置 UFW 默认规则
  ufw default allow outgoing
  ufw default deny incoming
  # 启用 UFW
  echo -e "${YELLOW}正在启用 UFW...${NC}"
  ufw --force enable || {
    echo -e "${RED}启用 UFW 失败！${NC}"
    return 1
  }
  # 查看 UFW 状态
  echo -e "${GREEN}UFW 已启用并配置完成！当前状态："
  ufw status verbose
  echo -e "${NC}"
  read -p "按 Enter 键继续..."
}

# 设置Swap
setup_swap() {
  echo -e -n "${YELLOW}请输入Swap大小（单位：MB）：${NC}"
  read swap_size
  if [ -f /swapfile ]; then
    swapoff /swapfile || {
      echo -e "${RED}禁用现有 Swap 失败！${NC}"
      return 1
    }
    rm /swapfile || {
      echo -e "${RED}删除现有 Swap 文件失败！${NC}"
      return 1
    }
  fi
  dd if=/dev/zero of=/swapfile bs=1M count=$swap_size status=progress || {
    echo -e "${RED}创建 Swap 文件失败！${NC}"
    return 1
  }
  chmod 600 /swapfile || {
    echo -e "${RED}设置 Swap 文件权限失败！${NC}"
    return 1
  }
  mkswap /swapfile || {
    echo -e "${RED}初始化 Swap 失败！${NC}"
    return 1
  }
  swapon /swapfile || {
    echo -e "${RED}启用 Swap 失败！${NC}"
    return 1
  }
  echo "/swapfile swap swap defaults 0 0" >> /etc/fstab || {
    echo -e "${RED}写入 fstab 失败！${NC}"
    return 1
  }
  echo -e "${GREEN}Swap设置成功！当前Swap：$(free -h | awk '/Swap/{print $2}')${NC}"
  read -p "按 Enter 键继续..."
}

# 设置Fail2ban
setup_fail2ban() {
  echo -e -n "${YELLOW}请输入ban时间（秒）：${NC}"
  read ban_time
  echo -e -n "${YELLOW}请输入最大尝试次数：${NC}"
  read max_retry
  # 安装验证
  if ! command -v fail2ban-client &> /dev/null; then
    apt-get install fail2ban -y || {
      echo -e "${RED}安装 Fail2ban 失败！${NC}"
      return 1
    }
  fi
  # 配置模板
  cat > /etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
bantime = $ban_time
findtime = 3600
maxretry = $max_retry
EOF
  systemctl restart fail2ban || {
    echo -e "${RED}重启 Fail2ban 失败！${NC}"
    return 1
  }
  echo -e "${GREEN}配置已生效！当前状态："
  fail2ban-client status sshd
  echo -e "${NC}"
  read -p "按 Enter 键继续..."
}

# 运行规格检测
run_benchmark() {
  echo -e "${YELLOW}正在运行规格检测...${NC}"
  curl -sL bench.sh | bash || {
    echo -e "${RED}规格检测失败！${NC}"
    return 1
  }
  read -p "按 Enter 键继续..."
}

# 运行CPU跑分
run_cpu_benchmark() {
  echo -e "${YELLOW}正在运行CPU跑分...${NC}"
  curl -sL yabs.sh | bash || {
    echo -e "${RED}CPU跑分失败！${NC}"
    return 1
  }
  read -p "按 Enter 键继续..."
}

# 安装 Docker 和 Docker Compose
install_docker() {
  echo -e "${YELLOW}开始安装 Docker 环境...${NC}"
  # Docker 安装验证
  if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com | bash -s docker || {
      echo -e "${RED}安装 Docker 失败！${NC}"
      return 1
    }
    systemctl enable --now docker || {
      echo -e "${RED}启动 Docker 服务失败！${NC}"
      return 1
    }
  fi
  # Docker Compose 安装验证
  if ! command -v docker-compose &> /dev/null; then
    compose_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f4)
    curl -L "https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose || {
      echo -e "${RED}下载 Docker Compose 失败！${NC}"
      return 1
    }
    chmod +x /usr/local/bin/docker-compose || {
      echo -e "${RED}设置 Docker Compose 权限失败！${NC}"
      return 1
    }
  fi
  echo -e "${GREEN}安装结果："
  docker --version | awk '{print "Docker: "$3}'
  docker-compose --version | awk '{print "Docker Compose: "$3}'
  echo -e "${NC}"
  read -p "按 Enter 键继续..."
}

# 安装 3x-ui
install_3x_ui() {
  echo -e "${YELLOW}正在安装 3x-ui...${NC}"
  # 下载并安装 3x-ui
  curl -sL https://raw.githubusercontent.com/3x-ui/3x-ui/master/install.sh | bash || {
    echo -e "${RED}安装 3x-ui 失败！${NC}"
    return 1
  }
  echo -e "${GREEN}3x-ui 安装完成！${NC}"
  read -p "按 Enter 键继续..."
}

# 开启 BBR + FQ（网络优化）
enable_bbr_fq() {
  echo -e "${YELLOW}正在开启 BBR + FQ...${NC}"
  # 开启 BBR
  echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
  echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
  sysctl -p || {
    echo -e "${RED}应用 BBR 配置失败！${NC}"
    return 1
  }
  echo -e "${GREEN}BBR + FQ 已开启！${NC}"
  read -p "按 Enter 键继续..."
}

# 设置500G磁盘自动挂载

# 设置500G磁盘自动挂载
setup_disk_mount() {
  echo -e "${YELLOW}正在检查磁盘和分区...${NC}"
  lsblk
  echo -e -n "${YELLOW}请输入需要挂载的分区（例如 /dev/vdb1）：${NC}"
  read partition
  if [ -z "$partition" ]; then
    echo -e "${RED}未输入分区，退出操作！${NC}"
    return 1
  fi

  # 检查分区是否存在
  if ! lsblk | grep -q "$(basename $partition)"; then
    echo -e "${RED}分区 $partition 不存在！${NC}"
    return 1
  fi

  # 检查分区是否已格式化
  if ! blkid $partition &> /dev/null; then
    echo -e "${YELLOW}分区 $partition 未格式化！${NC}"
    echo -e -n "${YELLOW}是否要格式化为 ext4 文件系统？（y/n）：${NC}"
    read format_choice
    if [[ "$format_choice" =~ ^[Yy]$ ]]; then
      mkfs.ext4 $partition || {
        echo -e "${RED}格式化分区失败！${NC}"
        return 1
      }
      echo -e "${GREEN}分区 $partition 已成功格式化为 ext4 文件系统！${NC}"
    else
      echo -e "${RED}未格式化分区，退出操作！${NC}"
      return 1
    fi
  fi

  # 获取文件系统类型
  fs_type=$(blkid $partition -o value -s TYPE)
  if [ -z "$fs_type" ]; then
    echo -e "${RED}无法获取分区文件系统类型！${NC}"
    return 1
  fi

  # 创建挂载点
  echo -e -n "${YELLOW}请输入挂载点（例如 /mnt/data）：${NC}"
  read mount_point
  if [ -z "$mount_point" ]; then
    echo -e "${RED}未输入挂载点，退出操作！${NC}"
    return 1
  fi
  mkdir -p $mount_point || {
    echo -e "${RED}创建挂载点失败！${NC}"
    return 1
  }

  # 手动挂载分区
  mount $partition $mount_point || {
    echo -e "${RED}挂载分区失败！${NC}"
    return 1
  }

  # 配置开机自动挂载
  uuid=$(blkid $partition -o value -s UUID)
  if [ -z "$uuid" ]; then
    echo -e "${RED}无法获取分区 UUID！${NC}"
    return 1
  fi
  echo "UUID=$uuid $mount_point $fs_type defaults 0 0" >> /etc/fstab || {
    echo -e "${RED}写入 /etc/fstab 失败！${NC}"
    return 1
  }

  # 验证挂载
  df -h | grep $mount_point || {
    echo -e "${RED}挂载验证失败！${NC}"
    return 1
  }

  echo -e "${GREEN}分区 $partition 已成功挂载到 $mount_point，并配置开机自动挂载！${NC}"
  read -p "按 Enter 键继续..."
}

# 主菜单
main_menu() {
  while true; do
    clear
    echo -e "${YELLOW}========================="
    echo "         选项菜单         "
    echo "=========================${NC}"
    echo "1. 更新系统以及软件包"
    echo "2. 修改SSH端口"
    echo "3. 安装与管理 UFW（检测并放行运行中的端口）"
    echo "4. 设置Swap（单位：MB）"
    echo "5. 设置Fail2ban（提供ban的时间和次数的选项）"
    echo "6. 运行规格检测"
    echo "7. 运行CPU跑分"
    echo "8. 安装 Docker 和 Docker Compose"
    echo "9. 安装 3x-ui"
    echo "10. 开启 BBR + FQ（网络优化）"
    echo "11. 设置500G磁盘自动挂载"
    echo "0. 退出脚本"
    echo ""

    # 选项输入合法性检查
    while true; do
      echo -n "请输入选项："
      read option
      if [[ "$option" =~ ^[0-9]+$ ]] && [ "$option" -ge 0 ] && [ "$option" -le 11 ]; then
        break
      else
        echo -e "${RED}无效选项，请输入 0 到 11 之间的数字！${NC}"
      fi
    done

    case $option in
      1) update_system ;;
      2) change_ssh_port ;;
      3) setup_ufw ;;
      4) setup_swap ;;
      5) setup_fail2ban ;;
      6) run_benchmark ;;
      7) run_cpu_benchmark ;;
      8) install_docker ;;
      9) install_3x_ui ;;
      10) enable_bbr_fq ;;
      11) setup_disk_mount ;;
      0) exit_script ;;
      *) echo -e "${RED}无效选项，请重新输入！${NC}" ;;
    esac
  done
}

# 退出脚本
exit_script() {
  echo -e "${GREEN}感谢使用，脚本已退出。${NC}"
  exit 0
}

# 初始化脚本
check_root
install_dependencies
main_menu