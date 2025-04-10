# 一键脚本集合

> 点击分类标题展开，一键复制脚本命令。  
> ⚠️ 注意：执行第三方脚本前请确认来源可信。

---

## 🛠️ 系统重装脚本

### 1. Linux 系统重装
```bash
# 史上最强脚本（Debian 12）
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd 'password'

# 萌咖大佬脚本（Debian 11）
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p 密码 -port 端口 -a -firmware

# beta.gs大佬脚本
wget --no-check-certificate -O NewReinstall.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
```

### 2. Windows 系统重装
```bash
# 史上最强脚本（Windows 10）
bash <(curl -sSL https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh) -windows 10 -lang "cn"

# 使用说明
# 账户：Administrator
# 密码：Teddysun.com
# 使用Windows徽标+R快捷键打开运行框，输入powershell运行，弹出powershell命名输入窗口，输入以下命令：
irm https://get.activated.win | iex
```

---

## 📊 综合测试脚本

### 1. 基础测试
```bash
# bench.sh
wget -qO- bench.sh | bash

# LemonBench 快速测试
wget -qO- https://raw.githubusercontent.com/LemonBench/LemonBench/main/LemonBench.sh | bash -s -- --fast

# 融合怪测试
bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh)

# NodeBench
bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh)
```

---

## 🏋️ 性能测试

### 1. yabsc 测试
```bash
# 跳过网络，测GB5
curl -sL yabs.sh | bash -s -- -i5

# 跳过网络和磁盘，测GB5
curl -sL yabs.sh | bash -s -- -if5

# 改测GB5不测GB6
curl -sL yabs.sh | bash -s -- -5
```

---

## 📺 流媒体及IP质量测试

### 1. 流媒体测试
```bash
# 最常用版本
bash <(curl -L -s check.unlock.media)

# 原生检测脚本
bash <(curl -sL Media.Check.Place)

# 准确度最高
bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh)
```

### 2. IP质量测试
```bash
# IP质量体检脚本
bash <(curl -sL IP.Check.Place)

# 一键修改解锁DNS
wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/refs/heads/main/dns-unlock.sh && bash dns-unlock.sh
```

---

## 📶 测速脚本

### 1. 常用测速工具
```bash
# Speedtest
bash <(curl -sL bash.icu/speedtest)

# Taier
bash <(curl -sL res.yserver.ink/taier.sh)

# hyperspeed
bash <(curl -Lso- https://bench.im/hyperspeed)

# 全球测速
curl -sL network-speed.xyz | bash
```

---

## 🔎 回程测试

### 1. 回程测试工具
```bash
# 直接显示回程（小白用这个）
curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh

# 回程详细测试（推荐）
wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh

# 详细回程测试
wget https://ghproxy.com/https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh
```

---

## 🛠️ 功能脚本

### 1. 系统优化
```bash
# 添加SWAP
wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh

# Fail2ban
wget --no-check-certificate https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log

# 一键开启BBR（适用于较新的Debian、Ubuntu）
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_controllsmod | grep bbr
```

### 2. 网络优化
```bash
# 多功能BBR安装脚本
wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/4f9957ae23f5efb2bb7c57a198ae2cffebfb1c56/tcp.sh" && chmod +x tcp.sh && ./tcp.sh

# 锐速/BBRPLUS/BBR2/BBR3
wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh

# TCP窗口调优
wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
```

### 3. 其他功能
```bash
# 添加warp
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh [option] [lisence/url/token]

# 25端口开放测试
telnet smtp.aol.com 25
```

---

## 🚀 一键安装常用环境及软件

### 1. 常用工具
```bash
# Docker
curl -sSL https://get.daocloud.io/docker | sh

# Python
curl -O https://raw.githubusercontent.com/lx969788249/lxspacepy/master/pyinstall.sh && chmod +x pyinstall.sh && ./pyinstall.sh

# iPerf3
apt install iperf3

# Realm
bash <(curl -L https://raw.githubusercontent.com/zhouh047/realm-oneclick-install/main/realm.sh)

# gost
wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/qqrrooty/EZgost/main/gost.sh && chmod +x gost.sh && ./gost.sh
```

### 2. 控制面板
```bash
# 极光面板
bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)

# 哪吒监控
curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh

# WARP
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh [option] [lisence/url/token]
```

---

## 📝 使用说明

1. **所有脚本均需以 `root` 用户权限执行**。
2. **执行前请确保网络连接正常**。
3. **如有特殊需求，可自行调整脚本参数**。
4. **定期更新脚本以获取最新功能**。

---
