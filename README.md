# 亚洲云Linux Tools脚本仓库

### 介绍

亚洲云（Asiayun）成立于2018年，资质齐全老商家，全球20+机房高防大带宽服务器。  
拥有IDC/ISP/ICP等资质，目前云产品覆盖以下地区：  
大陆地区：北京、上海、广州、深圳、成都、十堰、宁波  
境外地区：香港、美国、台北、东京、首尔、新加坡、雅加达、孟买、马尼拉、胡志明市、曼谷、伦敦、圣保罗、迪拜、马来西亚、德国、荷兰

[![https://www.asiayun.com](https://raw.githubusercontent.com/vpsad/linuxtools/main/sd3ROMZU.webp)](https://www.asiayun.com/)

### 官网地址

[https://www.asiayun.com](https://www.asiayun.com/)

### 脚本介绍
![https://www.asiayun.com](https://raw.githubusercontent.com/vpsad/linuxtools/main/linuxtool.png)

<font style="color:rgb(67, 67, 107);">该脚本工具的功能是快速换源，一键安装BBR、宝塔面板等，测试服务器回程线路、IP质量、流媒体解锁以及服务器性能情况、提供多种操作菜单以实现系统、网络、文件传输等功能。以下是具体功能总结：  
(AI生成的总结，如有错误或遗漏请反馈)
</font>

#### **<font style="color:rgba(0, 0, 0, 0.85);">1. 系统菜单</font>**
+ **<font style="color:rgb(67, 67, 107);">重启服务器</font>**<font style="color:rgb(67, 67, 107);">：用户可以通过该功能重启服务器，确保系统的正常运行。</font>
+ **<font style="color:rgb(67, 67, 107);">修改密码</font>**<font style="color:rgb(67, 67, 107);">：提供了一键修改服务器登录密码的功能，提高安全性。</font>
+ **<font style="color:rgb(67, 67, 107);">同步上海时间</font>**<font style="color:rgb(67, 67, 107);">：通过安装ntpdate同步服务器时间，确保时间的准确性。</font>
+ **<font style="color:rgb(67, 67, 107);">修改SSH端口</font>**<font style="color:rgb(67, 67, 107);">：用户可以方便地更改SSH端口，增强安全性。</font>
+ **<font style="color:rgb(67, 67, 107);">修改DNS</font>**<font style="color:rgb(67, 67, 107);">：支持一键修改DNS设置，提高域名解析速度。</font>
+ **<font style="color:rgb(67, 67, 107);">开启/关闭SSH登录</font>**<font style="color:rgb(67, 67, 107);">：可以禁用或启用SSH登录功能，提升系统安全。</font>
+ **<font style="color:rgb(67, 67, 107);">更新系统版本</font>**<font style="color:rgb(67, 67, 107);">：支持一键更新CentOS、Ubuntu和Debian等系统的最新版本，确保系统的稳定性和安全性。</font>
+ **<font style="color:rgb(67, 67, 107);">更换源</font>**<font style="color:rgb(67, 67, 107);">：提供更换不同操作系统源为阿里云镜像的功能，确保软件包的更新和稳定性。</font>
+ **<font style="color:rgb(67, 67, 107);">创建用户和管理员</font>**<font style="color:rgb(67, 67, 107);">：允许用户创建新用户并设置权限，满足多用户环境的管理需求。</font>
+ **<font style="color:rgb(67, 67, 107);">查看当前连接IP</font>**<font style="color:rgb(67, 67, 107);">：显示当前与服务器连接的IP地址，有助于网络安全管理。</font>
+ **<font style="color:rgb(67, 67, 107);">修改主机名</font>**<font style="color:rgb(67, 67, 107);">：允许用户修改服务器的主机名，便于管理和识别。</font>

#### **<font style="color:rgba(0, 0, 0, 0.85);">2. 网络菜单</font>**
+ **<font style="color:rgb(67, 67, 107);">重启网卡</font>**<font style="color:rgb(67, 67, 107);">：重启网络接口卡，解决网络连接问题。</font>
+ **<font style="color:rgb(67, 67, 107);">Ping测试</font>**<font style="color:rgb(67, 67, 107);">：一键开启或关闭对指定IP的Ping测试，用于检测网络连通性。</font>
+ **<font style="color:rgb(67, 67, 107);">附加IP绑定</font>**<font style="color:rgb(67, 67, 107);">：添加或删除服务器的附加IP地址，增强网络灵活性。</font>
+ **<font style="color:rgb(67, 67, 107);">查看地理位置</font>**<font style="color:rgb(67, 67, 107);">：显示服务器的地理位置信息，帮助用户了解服务器的物理位置。</font>
+ **<font style="color:rgb(67, 67, 107);">查看原生IP</font>**<font style="color:rgb(67, 67, 107);">：显示服务器的原始IP地址，用于网络配置和管理。</font>
+ **<font style="color:rgb(67, 67, 107);">检查UDP屏蔽</font>**<font style="color:rgb(67, 67, 107);">：检测并显示是否屏蔽了UDP协议，保证数据传输的完整性。</font>
+ **<font style="color:rgb(67, 67, 107);">VPS IP映射</font>**<font style="color:rgb(67, 67, 107);">：将VPS的IP地址映射到独立服务器上，实现负载均衡和高可用性。</font>
+ **<font style="color:rgb(67, 67, 107);">四层端口转发</font>**<font style="color:rgb(67, 67, 107);">：支持四层端口转发功能，提高内网访问外网的效率。</font>
+ **<font style="color:rgb(67, 67, 107);">关闭四层端口转发</font>**<font style="color:rgb(67, 67, 107);">：一键关闭已设置的四层端口转发规则，保障网络安全。</font>
+ **<font style="color:rgb(67, 67, 107);">查看使用端口</font>**<font style="color:rgb(67, 67, 107);">：列出服务器当前正在使用的端口信息，便于网络监控和管理。</font>
+ **<font style="color:rgb(67, 67, 107);">带宽使用情况</font>**<font style="color:rgb(67, 67, 107);">：查看哪个IP在占用带宽，帮助优化网络资源分配。</font>

#### **<font style="color:rgba(0, 0, 0, 0.85);">3. 文件菜单</font>**
+ **<font style="color:rgb(67, 67, 107);">上传文件到远程服务器</font>**<font style="color:rgb(67, 67, 107);">：支持一键上传本地文件到远程服务器，方便数据备份和共享。</font>
+ **<font style="color:rgb(67, 67, 107);">下载文件到本地</font>**<font style="color:rgb(67, 67, 107);">：从远程服务器下载文件到本地计算机，便于数据获取和管理。</font>
+ **<font style="color:rgb(67, 67, 107);">硬盘分区信息查看</font>**<font style="color:rgb(67, 67, 107);">：显示所有硬盘分区的信息，帮助用户了解存储状况。</font>
+ **<font style="color:rgb(67, 67, 107);">自定义挂载数据盘</font>**<font style="color:rgb(67, 67, 107);">：允许用户自定义挂载数据盘路径，灵活管理存储空间。</font>
+ **<font style="color:rgb(67, 67, 107);">卸载数据盘</font>**<font style="color:rgb(67, 67, 107);">：一键卸载已挂载的数据盘，释放存储资源。</font>
+ **<font style="color:rgb(67, 67, 107);">格式化数据盘</font>**<font style="color:rgb(67, 67, 107);">：格式化选定的数据盘，准备新的数据存储环境。</font>
+ **<font style="color:rgb(67, 67, 107);">修复坏块</font>**<font style="color:rgb(67, 67, 107);">：检测并修复硬盘超级坏块，延长硬盘使用寿命</font><font style="color:rgb(67, 67, 107);">。</font>
+ **<font style="color:rgb(67, 67, 107);">设置开机启动脚本</font>**<font style="color:rgb(67, 67, 107);">：用户可以设置开机自动执行的脚本程序，提高系统自动化管理水平</font><font style="color:rgb(67, 67, 107);">。</font>
+ **<font style="color:rgb(67, 67, 107);">关键词内容审查</font>**<font style="color:rgb(67, 67, 107);">：查询特定关键词的文件内容，用于内容审查和管理</font><font style="color:rgb(67, 67, 107);">。</font>
+ **<font style="color:rgb(67, 67, 107);">清空SSH历史命令</font>**<font style="color:rgb(67, 67, 107);">：清除SSH会话的历史记录，保护用户隐私。</font>

#### **<font style="color:rgba(0, 0, 0, 0.85);">4. 宝塔菜单</font>**
+ **<font style="color:rgb(67, 67, 107);">宝塔官方一键挂载硬盘脚本</font>**<font style="color:rgb(67, 67, 107);">：提供官方支持的硬盘挂载脚本，简化硬盘管理过程。</font>
+ **<font style="color:rgb(67, 67, 107);">安装堡塔主机安全系统</font>**<font style="color:rgb(67, 67, 107);">：一键安装堡塔主机安全系统，增强服务器安全性。</font>
+ **<font style="color:rgb(67, 67, 107);">安装Centos/OpenCloud/Alibaba稳定版</font>**<font style="color:rgb(67, 67, 107);">：支持一键安装centos稳定版的宝塔产品，提升系统稳定性。</font>
+ **<font style="color:rgb(67, 67, 107);">安装Ubuntu/Deepin宝塔稳定版</font>**<font style="color:rgb(67, 67, 107);">：为Ubuntu和Deepin操作系统提供宝塔产品的稳定版安装选项。</font>
+ **<font style="color:rgb(67, 67, 107);">安装Debian宝塔稳定版</font>**<font style="color:rgb(67, 67, 107);">：提供Debian操作系统下的宝塔产品稳定版安装选项。</font>
+ **<font style="color:rgb(67, 67, 107);">安装宝塔面板最新正式版</font>**<font style="color:rgb(67, 67, 107);">：一键安装最新的宝塔面板正式版，确保系统的现代化管理需求。</font>
+ **<font style="color:rgb(67, 67, 107);">一键安装宝塔WAF最新版</font>**<font style="color:rgb(67, 67, 107);">：一键安装最新版本的宝塔Web应用防火墙（WAF），增强网站安全防护。</font>

#### **<font style="color:rgba(0, 0, 0, 0.85);">5. 宿主机菜单</font>**
+ **<font style="color:rgb(67, 67, 107);">一键开启云服务器虚拟化</font>**<font style="color:rgb(67, 67, 107);">：该功能允许用户一键开启物理服务器的虚拟化环境，提升服务器资源的利用率和灵活性。</font>
+ **<font style="color:rgb(67, 67, 107);">一键自定义设置SWAP虚拟内存</font>**<font style="color:rgb(67, 67, 107);">：用户可以自定义设置SWAP虚拟内存的大小，优化服务器的内存管理。</font>
+ **<font style="color:rgb(67, 67, 107);">一键关闭SWAP虚拟内存</font>**<font style="color:rgb(67, 67, 107);">：一键禁用SWAP虚拟内存，释放物理内存资源。</font>
+ **<font style="color:rgb(67, 67, 107);">一键开启/关闭KSM内存回收</font>**<font style="color:rgb(67, 67, 107);">：提供开启或关闭KSM（内核空间管理器）的功能，提高系统内存使用效率。</font>
+ **<font style="color:rgb(67, 67, 107);">一键关闭SELinux</font>**<font style="color:rgb(67, 67, 107);">：一键禁用SELinux安全模块，提高系统的运行速度和灵活性。</font>

#### **<font style="color:rgba(0, 0, 0, 0.85);">6. 快捷功能</font>**
+ **<font style="color:rgb(67, 67, 107);">BBR一键脚本</font>**<font style="color:rgb(67, 67, 107);">：提供BBR优化脚本，通过调整TCP参数提升网络速度。</font>
+ **<font style="color:rgb(67, 67, 107);">回程路由可视化脚本</font>**<font style="color:rgb(67, 67, 107);">：使用可视化脚本展示服务器的回程路由信息，帮助用户了解网络路径。</font>
+ **<font style="color:rgb(67, 67, 107);">IP质量检测脚本</font>**<font style="color:rgb(67, 67, 107);">：检测并显示服务器的IP地址质量情况，确保网络连接的稳定性。</font>
+ **<font style="color:rgb(67, 67, 107);">流媒体解锁检测脚本</font>**<font style="color:rgb(67, 67, 107);">：检测并显示流媒体解锁状态，帮助用户管理流媒体服务。</font>
+ **<font style="color:rgb(67, 67, 107);">融合怪VPS测试一键脚本</font>**<font style="color:rgb(67, 67, 107);">：提供一键测试VPS性能和稳定性的功能，确保VPS服务的可靠性。</font>
+ **<font style="color:rgb(67, 67, 107);">Linux系统一键换源(默认版)</font>**<font style="color:rgb(67, 67, 107);">：一键更换Linux系统的默认软件源，提高系统更新速度和稳定性。</font>
+ **<font style="color:rgb(67, 67, 107);">Linux系统一键换源(教育网)</font>**<font style="color:rgb(67, 67, 107);">：一键更换为EDU的软件源，提高系统更新速度和稳定性。</font>
+ **<font style="color:rgb(67, 67, 107);">通用一键安装宝塔最新正式版</font>**<font style="color:rgb(67, 67, 107);">：一键安装最新版本的宝塔面板，简化宝塔产品的安装过程。</font>

### 更新日志
v1.0.4.1 2025年1月17日更新，优化TCP网络优化脚本
v1.0.4 2024年12月7日更新，新增TCP网络优化脚本
v1.0.3 2024年9月4日更新，新增1panel安装功能  
v1.0.2 2024年9月3日更新，融合007开源工具箱，并优化新增多个一键脚本  
v1.0.1 2021年优化版本，主要优化界面，并更新去除失效脚本  
v1.0.0 2020年首创版本，功能有：挂载硬盘、安装宝塔面板、离线宝塔面板、BBR一键安装、奈非检测等  

### 使用方法
大陆服务器
```bash
curl -L https://gitee.com/krhzj/LinuxTool/raw/main/Linux.sh -o Linux.sh && chmod +x Linux.sh && bash Linux.sh
```
境外服务器
```bash
curl -L https://raw.githubusercontent.com/vpsad/LinuxTool/main/Linux.sh -o Linux.sh && chmod +x Linux.sh && bash Linux.sh
```
