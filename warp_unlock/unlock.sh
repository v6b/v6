#!/usr/bin/env bash

export LANG=en_US.UTF-8

# 当前脚本版本号和新增功能
VERSION='1.10'

# 最大支持流媒体
SUPPORT_NUM='2'

# 选择 IP API 服务商
IP_API=https://api.ip.sb/geoip; ISP=isp
#IP_API=https://ifconfig.co/json; ISP=asn_org
#IP_API=https://ip.gs/json; ISP=asn_org

E[0]="Language:\n  1.English (default) \n  2.简体中文"
C[0]="${E[0]}"
E[1]="Upgrade the Netflix unlocking section"
C[1]="升级解锁奈飞的方式"
E[2]="The script must be run as root, you can enter sudo -i and then download and run again. Feedback: [https://github.com/fscarmen/warp_unlock/issues]"
C[2]="必须以root方式运行脚本，可以输入 sudo -i 后重新下载运行，问题反馈:[https://github.com/fscarmen/warp_unlock/issues]"
E[3]="Choose:"
C[3]="请选择:"
E[4]="Neither the WARP network interface nor Socks5 are installed, please select the installation script:\n 1. fscarmen's wgcf warp (Default)\n 2. fscarmen's warp-go\n 3. P3terx\n 4. Misaka\n 0. Exit"
C[4]="WARP 网络接口和 Socks5 都没有安装，请选择安装脚本:\n 1. fscarmen's wgcf warp (默认)\n 2. fscarmen's warp-go\n 3. P3terx\n 4. Misaka\n 0. 退出"
E[5]="The script supports Debian, Ubuntu, CentOS or Alpine systems only. Feedback: [https://github.com/fscarmen/warp_unlock/issues]"
C[5]="本脚本只支持 Debian、Ubuntu、CentOS 或 Alpine 系统,问题反馈:[https://github.com/fscarmen/warp_unlock/issues]"
E[6]="Please choose to brush WARP IP:\n 1. WARP Socks5 Proxy\n 2. WARP IPv6 Interface"
C[6]="请选择刷 WARP IP 方式:\n 1. WARP Socks5 代理\n 2. WARP IPv6 网络接口"
E[7]="Installing \$c..."
C[7]="安装 \$c 中……"
E[8]="It is necessary to upgrade the latest package library before install \$c.It will take a little time,please be patiently..."
C[8]="先升级软件库才能继续安装 \$c，时间较长，请耐心等待……"
E[9]="Failed to install \$c. The script is aborted. Feedback: [https://github.com/fscarmen/warp_unlock/issues]"
C[9]="安装 \$c 失败，脚本中止，问题反馈:[https://github.com/fscarmen/warp_unlock/issues]"
E[10]="Media unlock daemon installed successfully. The running log of the scheduled task will be saved in /root/result.log"
C[10]="媒体解锁守护进程已安装成功。定时任务运行日志将保存在 /root/result.log"
E[11]="The media unlock daemon is completely uninstalled."
C[11]="媒体解锁守护进程已彻底卸载"
E[12]="\n 1. Mode 1: Check it every 5 minutes.\n 2. Mode 2: Create a jobs with systemd service. The process runs in the background. When the unlock is all successful, it will be checked every 1 hour.\n 3. Mode 3: Create a jobs with nohup to run. The process runs in the background. When the unlock is all successful, it will be checked every 1 hour.\n 4. Mode 4: Create a screen named [u] and run. The process runs in the background. When the unlock is all successful, it will be checked every 1 hour.\n 5. Mode 5: Install pm2 daemon. The process runs in the background. When the unlock is all successful, it will be checked every 1 hour.\n 6. Uninstall\n 0. Exit\n"
C[12]="\n 1. 模式1: 定时5分钟检查一次,遇到不解锁时更换 WARP IP，直至刷成功\n 2. 模式2: 创建 systemd 服务。进程一直在后台，当刷成功后，每隔1小时检查一次\n 3. 模式3: 用 nohup 创建一个 jobs。进程一直在后台，当刷成功后，每隔1小时检查一次\n 4. 模式4: 创建一个名为 [u] 的 Screen 会话。进程一直在后台，当刷成功后，每隔1小时检查一次\n 5. 模式5: 安装 pm2 守护进程，安装依赖需较长时间。进程一直在后台，当刷成功后，每隔1小时检查一次\n 6. 卸载\n 0. 退出\n"
E[13]="The current region is \$REGION. Confirm press [y] . If you want another regions, please enter the two-digit region abbreviation. \(such as hk,sg. Default is \$REGION\):"
C[13]="当前地区是:\$REGION，需要解锁当前地区请按 y , 如需其他地址请输入两位地区简写 \(如 hk,sg，默认:\$REGION\):"
E[14]="Wrong input."
C[14]="输入错误"
E[15]="Select the stream media you wanna unlock (Multiple selections are possible, such as 12. The default is select all)\n 1. Netflix\n 2. Disney+"
C[15]="选择你期望解锁的流媒体 (可多选，如 12，默认为全选)\n 1. Netflix\n 2. Disney+"
E[16]="The script Born to make stream media unlock by WARP. Detail:[https://github.com/fscarmen/warp_unlock]\n Features:\n\t • Support a variety of main stream streaming media detection.\n\t • Multiple ways to unlock.\n\t • Support WARP Socks5 Proxy to detect and replace IP.\n\t • log output"
C[16]="本项目专为 WARP 解锁流媒体而生。详细说明：[https://github.com/fscarmen/warp_unlock]\n 脚本特点:\n\t • 支持多种主流串流影视检测\n\t • 多种方式解锁\n\t • 支持 WARP Socks5 Proxy 检测和更换 IP\n\t • 日志输出"
E[17]="Version"
C[17]="脚本版本"
E[18]="New features"
C[18]="功能新增"
E[19]="\\\n Stream media unlock daemon is running in mode: \$UNLOCK_MODE_NOW.\\\n"
C[19]="\\\n 流媒体解锁守护正在以模式: \$UNLOCK_MODE_NOW 运行中\\\n"
E[20]="Media unlock daemon installed successfully. A session window u has been created, enter [screen -Udr u] and close [screen -SX u quit]. The VPS restart will still take effect. The running log of the scheduled task will be saved in /root/result.log"
C[20]="媒体解锁守护进程已安装成功，已创建一个会话窗口 u ，进入 [screen -Udr u]，关闭 [screen -SX u quit]，VPS 重启仍生效。进入任务运行日志将保存在 /root/result.log"
E[21]="Media unlock daemon installed successfully. A jobs has been created, check [pgrep -laf warp_unlock] and close [kill -9 \$(pgrep -f warp_unlock)]. The VPS restart will still take effect. The running log of the scheduled task will be saved in /root/result.log"
C[21]="媒体解锁守护进程已安装成功，已创建一个jobs，查看 [pgrep -laf warp_unlock]，关闭 [kill -9 \$(pgrep -f warp_unlock)]，VPS 重启仍生效。进入任务运行日志将保存在 /root/result.log"
E[22]="The script runs on today: \$TODAY. Total:\$TOTAL"
C[22]="脚本当天运行次数:\$TODAY，累计运行次数：\$TOTAL"
E[23]="Please choose to brush WARP IP:\n 1. WARP IPv4 Interface\n 2. WARP IPv6 Interface"
C[23]="请选择刷 WARP IP 方式:\n 1. WARP IPv4 网络接口\n 2. WARP IPv6 网络接口"
E[24]=""
C[24]=""
E[25]="No unlock method specified."
C[25]="没有指定的解锁模式"
E[26]="Expected region abbreviation should be two digits (eg hk,sg)."
C[26]="期望地区简码应该为两位 (如 hk,sg)"
E[27]="No unlock script is installed."
C[27]="解锁脚本还没有安装"
E[28]="Unlock script is installed."
C[28]="解锁脚本已安装"
E[29]="Please enter Bot Token if you need push the logs to Telegram. Leave blank to skip:"
C[29]="如需要把日志推送到 Telegram 机器人，请输入 Bot Token，不需要直接回车:"
E[30]="Enter USERID:"
C[30]="输入 USERID:"
E[31]="Enter custom name:"
C[31]="自定义名称:"
E[32]="The account type is Teams and does not support changing IP\n  1. Change to free (default)\n  2. Change to plus\n  3. Quit"
C[32]="账户类型为 Teams，不支持更换 IP\n  1. 更换为 free (默认)\n  2. 更换为 plus\n  3. 退出"
E[33]="Input errors up to 5 times.The script is aborted."
C[33]="输入错误达5次，脚本退出"
E[34]="License should be 26 characters, please re-enter WARP+ License. Otherwise press Enter to continue. \(\${i} times remaining\): "
C[34]="License 应为26位字符,请重新输入 WARP+ License \(剩余\${i}次\): "
E[35]="Please customize the WARP+ device name (Default is [warp-go] if left blank):"
C[35]="请自定义 WARP+ 设备名 (如果不输入，默认为 [warp-go]):"
E[36]="Press [y] to confirm whether to uninstall dependencies: nodejs and npm. Other keys do not uninstall by default:"
C[36]="是否卸载依赖 nodejs 和 npm，确认请按 [y] ，其他键默认不卸载:"
E[37]=""
C[37]=""
E[38]=""
C[38]=""
E[39]=""
C[39]=""
E[40]="Mode 1: Check it every 5 minutes"
C[40]="模式1: 定时5分钟检查一次,遇到不解锁时更换 WARP IP，直至刷成功"
E[41]="Mode 2: Create a screen named [u] and run"
C[41]="模式2: 创建一个名为 [u] 的 Screen 在后台刷"
E[42]="Mode 3: Create a jobs with nohup to run in the background"
C[42]="模式3: 用 nohup 创建一个 jobs 在后台刷"
E[43]="Media unlock daemon installed successfully. A systemd service has been created, check [systemctl status warp_unlock] and close [systemctl disable --now warp_unlock]. The VPS restart will still take effect. The running log of the scheduled task will be saved in /root/result.log"
C[43]="媒体解锁守护进程已安装成功，已创建一个 systemd 服务，查看 [systemctl status warp_unlock]，关闭 [systemctl disable --now warp_unlock]，VPS 重启仍生效。进入任务运行日志将保存在 /root/result.log"
E[44]="Media unlock daemon installed successfully. pm2 daemon is running, check pm2 [list] and close [pm2 delete warp_unlock; pm2 unstartup systemd;]. The VPS restart will still take effect. The running log of the scheduled task will be saved in /root/result.log"
C[44]="媒体解锁守护进程已安装成功，pm2 守护进程正在工作中，查看 [pm2 list]，关闭 [pm2 delete warp_unlock; pm2 unstartup systemd; ]，VPS 重启仍生效。进入任务运行日志将保存在 /root/result.log"
E[45]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP Socks5 Proxy"
C[45]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP Socks5 代理"
E[46]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP IPv6 Interface"
C[46]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP IPv6 网络接口"
E[47]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP Socks5 Proxy\n 3. WARP IPv6 Interface\n"
C[47]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP Socks5 代理\n 3. WARP IPv6 网络接口"
E[48]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP IPv4 Interface"
C[48]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP IPv4 网络接口"
E[49]="Please choose to brush WARP IP:\n 1. WARP Socks5 Proxy\n 2. WARP IPv4 Interface"
C[49]="请选择刷 WARP IP 方式:\n 1. WARP Socks5 代理\n 2. WARP IPv4 网络接口\n"
E[50]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP Socks5 Proxy\n 3. WARP IPv4 Interface"
C[50]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP Socks5 代理\n 3. WARP IPv4 网络接口"
E[51]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP IPv4 Interface\n 3. WARP IPv6 Interface"
C[51]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP IPv4 网络接口\n 3. WARP IPv6 网络接口"
E[52]="Please choose to brush WARP IP:\n 1. WARP Socks5 Proxy\n 2. WARP IPv4 Interface\n 3. WARP IPv6 Interface"
C[52]="请选择刷 WARP IP 方式:\n 1. WARP Socks5 代理\n 2. WARP IPv4 网络接口\n 3. WARP IPv6 网络接口"
E[53]="Please choose to brush WARP IP:\n 1. WireProxy\n 2. WARP Socks5 Proxy\n 3. WARP IPv4 Interface\n 4. WARP IPv6 Interface"
C[53]="请选择刷 WARP IP 方式:\n 1. WireProxy\n 2. WARP Socks5 代理\n 3. WARP IPv4 网络接口\n 4. WARP IPv6 网络接口"
E[54]="No option. The script is aborted. Feedback: [https://github.com/fscarmen/warp_unlock/issues]"
C[54]="没有该选项，脚本退出，问题反馈:[https://github.com/fscarmen/warp_unlock/issues]"

# 自定义字体彩色，read 函数，友道翻译函数，安装依赖函数
red() { echo -e "\033[31m\033[01m$*\033[0m"; }
error() { echo -e "\033[31m\033[01m$*\033[0m" && exit 1; }
info() { echo -e "\033[32m\033[01m$*\033[0m"; }
hint() { echo -e "\033[33m\033[01m$*\033[0m"; }
reading() { read -rp "$(info "$1")" "$2"; }
text() { eval echo "\${${L}[$*]}"; }
text_eval() { eval echo "\$(eval echo "\${${L}[$*]}")"; }
translate() { [ -n "$1" ] && curl -ksm8 "http://fanyi.youdao.com/translate?&doctype=json&type=AUTO&i=$1" | cut -d \" -f18 2>/dev/null; }
check_dependencies() {
  for c in $*; do
    type -p $c >/dev/null 2>&1 || (hint " $(text_eval 7) " && ${PACKAGE_INSTALL[b]} $c 2>/dev/null) || (hint " $(text_eval 8) " && ${PACKAGE_UPDATE[b]} && ${PACKAGE_INSTALL[b]} $c 2>/dev/null)
    ! type -p $c >/dev/null 2>&1 && error " $(text_eval 9) " && exit 1
  done
}

# 脚本当天及累计运行次数统计
statistics_of_run-times() {
  COUNT=$(curl -ksm1 "https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffscarmen%2Fwarp_unlock%2Fmain%2Funlock.sh&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false" 2>&1) &&
  TODAY=$(expr "$COUNT" : '.*\s\([0-9]\{1,\}\)\s/.*') && TOTAL=$(expr "$COUNT" : '.*/\s\([0-9]\{1,\}\)\s.*')
}

# 选择语言，先判断 warp 脚本里的语言选择，没有的话再让用户选择，默认英语
select_laguage() {
  if [ -z "$L" ]; then
    if [ -e /opt/warp-go/language ]; then
	  L=$(cat /opt/warp-go/language 2>&1)
	elif [ -e /etc/wireguard/language ]; then
	  L=$(cat /etc/wireguard/language 2>&1)
	else
      case $(cat /etc/wireguard/language 2>&1) in
        E ) L=E;;
        C ) L=C;;
        * ) L=E && hint "\n $(text 0) \n" && reading " $(text 3) " LANGUAGE
		[ "$LANGUAGE" = 2 ] && L=C;;
      esac
	fi
  fi
}

check_system_info() {
  # 多方式判断操作系统，试到有值为止。只支持 Debian 10/11、Ubuntu 18.04/20.04 或 CentOS 7/8 ,如非上述操作系统，退出脚本
  CMD=( "$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)"
        "$(hostnamectl 2>/dev/null | grep -i system | cut -d : -f2)"
        "$(lsb_release -sd 2>/dev/null)"
        "$(grep -i description /etc/lsb-release 2>/dev/null | cut -d \" -f2)"
        "$(grep . /etc/redhat-release 2>/dev/null)"
        "$(grep . /etc/issue 2>/dev/null | cut -d \\ -f1 | sed '/^[ ]*$/d')"
      )

  for a in "${CMD[@]}"; do
    SYS="$a" && [ -n "$SYS" ] && break
  done

  REGEX=("debian" "ubuntu" "centos|red hat|kernel|oracle linux|amazon linux|alma|rocky")
  RELEASE=("Debian" "Ubuntu" "CentOS")
  PACKAGE_UPDATE=("apt -y update" "apt -y update" "yum -y update")
  PACKAGE_INSTALL=("apt -y install" "apt -y install" "yum -y install")
  PACKAGE_UNINSTALL=("apt -y autoremove" "apt -y autoremove" "yum -y autoremove")

  for ((b=0; b<${#REGEX[@]}; b++)); do
    [[ $(tr '[:upper:]' '[:lower:]' <<< "$SYS") =~ ${REGEX[b]} ]] && SYSTEM="${RELEASE[b]}" && break
  done
  [ -z "$SYSTEM" ] && error " $(text 5) "
}

# 检查是否有安装任一版本的 python 依赖，如全部没有，则安装 python3
check_python() {
  PY=("python" "python2")
  for g in "${PY[@]}"; do type -p $g >/dev/null 2>&1 && PYTHON=$g && break; done
  [ -z "$PYTHON" ] && PYTHON=python3 && check_dependencies $PYTHON
}

# 检查解锁是否已运行，如果是则判断模式，以前给更换模式赋值
check_unlock_running() {
  [ -e /usr/bin/warp_unlock.sh ] &&
  UNLOCK_MODE_NOW=$(grep -s "MODE=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  EXPECT=$(grep -s "EXPECT=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  TOKEN=$(grep -s "TOKEN=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  USERID=$(grep -s "USERID=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  CUSTOM=$(grep -s "CUSTOM=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  NIC=$(grep -s "NIC=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  RESTART=$(grep -s "RESTART=" /usr/bin/warp_unlock.sh | cut -d \" -f2) &&
  PYTHON=$(grep -s "PYTHON=" /usr/bin/warp_unlock.sh | cut -d \" -f2)
}

# 判断是否已经安装 WARP 网络接口或者 Socks5 代理,如已经安装组件尝试启动。再分情况作相应处理
check_warp() {
  if [ -z "${STATUS[*]}" ]; then
    if [[ $(ip a) =~ ": WARP:"|": wgcf:" ]]; then
      WARP="--interface wgcf"
      if [[ $(ip a) =~ ": WARP:" ]]; then
        WARP="--interface WARP"
        # 检测账户类型为 Team 的不能更换
        if grep -qE 'Type[ ]+=[ ]+team' /opt/warp-go/warp.conf; then
          hint "\n $(text 32) \n" && reading " $(text 3) " CHANGE_ACCOUNT
          case "$CHANGE_ACCOUNT" in
            2 ) [ -z "$LICENSE" ] && reading " $(text 42) " LICENSE
                local i=5
                until [[ "$LICENSE" =~ ^[A-Z0-9a-z]{8}-[A-Z0-9a-z]{8}-[A-Z0-9a-z]{8}$ ]]; do
                  (( i-- )) || true
                  [ "$i" = 0 ] && error " $(text 33) " && exit 1 || reading " $(text 34) " LICENSE
                done
                [[ -n "$LICENSE" && -z "$NAME" ]] && reading " $(text 35) " NAME
                [ -n "$NAME" ] && NAME="${NAME//[[:space:]]/_}" || NAME=${NAME:-'warp-go'}
                echo "$LICENSE" > /opt/warp-go/License
                echo "$NAME" > /opt/warp-go/Device_Name;;
            3 ) exit 0;;
          esac
        fi
      fi
      TRACE4=$(curl -ks4m8 $WARP https://www.cloudflare.com/cdn-cgi/trace | grep warp | sed "s/warp=//g")
      TRACE6=$(curl -ks6m8 $WARP https://www.cloudflare.com/cdn-cgi/trace | grep warp | sed "s/warp=//g")
      [[ "$TRACE4" =~ on|plus ]] && STATUS[0]=1 || STATUS[0]=0
      [[ "$TRACE6" =~ on|plus ]] && STATUS[1]=1 || STATUS[1]=0
    else
      STATUS=(0 0)
    fi

    # 在已安装 Client 的前提下，区分模式 Mode
    if type -p warp-cli >/dev/null 2>&1; then
      ! systemctl is-active warp-svc >/dev/null 2>&1 && systemctl start warp-svc && sleep 5
      if [[ $(warp-cli --accept-tos settings) =~ WarpProxy ]]; then
        [[ $(ss -nltp) =~ 'warp-svc' ]] && CLIENT_PORT=$(ss -nltp | grep warp-svc | grep -oP '127\.0*\S+' | cut -d: -f2) && STATUS[2]=1 || STATUS[2]=0
      else
        [[ $(ip a) =~ 'CloudflareWARP' ]] && STATUS[2]=1 || STATUS[2]=0
      fi
    else STATUS[2]=0
    fi

    type -p wireproxy >/dev/null 2>&1 && [[ ! $(ss -nltp) =~ 'wireproxy' ]] && systemctl restart wireproxy
    [[ $(ss -nltp) =~ 'wireproxy' ]] && WIREPROXY_PORT=$(ss -nltp | grep wireproxy | grep -oP '127\.0*\S+' | cut -d: -f2) && STATUS[3]=1 || STATUS[3]=0
  fi

  wgcf_warp() { wget -N --no-check-certificate https://raw.githubusercontent.com/fscarmen/warp/main/menu.sh && bash menu.sh; exit; }
  warp-go() { wget -N --no-check-certificate https://raw.githubusercontent.com/fscarmen/warp/main/warp-go.sh && bash warp-go.sh; exit; }
  p3terx() { bash <(curl -fsSL git.io/warp.sh) menu; exit; }
  misaka() { wget -N --no-check-certificate https://gitlab.com/misakablog/warp-script/-/raw/main/warp.sh && bash warp.sh; exit; }

  CASE_IPV4() { NIC="-ks4m8 $WARP"; RESTART="warp_restart"; }
  CASE_IPV6() { NIC="-ks6m8 $WARP"; RESTART="warp_restart"; }
  CASE_CLIENT() { NIC='-ks4m8 --interface CloudflareWARP' && RESTART="client_restart" && [[ $(warp-cli --accept-tos settings) =~ WarpProxy ]] && NIC="-sx socks5h://localhost:$CLIENT_PORT"; }
  CASE_WIREPROXY() { NIC="-sx socks5h://localhost:$WIREPROXY_PORT"; RESTART="wireproxy_restart"; }

  INSTALL_CHECK=("0 0 0 0" "1 1 1 1" "0 1 1 1" "1 0 1 1" "1 1 0 1" "1 1 1 0" "0 0 1 1" "0 1 0 1" "0 1 1 0" "1 0 0 1" "1 0 1 0" "1 1 0 0" "0 0 0 1"  "0 0 1 0" "0 1 0 0" "1 0 0 0")
  SHOW=("\n $(text 4) \n" "\n $(text 53) \n" "\n $(text 47) \n" "\n $(text 50) \n" "\n $(text 51) \n" "\n $(text 52) \n" "\n $(text 45) \n" "\n $(text 46) \n" "\n $(text 6) \n" "\n $(text 48) \n" "\n $(text 49) \n" "\n $(text 23) \n")
  NUM=("0|1|2|3|4" "1|2|3|4" "1|2|3" "1|2|3" "1|2|3" "1|2|3" "1|2" "1|2" "1|2" "1|2" "1|2" "1|2")
  DO1=("wgcf_warp" "CASE_WIREPROXY" "CASE_WIREPROXY" "CASE_WIREPROXY" "CASE_WIREPROXY" "CASE_CLIENT" "CASE_WIREPROXY" "CASE_WIREPROXY" "CASE_CLIENT" "CASE_WIREPROXY" "CASE_CLIENT" "CASE_IPV4" "CASE_WIREPROXY" "CASE_CLIENT" "CASE_IPV6" "CASE_IPV4")
  DO2=("warp-go" "CASE_CLIENT" "CASE_CLIENT" "CASE_CLIENT" "CASE_IPV4" "CASE_IPV4" "CASE_CLIENT" "CASE_IPV6" "CASE_IPV6" "CASE_IPV4" "CASE_IPV4" "CASE_IPV6")
  DO3=("p3terx" "CASE_IPV4" "CASE_IPV6" "CASE_IPV4" "CASE_IPV6" "CASE_IPV6")
  DO4=("misaka" "CASE_IPV6")
  DO0=("exit")

  for ((f=0; f<${#INSTALL_CHECK[@]}; f++)); do
    [[ "${STATUS[*]}" = "${INSTALL_CHECK[f]}" ]] && break
  done
	
  # 默认只安装一种 WARP 形式时，不用选择。如两种或以上则让用户选择哪个方式的解锁
  CHOOSE2=1
  if grep -qvwE "12|13|14|15" <<< "$f"; then
    hint "${SHOW[f]}" && reading " $(text 3) " CHOOSE2
    [[ "$f" = 0 && "$CHOOSE2" != [0-4] ]] && CHOOSE2=1
    grep -qvwE "${NUM[f]}" <<< "$CHOOSE2" && error " $(text 54) "
  fi
  $(eval echo \${DO$CHOOSE2[f]})
}

# 期望解锁流媒体, 变量 SUPPORT_NUM 限制选项枚举的次数，不填默认全选, 解锁状态保存在 /usr/bin/status.log
input_streammedia_unlock() {
  if [ -z "${STREAM_UNLOCK[@]}" ]; then
    hint "\n $(text 15) \n" && reading " $(text 3) " CHOOSE4
    for ((d=0; d<"$SUPPORT_NUM"; d++)); do
      ( [ -z "$CHOOSE4" ] || echo "$CHOOSE4" | grep -q "$((d+1))" ) && STREAM_UNLOCK[d]='1' || STREAM_UNLOCK[d]='0'
      [ "$d" = 0 ] && echo 'null' > /usr/bin/status.log || echo 'null' >> /usr/bin/status.log
    done
  fi
  UNLOCK_SELECT=$(for ((e=0; e<"$SUPPORT_NUM"; e++)); do
                    [ "${STREAM_UNLOCK[e]}" = 1 ] && echo -e "[[ ! \${R[*]} =~ 'No' ]] && check$e;" || echo -e "#[[ ! \${R[*]} =~ 'No' ]] && check$e;"
                  done)
}

# 期望解锁地区
input_region() {
  if [ -z "$EXPECT" ]; then
  REGION=$(curl -ksm8 -A Mozilla $IP_API | grep -E "country_iso|country_code" | sed 's/.*country_[a-z]\+\":[ ]*\"\([^"]*\).*/\1/g' 2>/dev/null)
  reading "\n $(text_eval 13) " EXPECT
  until [[ -z "$EXPECT" || "$EXPECT" = [Yy] || "$EXPECT" =~ ^[A-Za-z]{2}$ ]]; do
    reading "\n $(text_eval 13) " EXPECT
  done
  [[ -z "$EXPECT" || "$EXPECT" = [Yy] ]] && EXPECT="$REGION"
  fi
}

# Telegram Bot 日志推送
input_tg() {
  [ -z "$CUSTOM" ] && reading "\n $(text_eval 29) " TOKEN
  [[ -n "$TOKEN" && -z "$USERID" ]] && reading "\n $(text_eval 30) " USERID
  [[ -n "$USERID" && -z "$CUSTOM" ]] && reading "\n $(text_eval 31) " CUSTOM
}

# 根据用户选择在线生成解锁程序，放在 /etc/wireguard/unlock.sh
export_unlock_file() {
  input_streammedia_unlock

  input_region

  input_tg

  # 检测 Disney+ 需要用到 python 依赖
  [[ "${STREAM_UNLOCK[1]}" = 1 && -z "$PYTHON" ]] && check_python

  # 根据解锁模式写入定时任务或systemd
  sh -c "$TASK"

  # 生成 warp_unlock.sh 文件，判断当前流媒体解锁状态，遇到不解锁时更换 WARP IP，直至刷成功。5分钟后还没有刷成功，将不会重复该进程而浪费系统资源
  # 感谢以下两位作者: lmc999 [https://github.com/lmc999/RegionRestrictionCheck] 和 luoxue-bot [https://github.com/luoxue-bot/warp_auto_change_ip]
  # 根据 lmc999 脚本检测 Netflix Title，如获取不到，使用兜底默认值
  cat <<EOF >/usr/bin/warp_unlock.sh
#!/usr/bin/env bash
MODE="$CHOOSE1"
EXPECT="$EXPECT"
TOKEN="$TOKEN"
USERID="$USERID"
CUSTOM="$CUSTOM"
NIC="$NIC"
RESTART="$RESTART"
LOG_LIMIT="1000"
PYTHON="$PYTHON"
UNLOCK_STATUS='Yes 🎉'
NOT_UNLOCK_STATUS='No 😰'
LMC999=\$(curl -sSLm4 https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
RESULT_TITLE=(\$(echo "\$LMC999" | grep "result.*netflix.com/title/" | sed "s/.*title\/\([^\"]*\).*/\1/"))
REGION_TITLE=\$(echo "\$LMC999" | grep "region.*netflix.com/title/" | sed "s/.*title\/\([^\"]*\).*/\1/")
[[ ! \${RESULT_TITLE[0]} =~ ^[0-9]+$ ]] && RESULT_TITLE[0]='81280792'
[[ ! \${RESULT_TITLE[1]} =~ ^[0-9]+$ ]] && RESULT_TITLE[1]='70143836'
[[ ! "\$REGION_TITLE" =~ ^[0-9]+$ ]] && REGION_TITLE='80018499'

timedatectl set-timezone Asia/Shanghai

if [[ \$(pgrep -laf ^[/d]*bash.*warp_unlock | awk -F, '{a[\$2]++}END{for (i in a) print i" "a[i]}') -le 2 ]]; then
  log_output="\\\$(date +'%F %T'). \\\\\tIP: \\\$WAN \\\\\tCountry: \\\$COUNTRY \\\\\t\\\$CONTENT"
  tg_output="💻 \\\$CUSTOM. ⏰ \\\$(date +'%F %T'). 🛰 \\\$WAN  🌏 \\\$COUNTRY. \\\$CONTENT"

  log_message() { echo -e "\$(eval echo "\$log_output")" | tee -a /root/result.log; [[ \$(cat /root/result.log | wc -l) -gt \$LOG_LIMIT ]] && sed -i "1,10d" /root/result.log; }
  tg_message() { curl -s -X POST "https://api.telegram.org/bot\$TOKEN/sendMessage" -d chat_id=\$USERID -d text="\$(eval echo "\$tg_output")" -d parse_mode="HTML" >/dev/null 2>&1; }

  check_ip() {
    unset IP_INFO WAN COUNTRY ASNORG
    IP_INFO="\$(curl \$NIC -A Mozilla $IP_API 2>/dev/null)"
    WAN=\$(expr "\$IP_INFO" : '.*ip\":[ ]*\"\([^"]*\).*')
    COUNTRY=\$(expr "\$IP_INFO" : '.*country\":[ ]*\"\([^"]*\).*')
    ASNORG=\$(expr "\$IP_INFO" : '.*'$ISP'\":[ ]*\"\([^"]*\).*')
  }

  # api 注册账户,优先使用 warp-go 团队 api,后备使用官方 api 脚本
  registe_api() {
    local REGISTE_FILE="\$1"
    local i=0; local j=5
    until [ -e /opt/warp-go/\$REGISTE_FILE ]; do
      ((i++)) || true
      [ "\$i" -gt "\$j" ] && rm -f /opt/warp-go/warp.conf.tmp* && echo -e " Failed to register warp account. Script aborted. " && exit 1
      if ! grep -sq 'PrivateKey' /opt/warp-go/\$REGISTE_FILE; then
        unset CF_API_REGISTE API_DEVICE_ID API_ACCESS_TOKEN API_PRIVATEKEY API_TYPE
        rm -f /opt/warp-go/\$REGISTE_FILE
        CF_API_REGISTE="\$(bash <(curl -m8 -sSL https://raw.githubusercontent.com/fscarmen/warp/main/api.sh) -r)"
        rm -f warp-account.conf
        if grep -q 'private_key' <<< "\$CF_API_REGISTE"; then
          local API_DEVICE_ID=\$(expr "\$CF_API_REGISTE " | grep -m1 'id' | cut -d\" -f4)
          local API_ACCESS_TOKEN=\$(expr "\$CF_API_REGISTE " | grep '"token' | cut -d\" -f4)
          local API_PRIVATEKEY=\$(expr "\$CF_API_REGISTE " | grep 'private_key' | cut -d\" -f4)
          local API_TYPE=\$(expr "\$CF_API_REGISTE " | grep 'account_type' | cut -d\" -f4)
          cat > /opt/warp-go/\$REGISTE_FILE << ABC
[Account]
Device = \$API_DEVICE_ID
PrivateKey = \$API_PRIVATEKEY
Token = \$API_ACCESS_TOKEN
Type = \$API_TYPE

[Device]
Name = WARP
MTU  = 1280

[Peer]
PublicKey = bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=
Endpoint = 162.159.193.10:1701
KeepAlive = 30
# AllowedIPs = 0.0.0.0/0
# AllowedIPs = ::/0

ABC
        fi
      fi
  
      if grep -sq 'Account' /opt/warp-go/\$REGISTE_FILE; then
        echo -e "\n[Script]\nPostUp =\nPostDown =" >> /opt/warp-go/\$REGISTE_FILE && sed -i 's/\r//' /opt/warp-go/\$REGISTE_FILE

        LICENSE="\$(cat /opt/warp-go/License 2>/dev/null)"
        NAME="\$(cat /opt/warp-go/Device_Name 2>/dev/null)"

        [[ -n "\$LICENSE" && -n "\$NAME" ]] && /opt/warp-go/warp-go --update --config=/opt/warp-go/\$REGISTE_FILE --license=\$LICENSE --device-name=\$NAME >/dev/null 2>&1
      else
        rm -f /opt/warp-go/\$REGISTE_FILE
      fi
   done
  }

  warp_restart() {
    if [[ \$(ip link show | awk -F': ' '{print $2}') =~ 'WARP' ]];then
      cp -f /opt/warp-go/warp.conf{,.tmp1}
      registe_api warp.conf.tmp2
      [ -e /opt/warp-go/warp.conf.tmp2 ] && sleep 10
      sed -i '1,6!d' /opt/warp-go/warp.conf.tmp2
      tail -n +7 /opt/warp-go/warp.conf.tmp1 >> /opt/warp-go/warp.conf.tmp2
      mv /opt/warp-go/warp.conf.tmp2 /opt/warp-go/warp.conf
      /opt/warp-go/warp-go --config=/opt/warp-go/warp.conf.tmp1 --remove >/dev/null 2>&1
      rm -f /opt/warp-go/warp.conf.tmp*
      systemctl restart warp-go
      sleep 10
    else
      systemctl restart wg-quick@wgcf
      sleep 2
      ss -nltp | grep 'dnsmasq' >/dev/null 2>&1 && systemctl restart dnsmasq >/dev/null 2>&1
      sleep 2
    fi
    check_ip
  }

  client_restart() {
    [[ \$(warp-cli --accept-tos settings) =~ WarpProxy ]] && CLIENT_PROXY=1
    warp-cli --accept-tos delete >/dev/null 2>&1
    [[ \$CLIENT_PROXY != 1 ]] && ( ip -4 rule delete from 172.16.0.2/32 lookup 51820; ip -4 rule delete table main suppress_prefixlength 0 )
    warp-cli --accept-tos register >/dev/null 2>&1 &&
    [[ -e /etc/wireguard/license ]] && warp-cli --accept-tos set-license \$(cat /etc/wireguard/license) >/dev/null 2>&1
    sleep 10
    [[ \$CLIENT_PROXY != 1 ]] && ( ip -4 rule add from 172.16.0.2 lookup 51820; ip -4 route add default dev CloudflareWARP table 51820; ip -4 rule add table main suppress_prefixlength 0 )
    check_ip
  }

  wireproxy_restart() { systemctl restart wireproxy; sleep 5; check_ip; }

  check0() {
    RESULT[0]=""; REGION[0]=""; R[0]=""

    for ((l=0; l<\${#RESULT_TITLE[@]}; l++)); do
      RESULT_NETFLIX[l]=\$(curl --user-agent "\${UA_Browser}" \$NIC -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/\${RESULT_TITLE[l]}")
      [ "\${RESULT_NETFLIX[l]}" = 200 ] && break
    done

    if [[ \${RESULT_NETFLIX[@]} =~ 200 ]]; then
      REGION[0]=\$(curl --user-agent "\${UA_Browser}" \$NIC -fs --max-time 10 --write-out %{redirect_url} --output /dev/null "https://www.netflix.com/title/\$REGION_TITLE" | sed 's/.*com\/\([^-/]\{1,\}\).*/\1/g' | tr '[:lower:]' '[:upper:]')
      REGION[0]=\${REGION[0]:-'US'}
    fi
    echo "\${REGION[0]}" | grep -qi "\$EXPECT" && R[0]="\$UNLOCK_STATUS" || R[0]="\$NOT_UNLOCK_STATUS"
    CONTENT="Netflix: \${R[0]}."
    log_message
    [[ -n "\$CUSTOM" ]] && [[ \${R[0]} != \$(sed -n '1p' /usr/bin/status.log) ]] && tg_message
    sed -i "1s/.*/\${R[0]}/" /usr/bin/status.log
  }

  check1() {
    unset PreAssertion assertion disneycookie TokenContent isBanned is403 fakecontent refreshToken disneycontent tmpresult previewcheck isUnabailable region inSupportedLocation
    R[1]=""
    PreAssertion=\$(curl \$NIC --user-agent "\${UA_Browser}" -s --max-time 10 -X POST "https://disney.api.edge.bamgrid.com/devices" -H "authorization: Bearer ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" -H "content-type: application/json; charset=UTF-8" -d '{"deviceFamily":"browser","applicationRuntime":"chrome","deviceProfile":"windows","attributes":{}}' 2>&1)
    [[ "\$PreAssertion" == "curl"* ]] && R[1]="\$NOT_UNLOCK_STATUS"
    if [[ \${R[1]} != "\$NOT_UNLOCK_STATUS" ]]; then
    assertion=\$(echo \$PreAssertion | \$PYTHON -m json.tool 2> /dev/null | grep assertion | cut -f4 -d'"')
    PreDisneyCookie=\$(curl \$NIC --max-time 10 "https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/cookies" | sed -n '1p')
    disneycookie=\$(echo \$PreDisneyCookie | sed "s/DISNEYASSERTION/\${assertion}/g")
    TokenContent=\$(curl \$NIC --user-agent "\${UA_Browser}" -s --max-time 10 -X POST "https://disney.api.edge.bamgrid.com/token" -H "authorization: Bearer ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" -d "\$disneycookie")
    isBanned=\$(echo \$TokenContent | \$PYTHON -m json.tool 2>/dev/null | grep 'forbidden-location')
    is403=\$(echo \$TokenContent | grep '403 ERROR')
    [[ -n "\$isBanned\$is403" ]] && R[1]="\$NOT_UNLOCK_STATUS"
    fi

    if [[ \${R[1]} != "\$NOT_UNLOCK_STATUS" ]]; then
    fakecontent=\$(curl -s --max-time 10 "https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/cookies" | sed -n '8p')
    refreshToken=\$(echo \$TokenContent | \$PYTHON -m json.tool 2>/dev/null | grep 'refresh_token' | awk '{print \$2}' | cut -f2 -d'"')
    disneycontent=\$(echo \$fakecontent | sed "s/ILOVEDISNEY/\${refreshToken}/g")
    tmpresult=\$(curl \$NIC --user-agent "\${UA_Browser}" -X POST -sSL --max-time 10 "https://disney.api.edge.bamgrid.com/graph/v1/device/graphql" -H "authorization: ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" -d "\$disneycontent" 2>&1)
    previewcheck=\$(curl \$NIC -s -o /dev/null -L --max-time 10 -w '%{url_effective}\n' "https://disneyplus.com" | grep preview)
    isUnabailable=\$(echo \$previewcheck | grep 'unavailable')
    region=\$(echo \$tmpresult | \$PYTHON -m json.tool 2>/dev/null | grep 'countryCode' | cut -f4 -d'"')
    inSupportedLocation=\$(echo \$tmpresult | \$PYTHON -m json.tool 2>/dev/null | grep 'inSupportedLocation' | awk '{print \$2}' | cut -f1 -d',')
    [[ "\$region" == "JP" || ( -n "\$region" && "\$inSupportedLocation" == "true" ) ]] && R[1]="\$UNLOCK_STATUS" || R[1]="\$NOT_UNLOCK_STATUS"
    fi
    CONTENT="Disney+: \${R[1]}."
    log_message
    [[ -n "\$CUSTOM" ]] && [[ \${R[1]} != \$(sed -n '2p' /usr/bin/status.log) ]] && tg_message
    sed -i "2s/.*/\${R[1]}/" /usr/bin/status.log
  }

  ${MODE2[0]}
  check_ip
  CONTENT='Script runs.'
  log_message
  UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x6*4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"
  $UNLOCK_SELECT
  until [[ ! \${R[*]}  =~ "\$NOT_UNLOCK_STATUS" ]]; do
    unset R
    \$RESTART
    $UNLOCK_SELECT
  done
  ${MODE2[1]}
fi
EOF

  chmod +x /usr/bin/warp_unlock.sh
}

# 输出执行结果
result_output() {
  info " $RESULT_OUTPUT "
  info " $(text_eval 22) \n"
}

# 卸载
uninstall() {
  node -v >/dev/null 2>&1 && npm -v >/dev/null 2>&1 && PM2=1 && reading " $(text 36) " REMOVE_DEPS
  if [ "$PM2" = 1 ]; then
    pm2 delete warp_unlock >/dev/null 2>&1
    pm2 unstartup systemd >/dev/null 2>&1
    [[ "$REMOVE_DEPS" = [Yy] ]] && ${PACKAGE_UNINSTALL[b]} nodejs npm
  fi
  screen -QX u quit >/dev/null 2>&1 && screen -wipe >/dev/null 2>&1
  type -p wg-quick >/dev/null 2>&1 && systemctl restart wgcf >/dev/null 2>&1
  type -p warp-cli >/dev/null 2>&1 && ( warp-cli --accept-tos delete >/dev/null 2>&1; sleep 1; warp-cli --accept-tos register >/dev/null 2>&1 )
  sed -i '/warp_unlock.sh/d' /etc/crontab
  kill -9 $(pgrep -f warp_unlock.sh) >/dev/null 2>&1
  rm -f /usr/bin/warp_unlock.sh /root/result.log /usr/bin/status.log /etc/systemd/system/warp_unlock.service
  systemctl disable --now warp_unlock >/dev/null 2>&1


  # 输出执行结果，如是切换模式则不显示
  [ "$UN" = 1 ] && info "\n $(text 11) \n"
}

# 传参 1/2
[[ "$*" =~ -[Ee] ]] && L=E
[[ "$*" =~ -[Cc] ]] && L=C

# 主程序运行 1/2
statistics_of_run-times
select_laguage

# 传参 2/2
while getopts ":UuM:m:A:a:N:n:T:t:" OPTNAME; do
  case "$OPTNAME" in
    'U'|'u' ) if [ ! -e /usr/bin/warp_unlock.sh ]; then
                error " $(text 27) "
    	        else
			          UN=1; uninstall; exit 0
              fi ;;
    'M'|'m' ) [ -z "$UNLOCK_MODE_NOW" ] && check_unlock_running
              if [ -n "$UNLOCK_MODE_NOW" ]; then
                error " $(text 28) "
              else
			          [[ $OPTARG != [1-5] ]] && error " $(text 25) " || CHOOSE1=$OPTARG
              fi ;;
    'A'|'a' ) [[ ! "$OPTARG" =~ ^[A-Za-z]{2}$ ]] && error " $(text 26) " || EXPECT="$OPTARG" ;;
    'N'|'n' ) for ((d=0; d<"$SUPPORT_NUM"; d++)); do
                [[ $d = 0 ]] && echo 'null' > /usr/bin/status.log || echo 'null' >> /usr/bin/status.log
              done
              echo "$OPTARG" | grep -qi 'n' && STREAM_UNLOCK[0]='1' || STREAM_UNLOCK[0]='0'
              echo "$OPTARG" | grep -qi 'd' && STREAM_UNLOCK[1]='1' || STREAM_UNLOCK[1]='0' ;;
    'T'|'t' ) TOKEN="$(echo $OPTARG | cut -d'@' -f1)"
              USERID="$(echo $OPTARG | cut -d'@' -f2)"
              CUSTOM="$(echo $OPTARG | cut -d'@' -f3)"
              CUSTOM="${CUSTOM:-'Stream Media Unlock'}" ;;
  esac
done

# 主程序运行 2/2
check_system_info
check_unlock_running
check_dependencies curl
check_warp
MODE2=("while true; do" "sleep 1h; done")
[ -n "$UNLOCK_MODE_NOW" ] && MENU_SHOW="$(text_eval 19)$(text 12)" || MENU_SHOW="$(text 12)"

action1() {
  unset MODE2
  [ -n "$UNLOCK_MODE_NOW" ] && uninstall
  check_dependencies cron
  TASK="sed -i '/warp_unlock.sh/d' /etc/crontab && echo \"*/5 * * * * root bash /usr/bin/warp_unlock.sh\" >> /etc/crontab"
  RESULT_OUTPUT="\n $(text 10) \n"
  export_unlock_file
  result_output
}

action2() {
  [ -n "$UNLOCK_MODE_NOW" ] && uninstall
  TASK="cat <<EOF > /etc/systemd/system/warp_unlock.service
[Unit]
Description = WARP unlock
After = network.target

[Service]
ExecStart = /usr/bin/warp_unlock.sh
Restart = always
Type = simple

[Install]
WantedBy = multi-user.target
EOF"
  RESULT_OUTPUT="\n $(text 43) \n"
  export_unlock_file
  systemctl enable --now warp_unlock >/dev/null 2>&1 &
  result_output
}

action3() {
  [ -n "$UNLOCK_MODE_NOW" ] && uninstall
  TASK="sed -i '/warp_unlock.sh/d' /etc/crontab && echo \"@reboot root nohup bash /usr/bin/warp_unlock.sh &\" >> /etc/crontab"
  RESULT_OUTPUT="\n $(text 21) \n"
  export_unlock_file
  nohup bash /usr/bin/warp_unlock.sh >/dev/null 2>&1 &
  result_output
}

action4() {
  [ -n "$UNLOCK_MODE_NOW" ] && uninstall
  TASK="sed -i '/warp_unlock.sh/d' /etc/crontab && echo \"@reboot root screen -USdm u bash /usr/bin/warp_unlock.sh\" >> /etc/crontab"
  RESULT_OUTPUT="\n $(text 20) \n"
  check_dependencies screen
  export_unlock_file
  screen -USdm u bash /usr/bin/warp_unlock.sh
  result_output
}

action5() {
  [ -n "$UNLOCK_MODE_NOW" ] && uninstall
  TASK=""
  RESULT_OUTPUT="\n $(text 44) \n"
  node -v >/dev/null 2>&1 || DEPS+='nodejs'
  npm -v >/dev/null 2>&1 || DEPS+=' npm'
  [ -n "$DEPS" ] && ( ${PACKAGE_UPDATE[b]}; ${PACKAGE_INSTALL[b]} $DEPS 2>/dev/null )
  npm install -g pm2
  export_unlock_file
  pm2 start /usr/bin/warp_unlock.sh
  pm2 save; pm2 startup
  result_output
}

action6() { UN=1; uninstall; }

action0() { exit 0; }

# 菜单显示
menu() {
  clear
  hint " $(text 16) "
  red "======================================================================================================================\n"
  info " $(text 17): $VERSION  $(text 18): $(text 1)\n "
  red "======================================================================================================================\n"
  [ -z "$CHOOSE1" ] && hint " $MENU_SHOW " && reading " $(text 3) " CHOOSE1
  case "$CHOOSE1" in
    [0-6] ) action$CHOOSE1;;
    * ) red " $(text 14) "; sleep 1; menu;;
  esac
}

menu