# 一键脚本大全

> **✅ 使用说明**：  
> - 每个命令均为独立代码块，点击右上角复制按钮 **仅复制命令**  
> - 部分脚本需 root 权限，执行前请确认网络畅通

---

## 🔍 VPS 基本信息检测

**快速检测服务器基础信息**  
```bash
bash <(curl -sL https://run.NodeQuality.com)
```

---

## 🌏 网络质量检测

**完整路由测试（TCP大包，北京+上海+广东）**  
```bash
bash <(curl -Ls Net.Check.Place) -R
```

**低流量模式（Mb级流量多维度测试）**  
```bash
bash <(curl -Ls Net.Check.Place) -L
```

---

## 🛠️ 系统重装（DD）

### Linux 系统

**史上最强脚本 - Debian 12**  
```bash
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd 'password'
```

**萌咖脚本 - Debian 11**  
```bash
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p 密码 -port 端口 -a -firmware
```

**beta.gs 脚本**  
```bash
wget --no-check-certificate -O NewReinstall.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
```

### Windows 系统

**Windows 10 中文版**  
```bash
bash <(curl -sSL https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh) -windows 10 -lang "cn"
```

**Windows 激活命令（PowerShell中执行）**  
```bash
irm https://get.activated.win | iex
```

---

## 📊 综合测试

**Bench.sh 基础测试**  
```bash
wget -qO- bench.sh | bash
```

**LemonBench 快速测试**  
```bash
wget -qO- https://raw.githubusercontent.com/LemonBench/LemonBench/main/LemonBench.sh | bash -s -- --fast
```

**融合怪多合一测试**  
```bash
bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh)
```

**NodeBench 专项测试**  
```bash
bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh)
```

---

## 🏋️ 性能测试 (YABS)

**完整性能测试**  
```bash
curl -sL yabs.sh | bash
```

**仅测 Geekbench 5（跳过网络）**  
```bash
curl -sL yabs.sh | bash -s -- -i5
```

**仅测 Geekbench 5（跳过网络+磁盘）**  
```bash
curl -sL yabs.sh | bash -s -- -if5
```

**指定 Geekbench 5 测试**  
```bash
curl -sL yabs.sh | bash -s -- -5
```

---

## 📺 流媒体解锁检测

**通用流媒体检测**  
```bash
bash <(curl -L -s check.unlock.media)
```

**原生 IP 检测**  
```bash
bash <(curl -sL Media.Check.Place)
```

**高精度地区检测**  
```bash
bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh)
```

**IP 质量体检**  
```bash
bash <(curl -sL IP.Check.Place)
```

**DNS 解锁工具**  
```bash
wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/main/dns-unlock.sh && bash dns-unlock.sh
```

---

## 🚀 网络测速

**Speedtest 经典测速**  
```bash
bash <(curl -sL bash.icu/speedtest)
```

**Taier 多节点测速**  
```bash
bash <(curl -sL res.yserver.ink/taier.sh)
```

**hyperspeed 极速测试**  
```bash
bash <(curl -Lso- https://bench.im/hyperspeed)
```

**全球节点测速**  
```bash
curl -sL network-speed.xyz | bash
```

---

## 🔁 回程路由测试

**简易回程测试**  
```bash
curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh
```

**详细回程测试 (推荐)**  
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh
```

**三网深度测试**  
```bash
wget https://ghproxy.com/https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh
```

---

## ⚙️ 系统功能脚本

### 系统优化

**添加 SWAP 虚拟内存**  
```bash
wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
```

**Fail2ban 防暴力破解**  
```bash
wget --no-check-certificate https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log
```

**美西服务器 TCP 调优**  
```bash
wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
```

### 网络加速

**一键开启 BBR**  
```bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf && echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf && sysctl -p
```

**多功能 BBR 脚本**  
```bash
wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```

**锐速/BBR2/BBR3 混合加速**  
```bash
wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh
```

**WARP 双栈网络**  
```bash
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh [option] [lisence/url/token]
```

### 端口检测

**25端口开放测试**  
```bash
telnet smtp.aol.com 25
```

---

## 📦 一键安装常用软件

### 开发环境

**Docker 容器环境**  
```bash
curl -sSL https://get.daocloud.io/docker | sh
```

**Python 环境**  
```bash
curl -O https://raw.githubusercontent.com/lx969788249/lxspacepy/master/pyinstall.sh && chmod +x pyinstall.sh && ./pyinstall.sh
```

**iPerf3 网络测试**  
```bash
apt install iperf3
```

### 代理工具

**Realm 隧道转发**  
```bash
bash <(curl -L https://raw.githubusercontent.com/zhouh047/realm-oneclick-install/main/realm.sh)
```

**GOST 多协议代理**  
```bash
wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/qqrrooty/EZgost/main/gost.sh && chmod +x gost.sh && ./gost.sh
```

### 管理面板

**极光面板**  
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)
```

**哪吒监控**  
```bash
curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
```

---

## 🔗 维护声明
1. 所有脚本均来自开源社区，**不保证安全性**  
2. 建议在干净环境中测试脚本  
3. 问题反馈请提供 **操作系统版本** 和 **错误日志**
