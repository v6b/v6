# 【刷 WARP IP】 - 为 WARP 解锁流媒体而生
Born to make stream media unlock by WARP 

* * *

# 目录

- [更新信息和 TODO](README.md#更新信息和-todo)
- [脚本特点](README.md#脚本特点)
- [运行脚本](README.md#运行脚本)
- [鸣谢](README.md#鸣谢下列作者的文章和项目)

* * *

## 更新信息和 TODO
TODO: 1. ~Iptables offloads Netflix; 1. iptables 分流奈飞流量，最小化 wgcf 实现奈飞;~ 已经在隔壁 [WARP项目](https://github.com/fscarmen/warp) 完成了

2022.2.2 1.05 1. Support switch unlock modes and stream media freely; 2. Remove ASN information. Add icon in TG push; 3. Limit the log to 1000 lines; 1. 轻松地切换解锁模式和流媒体平台; 2. 去掉日志里的线路供应商信息，在 TG push 里加入icon; 3. 限制日志在1000行

2022.1.31 1.04 1. Support push the logs to Telegram. 1. 日志结果输出到 Telegram.

2022.1.30 1.03 1. Suppport pass parameter. You can run like this:```bash <(curl -sSL https://raw.githubusercontent.com/fscarmen/warp_unlock/main/unlock.sh) -E -A us -4 -N nd -M 2```; 2. Improve log details     
1. 支持传参，你可以这样运行脚本:  ```bash <(curl -sSL https://raw.githubusercontent.com/fscarmen/warp_unlock/main/unlock.sh) -E -A us -4 -N nd -M2```; 2. 把日志详细

2022.1.29 1.02 1. Support Disney+ 1. 支持 Disney+

2022.1.28 1.01 1. Add two ways to unlock; 2. Add running logs file 1. 增加两种解锁方式; 2. 加入运行日志
```
2022-01-31 21:27:35.    IP: 8.37.43.216         Country: Japan        Script runs.
2022-01-31 21:27:35.    IP: 8.37.43.216         Country: Japan        Netflix: No.
2022-01-31 21:27:56.    IP: 8.37.43.188         Country: Japan        Netflix: No.
2022-01-31 21:28:15.    IP: 8.37.43.192         Country: Japan        Netflix: No.
2022-01-31 21:28:38.    IP: 8.37.43.229         Country: Japan        Netflix: Yes.
2022-01-31 22:28:40.    IP: 8.37.43.229         Country: Japan        Script runs.
2022-01-31 22:28:42.    IP: 8.37.43.229         Country: Japan        Netflix: Yes.
```

beta 2022.1.26 Media unlock daemon. Check it every 5 minutes. If unlocked, the scheduled task exits immediately. If it is not unlocked, it will be swiped successfully in the background. Advantages: Minimized use of system resources. ~Disadvantage: Can't see the results as intuitively as screen~

## 脚本特点
* 支持多种主流串流影视检测，可以单选或多选
* 多种方式解锁: 1.每 5 分钟检测一次状态; 2. screen 后台运行; 3. nohup & 后台运行 (已经是天花板，有本事来 [issue](https://github.com/fscarmen/warp_unlock/issues) 挑战)
* 支持 WARP Socks5 Proxy 检测和更换 IP 
* 日志输出

<img src="https://user-images.githubusercontent.com/62703343/151651669-92d5263e-bfa2-4c2c-9928-683b678d9956.png" width="70%" />

<img src="https://user-images.githubusercontent.com/62703343/152547440-5abecca0-7dbe-41d1-bdfd-b09b2e459b87.png" width="50%" />

## 运行脚本

### 1.菜单方式 (menu)
```
bash <(curl -sSL https://raw.githubusercontent.com/fscarmen/warp_unlock/main/unlock.sh)
```
### 2.带参数 (pass parameter)
  | paremeter 参数 | value 值 | describe 具体动作说明 |
  | ----------|------- | --------------- |
  | -E || English 英文 |
  | -C || Chinese 中文 |
  | -U || Uninstall 卸载  |
  | -4 || Brush IPv4 IP 刷 IPv4 |
  | -6 || Brush IPv6 IP 刷 IPv6 |
  | -S || Brush Socks5  刷 Socks5 |
  | -M | 1 | Mode 1: detect every 5   minute 每5分钟检测 |
  | -M | 2 | Mode 2: run by screen   以 screen 方式运行 |
  | -M | 3 | Mode 2: run by nohup &   以 hup & 方式运行 |
  | -A | ** | region abbreviation,such as us. 地区简码,如 us |
  | -N | n | Unlock Neflix 解锁奈飞 |
  | -N | d | Unlock Disney+ 解锁迪士尼 |
  | -N | ud | Unlock Neflix and Disney+ 解锁奈飞和迪士尼 |
  | -T | Token@ID@Name | Receive messages Bot 接收信息的 TG bot 信息 |

For example 1: Language is Chinese. Unlock area is Singapore. Brush WARP IPv4. Unlock Netflix and detect every 5 minute when successed. Receive message to
举例1: 用中文，解锁新加坡奈飞，当成功的时候每5分钟检测一次，
```
bash <(curl -sSL https://raw.githubusercontent.com/fscarmen/warp_unlock/main/unlock.sh) -C -A sg -4 -N n -M 1 -T 1730133Uu5:AAF33T7sWPB8cGu31-QoaUkjdkjzeRo1_m8@1254502669@unlock
```
For example 2: Display and uninstall in English
举例2: 用英文卸载
```
bash <(curl -sSL https://raw.githubusercontent.com/fscarmen/warp_unlock/main/unlock.sh) -E -U
```


## 鸣谢下列作者的文章和项目

互联网永远不会忘记，但人们会。

技术文章和相关项目（排名不分先后）:
* luoxue-bot 的成熟作品: https://github.com/luoxue-bot/warp_auto_change_ip
* lmc999 的成熟作品: https://github.com/lmc999/RegionRestrictionCheck

服务提供（排名不分先后）:
* CloudFlare Warp(+): https://1.1.1.1/
* WGCF 项目原作者: https://github.com/ViRb3/wgcf/
* 获取公网 IP 及归属地查询: https://ip.gs/
* 统计PV网:https://hits.seeyoufarm.com/
