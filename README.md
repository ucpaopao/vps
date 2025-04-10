# 一键脚本大全

> 点击代码块右上角复制按钮直接使用  
> 部分脚本需 root 权限，执行前请确认网络畅通

---

## 🔍 VPS 基本信息检测
```bash
bash <(curl -sL https://run.NodeQuality.com)
```

---

## 🌏 网络质量检测
```bash
bash <(curl -Ls Net.Check.Place) -R
```
```bash
bash <(curl -Ls Net.Check.Place) -L
```

---

## 🛠️ 系统重装（DD）
```bash
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd 'password'
```
```bash
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p 密码 -port 端口 -a -firmware
```
```bash
wget --no-check-certificate -O NewReinstall.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
```
```bash
bash <(curl -sSL https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh) -windows 10 -lang "cn"
```
```bash
irm https://get.activated.win | iex
```

---

## 📊 综合测试
```bash
wget -qO- bench.sh | bash
```
```bash
wget -qO- https://raw.githubusercontent.com/LemonBench/LemonBench/main/LemonBench.sh | bash -s -- --fast
```
```bash
bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh)
```
```bash
bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh)
```

---

## 🏋️ 性能测试 (YABS)
```bash
curl -sL yabs.sh | bash
```
```bash
curl -sL yabs.sh | bash -s -- -i5
```
```bash
curl -sL yabs.sh | bash -s -- -if5
```
```bash
curl -sL yabs.sh | bash -s -- -5
```

---

## 📺 流媒体解锁检测
```bash
bash <(curl -L -s check.unlock.media)
```
```bash
bash <(curl -sL Media.Check.Place)
```
```bash
bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh)
```
```bash
bash <(curl -sL IP.Check.Place)
```
```bash
wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/main/dns-unlock.sh && bash dns-unlock.sh
```

---

## 🚀 网络测速
```bash
bash <(curl -sL bash.icu/speedtest)
```
```bash
bash <(curl -sL res.yserver.ink/taier.sh)
```
```bash
bash <(curl -Lso- https://bench.im/hyperspeed)
```
```bash
curl -sL network-speed.xyz | bash
```

---

## 🔁 回程路由测试
```bash
curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh
```
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh
```
```bash
wget https://ghproxy.com/https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh
```

---

## ⚙️ 系统功能脚本
```bash
wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
```
```bash
wget --no-check-certificate https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log
```
```bash
wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
```
```bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf && echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf && sysctl -p
```
```bash
wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```
```bash
wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh
```
```bash
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh [option] [lisence/url/token]
```
```bash
telnet smtp.aol.com 25
```

---

## 📦 一键安装常用软件
```bash
curl -sSL https://get.daocloud.io/docker | sh
```
```bash
curl -O https://raw.githubusercontent.com/lx969788249/lxspacepy/master/pyinstall.sh && chmod +x pyinstall.sh && ./pyinstall.sh
```
```bash
apt install iperf3
```
```bash
bash <(curl -L https://raw.githubusercontent.com/zhouh047/realm-oneclick-install/main/realm.sh)
```
```bash
wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/qqrrooty/EZgost/main/gost.sh && chmod +x gost.sh && ./gost.sh
```
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)
```
```bash
curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
```

---

## 🔗 维护声明
1. 所有脚本均来自开源社区，不保证安全性  
2. 建议在干净环境中测试脚本  
3. 问题反馈请提供操作系统版本和错误日志
