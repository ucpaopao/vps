# 一键脚本大全

> **📌 使用说明**：  
> - 点击代码块右上角复制按钮，**仅复制命令**（不包含说明文字）  
> - 部分脚本需 root 权限，执行前请确认网络畅通

---

## 🔍 VPS 基本信息检测

| 说明 | 命令 |
|------|------|
| 快速检测服务器基础信息 | ```bash<br>bash <(curl -sL https://run.NodeQuality.com)<br>``` |

---

## 🌏 网络质量检测

| 说明 | 命令 |
|------|------|
| 完整路由测试（TCP大包，北京+上海+广东） | ```bash<br>bash <(curl -Ls Net.Check.Place) -R<br>``` |
| 低流量模式（Mb级流量多维度测试） | ```bash<br>bash <(curl -Ls Net.Check.Place) -L<br>``` |

---

## 🛠️ 系统重装（DD）

### Linux 系统

| 说明 | 命令 |
|------|------|
| 史上最强脚本 - Debian 12 | ```bash<br>wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd 'password'<br>``` |
| 萌咖脚本 - Debian 11 | ```bash<br>bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p 密码 -port 端口 -a -firmware<br>``` |
| beta.gs 脚本 | ```bash<br>wget --no-check-certificate -O NewReinstall.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh<br>``` |

### Windows 系统

| 说明 | 命令 |
|------|------|
| Windows 10 中文版 | ```bash<br>bash <(curl -sSL https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh) -windows 10 -lang "cn"<br>``` |
| Windows 激活命令（PowerShell中执行） | ```bash<br>irm https://get.activated.win | iex<br>``` |

---

## 📊 综合测试

| 说明 | 命令 |
|------|------|
| Bench.sh 基础测试 | ```bash<br>wget -qO- bench.sh | bash<br>``` |
| LemonBench 快速测试 | ```bash<br>wget -qO- https://raw.githubusercontent.com/LemonBench/LemonBench/main/LemonBench.sh | bash -s -- --fast<br>``` |
| 融合怪多合一测试 | ```bash<br>bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh)<br>``` |
| NodeBench 专项测试 | ```bash<br>bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh)<br>``` |

---

## 🏋️ 性能测试 (YABS)

| 说明 | 命令 |
|------|------|
| 完整性能测试 | ```bash<br>curl -sL yabs.sh | bash<br>``` |
| 仅测 Geekbench 5（跳过网络） | ```bash<br>curl -sL yabs.sh | bash -s -- -i5<br>``` |
| 仅测 Geekbench 5（跳过网络+磁盘） | ```bash<br>curl -sL yabs.sh | bash -s -- -if5<br>``` |
| 指定 Geekbench 5 测试 | ```bash<br>curl -sL yabs.sh | bash -s -- -5<br>``` |

---

## 📺 流媒体解锁检测

| 说明 | 命令 |
|------|------|
| 通用流媒体检测 | ```bash<br>bash <(curl -L -s check.unlock.media)<br>``` |
| 原生 IP 检测 | ```bash<br>bash <(curl -sL Media.Check.Place)<br>``` |
| 高精度地区检测 | ```bash<br>bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh)<br>``` |
| IP 质量体检 | ```bash<br>bash <(curl -sL IP.Check.Place)<br>``` |
| DNS 解锁工具 | ```bash<br>wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/main/dns-unlock.sh && bash dns-unlock.sh<br>``` |

---

## 🚀 网络测速

| 说明 | 命令 |
|------|------|
| Speedtest 经典测速 | ```bash<br>bash <(curl -sL bash.icu/speedtest)<br>``` |
| Taier 多节点测速 | ```bash<br>bash <(curl -sL res.yserver.ink/taier.sh)<br>``` |
| hyperspeed 极速测试 | ```bash<br>bash <(curl -Lso- https://bench.im/hyperspeed)<br>``` |
| 全球节点测速 | ```bash<br>curl -sL network-speed.xyz | bash<br>``` |

---

## 🔁 回程路由测试

| 说明 | 命令 |
|------|------|
| 简易回程测试 | ```bash<br>curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh<br>``` |
| 详细回程测试 (推荐) | ```bash<br>wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh<br>``` |
| 三网深度测试 | ```bash<br>wget https://ghproxy.com/https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh<br>``` |

---

## ⚙️ 系统功能脚本

### 系统优化

| 说明 | 命令 |
|------|------|
| 添加 SWAP 虚拟内存 | ```bash<br>wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh<br>``` |
| Fail2ban 防暴力破解 | ```bash<br>wget --no-check-certificate https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log<br>``` |
| 美西服务器 TCP 调优 | ```bash<br>wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh<br>``` |

### 网络加速

| 说明 | 命令 |
|------|------|
| 一键开启 BBR | ```bash<br>echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf && echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf && sysctl -p<br>``` |
| 多功能 BBR 脚本 | ```bash<br>wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/tcp.sh" && chmod +x tcp.sh && ./tcp.sh<br>``` |
| 锐速/BBR2/BBR3 混合加速 | ```bash<br>wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh<br>``` |
| WARP 双栈网络 | ```bash<br>wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh [option] [lisence/url/token]<br>``` |

### 端口检测

| 说明 | 命令 |
|------|------|
| 25端口开放测试 | ```bash<br>telnet smtp.aol.com 25<br>``` |

---

## 📦 一键安装常用软件

### 开发环境

| 说明 | 命令 |
|------|------|
| Docker 容器环境 | ```bash<br>curl -sSL https://get.daocloud.io/docker | sh<br>``` |
| Python 环境 | ```bash<br>curl -O https://raw.githubusercontent.com/lx969788249/lxspacepy/master/pyinstall.sh && chmod +x pyinstall.sh && ./pyinstall.sh<br>``` |
| iPerf3 网络测试 | ```bash<br>apt install iperf3<br>``` |

### 代理工具

| 说明 | 命令 |
|------|------|
| Realm 隧道转发 | ```bash<br>bash <(curl -L https://raw.githubusercontent.com/zhouh047/realm-oneclick-install/main/realm.sh)<br>``` |
| GOST 多协议代理 | ```bash<br>wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/qqrrooty/EZgost/main/gost.sh && chmod +x gost.sh && ./gost.sh<br>``` |

### 管理面板

| 说明 | 命令 |
|------|------|
| 极光面板 | ```bash<br>bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)<br>``` |
| 哪吒监控 | ```bash<br>curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh<br>``` |

---

## 🔗 维护声明
1. 所有脚本均来自开源社区，**不保证安全性**  
2. 建议在干净环境中测试脚本  
3. 问题反馈请提供 **操作系统版本** 和 **错误日志**
