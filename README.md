# 一键脚本大全

> **📢 使用说明**：每个代码块均为独立命令，点击右上角复制按钮直接使用  
> **⚠️ 注意事项**：部分脚本需 root 权限，执行前请确认网络畅通

---

## 🔍 VPS 基本信息检测
```bash
# 快速检测服务器基础信息
bash <(curl -sL https://run.NodeQuality.com)
```

---

## 🌏 网络质量检测
```bash
# 完整路由测试（TCP大包，北京+上海+广东）
bash <(curl -Ls Net.Check.Place) -R
```

```bash
# 低流量模式（Mb级流量多维度测试）
bash <(curl -Ls Net.Check.Place) -L
```

---

## 🛠️ 系统重装（DD）

### Linux 系统
```bash
# 史上最强脚本 - Debian 12
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd 'password'
```

```bash
# 萌咖脚本 - Debian 11
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p 密码 -port 端口 -a -firmware
```

```bash
# beta.gs 脚本
wget --no-check-certificate -O NewReinstall.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
```

### Windows 系统
```bash
# Windows 10 中文版
bash <(curl -sSL https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh) -windows 10 -lang "cn"
```

```bash
# Windows 激活命令（PowerShell中执行）
irm https://get.activated.win | iex
```

---

## 📊 综合测试

### 基础测试
```bash
# Bench.sh 基础测试
wget -qO- bench.sh | bash
```

```bash
# LemonBench 快速测试
wget -qO- https://raw.githubusercontent.com/LemonBench/LemonBench/main/LemonBench.sh | bash -s -- --fast
```

```bash
# 融合怪多合一测试
bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh)
```

```bash
# NodeBench 专项测试
bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh)
```

---

## 🏋️ 性能测试 (YABS)
```bash
# 完整性能测试
curl -sL yabs.sh | bash
```

```bash
# 仅测 Geekbench 5（跳过网络）
curl -sL yabs.sh | bash -s -- -i5
```

```bash
# 仅测 Geekbench 5（跳过网络+磁盘）
curl -sL yabs.sh | bash -s -- -if5
```

```bash
# 指定 Geekbench 5 测试
curl -sL yabs.sh | bash -s -- -5
```

---

## 📺 流媒体解锁检测
```bash
# 通用流媒体检测
bash <(curl -L -s check.unlock.media)
```

```bash
# 原生 IP 检测
bash <(curl -sL Media.Check.Place)
```

```bash
# 高精度地区检测
bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh)
```

```bash
# IP 质量体检
bash <(curl -sL IP.Check.Place)
```

```bash
# DNS 解锁工具
wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/main/dns-unlock.sh && bash dns-unlock.sh
```

---

## 🚀 网络测速
```bash
# Speedtest 经典测速
bash <(curl -sL bash.icu/speedtest)
```

```bash
# Taier 多节点测速
bash <(curl -sL res.yserver.ink/taier.sh)
```

```bash
# hyperspeed 极速测试
bash <(curl -Lso- https://bench.im/hyperspeed)
```

```bash
# 全球节点测速
curl -sL network-speed.xyz | bash
```

---

## 🔁 回程路由测试
```bash
# 简易回程测试
curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh
```

```bash
# 详细回程测试 (推荐)
wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh
```

```bash
# 三网深度测试
wget https://ghproxy.com/https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh
```

---

## ⚙️ 系统功能脚本

### 系统优化
```bash
# 添加 SWAP 虚拟内存
wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
```

```bash
# Fail2ban 防暴力破解
wget --no-check-certificate https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log
```

```bash
# 美西服务器 TCP 调优
wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
```

### 网络加速
```bash
# 一键开启 BBR
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf && echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf && sysctl -p
```

```bash
# 多功能 BBR 脚本
wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```

```bash
# 锐速/BBR2/BBR3 混合加速
wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh
```

```bash
# WARP 双栈网络
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh [option] [lisence/url/token]
```

### 端口检测
```bash
# 25端口开放测试
telnet smtp.aol.com 25
```

---

## 📦 一键安装常用软件

### 开发环境
```bash
# Docker 容器环境
curl -sSL https://get.daocloud.io/docker | sh
```

```bash
# Python 环境
curl -O https://raw.githubusercontent.com/lx969788249/lxspacepy/master/pyinstall.sh && chmod +x pyinstall.sh && ./pyinstall.sh
```

```bash
# iPerf3 网络测试
apt install iperf3
```

### 代理工具
```bash
# Realm 隧道转发
bash <(curl -L https://raw.githubusercontent.com/zhouh047/realm-oneclick-install/main/realm.sh)
```

```bash
# GOST 多协议代理
wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/qqrrooty/EZgost/main/gost.sh && chmod +x gost.sh && ./gost.sh
```

### 管理面板
```bash
# 极光面板
bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)
```

```bash
# 哪吒监控
curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
```

---

## 🔗 维护声明
1. 所有脚本均来自开源社区，**不保证安全性**  
2. 定期执行 `apt update && apt upgrade` 更新系统  
3. 建议在干净环境中测试脚本  
4. 问题反馈请提供 **操作系统版本** 和 **错误日志**
