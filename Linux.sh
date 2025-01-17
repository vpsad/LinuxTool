#!/bin/bash

# 定义颜色代码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'


# 获取服务器IP地址
server_ip=$(hostname -I)

uptime=$(uptime -p)
uptime_cn=$(echo $uptime | sed 's/up/已运行/; s/hour/时/; s/minutes/分/; s/days/天/; s/months/月/')



show_menu() {
    clear
    local greeting
    greeting=$(get_greeting)
    echo -e "
===================================================
✪  工具名称：${RED}亚洲云Linux工具${RESET}        
✪  工具版本：${GREEN}V1.0.4.1${RESET}      
✪  服务器IP：$server_ip
✪  运行时间：$uptime_cn
--------------------[综合菜单]---------------------

   1. 系统操作菜单(修改密码、SSH端口、更新系统等)
   2. 网络操作菜单(开/关ping、检测UDP、绑定IP等)
   3. 文件操作菜单(挂载硬盘、远程下载文件等)
   4. 宝塔面板菜单(挂载硬盘、一键安装宝塔产品)
   5. 宿主机菜单(云服务器不要尝试开启虚拟化)           
   
--------------------[快捷功能]---------------------

   6. BBR一键脚本       
   7. 回程路由可视化脚本          
   8. IP质量检测脚本       
   9. 流媒体解锁检测脚本       
   10. 融合怪VPS测试一键脚本         
   11. Linux系统一键换源(默认版)
   12. Linux系统一键换源(教育网)      
   13. 通用一键安装宝塔最新正式版
   14. 一键安装1panel面板(国内服务器请先换源)
   15. 一键TCP窗口大带宽调优
   q. 退出脚本
   
--------------------[服务器推荐]---------------------

${CYAN}亚洲云 资质齐全老商家 全球20+机房高防大带宽服务器
拥有IDC/ISP/ICP等资质，300M大带宽服务器免费领取
官网：https://www.asiayun.com ${RESET}       

===================================================
$greeting
	"
}



# 系统操作菜单
system_menu() {
    clear
    echo "=== 系统操作菜单 ==="
    echo "1. 一键重启服务器"
    echo "2. 一键修改密码"
    echo "3. 一键同步上海时间"
    echo "4. 一键修改SSH端口"
    echo "5. 一键修改DNS"
    echo "6. 一键开启/关闭SSH登录"
    echo "7. 一键更新CentOS最新版系统"
    echo "8. 一键更新Ubuntu最新版系统"
    echo "9. 一键更新Debian最新版系统"
    echo "10. 一键更换CentOS yum源"
    echo "11. 一键更换Ubuntu apt源"
    echo "12. 一键更换Debian apt源"
    echo "13. 一键创建子用户或管理员"
    echo "14. 一键查看当前与服务器连接的IP"
    echo "15. 一键修改服务器主机名"
    echo "16. 一键更换CentOS8 stream仓库源"
    echo "17. 一键查看SSH登录成功的IP地址"
    echo "q. 返回上级菜单"
    echo "===================="
}



# 网络操作菜单
network_menu() {
    clear
    echo "=== 网络操作菜单 ==="
    echo "1. 一键重启网卡"
    echo "2. 一键开启/关闭Ping"
    echo "3. 一键绑定附加IP"
    echo "4. 一键查看服务器地理位置"
    echo "5. 一键查看服务器IP原生地址"
    echo "6. 一键查看服务器配置信息"
    echo "7. 一键检测服务器是否屏蔽UDP"
    echo "8. 一键VPS的IP映射至独立服务器"
    echo "9. 一键关闭VPS的IP映射"
    echo "10. 一键开启四层端口转发"
    echo "11. 一键关闭四层端口转发"
    echo "12. 一键查看服务器在使用的端口"
    echo "13. 一键查看什么IP在跑带宽"
    echo "q. 返回上级菜单"
    echo "===================="
}



# 文件传输菜单
file_transfer_menu() {
    clear
    echo "=== 文件传输菜单 ==="
    echo "1. 一键上传文件到远程服务器"
    echo "2. 一键从远程服务器下载文件"
    echo "3. 一键查看所有硬盘分区信息(挂载硬盘前建议查看)"
    echo "4. 一键自定义挂载数据盘"
    echo "5. 一键自定义卸载数据盘"
    echo "6. 一键自定义格式化数据盘"
    echo "7. 一键修复硬盘分区超级坏块"
    echo "8. 一键设置开机启动脚本"
    echo "9. 一键查询关键词文件内容(可用于审查违规)"
    echo "10. 一键查看SSH历史输入命令"
    echo "11. 一键清空SSH历史输入命令"
    echo "q. 返回上级菜单"
    echo "===================="
}



# 根据当前时间返回问候语
get_greeting() {
    local hour=$(date +"%H")
    case $hour in
        1|2|3|4|5|6|7|8|9|10|11)
            echo "上午好！欢迎使用亚洲云linux工具"
            ;;
        12|13|14|15|16|17|18)
            echo "下午好！欢迎使用亚洲云linux工具"
            ;;
         *)
            echo "晚上好！欢迎使用亚洲云linux工具"
            ;;
    esac
}



# 函数：启动 iftop
start_iftop() {
    echo "启动 iftop，按 CTRL+C 退出..."
    sudo iftop
}



# 函数：检查并安装 iftop
check_and_install_iftop() {
    if ! command -v iftop &> /dev/null; then
        echo -e "${GREEN}正在检查 iftop 是否已安装...${NC}"
        # 检测Linux发行版并安装 iftop
        if [ -f /etc/debian_version ]; then
            echo -e "${GREEN}检测到 Debian/Ubuntu 系统，正在安装 iftop...${NC}"
              sudo apt-get update && sudo apt-get install -y iftop
        elif [ -f /etc/centos-release ]; then
            echo -e "${GREEN}检测到 CentOS 系统，正在安装 iftop...${NC}"
            sudo yum install -y epel-release  # 确保有 EPEL 源
            sudo yum install -y iftop
        else
            echo -e "${RED}不支持的系统，无法安装 iftop。${NC}"
        fi
    fi
}



# 查看历史记录
view_history() {
    echo "查看历史记录..."
    if [ -f ~/.bash_history ]; then
        cat ~/.bash_history
    else
        echo "没有找到历史记录文件。"
    fi
    exit 0
}

#BBR一键脚本
bbryj(){
    # 使用无限循环来不断地询问用户是否需要继续安装
    while true; do
        # 提示用户输入Y(Y/N)，并将输入值存储在变量answer中
        read -p "Debian类系统无需安装，默认自带，如需继续安装请输入Y(Y/N) " answer
        # 使用case语句根据用户的输入执行相应的操作
        case $answer in
            # 如果用户输入Y或y，则下载并执行tcp.sh脚本
            [Yy]* ) wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh;;
            # 如果用户输入N或n，则跳出循环
            [Nn]* ) break;;
            # 如果用户输入其他字符，则默认执行下载并执行tcp.sh脚本的操作
            * ) wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh;;
        esac
    done
}

#流媒体检测脚本
lmtjc(){
    bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
}

# 清空历史记录
clear_history() {
    # 使用sed命令清空.bash_history文件
    sed -i '' 1d ~/.bash_history
    # 确保文件是空的
    echo "" > ~/.bash_history
    echo "sed：已经读取 1d："
    echo "历史记录已清空。"
}



# 定义函数：安装 dig 命令
install_dig() {
    echo "正在检查 dig 命令..."
    if ! command -v dig &> /dev/null; then
        echo "dig 命令未找到，正在安装..."
        case $(uname -s) in
            Linux)
                if [ -x "$(command -v apt-get)" ]; then
                    sudo apt-get update && sudo apt-get install -y dnsutils
                elif [ -x "$(command -v yum)" ]; then
                    sudo yum install bind-utils
                elif [ -x "$(command -v dnf)" ]; then
                    sudo dnf install bind-utils
                else
                    echo "不支持的Linux发行版"
                    exit 1
                fi
                ;;
            *)
                echo "不支持的操作系统"
                exit 1
                ;;
        esac
    else
        echo "dig 命令已安装."
    fi
}



# 定义一个函数来检测8.8.8.8的UDP DNS解析
check_dns_udp() {
    echo "正在测试8.8.8.8的UDP DNS解析..."
    if dig @8.8.8.8 -p 53 google.com > /dev/null; then
        echo "8.8.8.8的UDP DNS解析正常 UDP正常。"
    else
        echo "8.8.8.8的UDP DNS解析失败 UDP屏蔽。"
    fi
}



# 更新YUM仓库源
update_repo() {
    echo "正在更新YUM仓库源到阿里云镜像..."
    # 使用sed命令修改仓库配置文件
    sed -e "s|^mirrorlist=|#mirrorlist=|g" -e "s|^#baseurl=http://mirror.centos.org/\$contentdir/|baseurl=https://mirrors.aliyun.com/centos-vault/|g" -i.bak /etc/yum.repos.d/CentOS-Stream-*.repo

    # 刷新YUM缓存
    yum makecache
    echo "YUM仓库源更新完成。"
}


# 检测操作系统并设置日志文件路径
log_file_path=""
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    case "$ID" in
        centos)
            log_file_path="/var/log/secure"
            ;;
        ubuntu|debian)
            log_file_path="/var/log/auth.log"
            ;;
        *)
            echo "不支持的操作系统"
            exit 1
            ;;
    esac
else
    echo "无法检测到操作系统"
    exit 1
fi



# 查看登录成功的IP
show_login_ips() {
    # 从正确的日志文件中提取登录成功的IP地址
    grep 'sshd.*Accepted' "$log_file_path" | awk '{print $11}' | sort | uniq
}

# 修复硬盘分区坏块
repair_badblocks() {
    read -p "请输入要修复坏块的硬盘分区（例如：/dev/home）：" partition
    echo "开始修复硬盘分区坏块..."
    xfs_repair $partition -L
    echo "修复完成！"
}



# 审查文件内容关键词（自定义目录搜索）
review_files_custom() {
    echo "请输入要搜索的目录路径："
    read directory_path
    if [ -d "$directory_path" ]; then
        echo "请输入关键词："
        read keyword
        echo "开始搜索关键词 '$keyword' 在目录 '$directory_path' 中..."
        grep -rl "$keyword" "$directory_path"
    else
        echo "输入的路径不是有效的目录，请重新输入。"
    fi
}



# 修改主机名的函数
change_hostname() {
    local new_hostname
    read -p "请输入新的主机名：" new_hostname
    if [ -n "$new_hostname" ]; then
        sudo hostnamectl set-hostname "$new_hostname"
        if [ $? -eq 0 ]; then
            echo "主机名已成功修改为：$new_hostname"
        else
            echo "修改主机名失败，请检查输入是否有误。"
        fi
    else
        echo "输入的主机名不能为空。"
    fi
}



# 定义函数：关闭 SELinux
disable_selinux() {
    # 检查当前 SELinux 的状态
    sestatus=$(sestatus | awk '{print $3}')

    if [[ $sestatus == "enabled" ]]; then
        echo "当前 SELinux 状态为已启用。"
        echo "正在关闭 SELinux..."

        # 临时禁用 SELinux
        setenforce 0

        # 检查 SELinux 是否成功禁用
        if [[ $(sestatus | awk '{print $3}') == "disabled" ]]; then
            echo "SELinux 已成功禁用。"
        else
            echo "无法禁用 SELinux。"
        fi
    else
        echo "当前 SELinux 状态为已禁用。"
    fi
}


# 一键四层转发函数
forwarding() {
    echo "请输入转发端口："
    read source_port
    echo "请输入目标端口："
    read destination_port
    echo "正在进行四层转发，转发端口为 $source_port，目标端口为 $destination_port ..."
    # 使用iptables进行转发
    iptables -t nat -A PREROUTING -p tcp --dport $source_port -j DNAT --to-destination 目标IP:$destination_port
    echo "转发已完成！"
}



# 定义函数：用户自定义脚本
custom_script() {
    read -p "请输入自定义脚本的内容: " script_content

    # 获取当前用户的home目录
    home_dir=$(eval echo ~$USER)

    # 将用户输入的脚本内容保存到文件中
    echo "$script_content" > "$home_dir/my.sh"
    chmod +x "$home_dir/my.sh"

    echo "自定义脚本已保存为 my.sh。"
}

# 一键关闭四层转发函数
disable_forwarding() {
    echo "正在关闭四层转发..."
    # 使用iptables删除转发规则
    iptables -t nat -F
    echo "四层转发已关闭！"
}

# 检查是否已经取消注释net.ipv4.ip_forward=1
check_ip_forwarding() {
    if grep -q "^net.ipv4.ip_forward=1" /etc/sysctl.conf; then
        echo "net.ipv4.ip_forward=1 已经在 /etc/sysctl.conf 中取消注释"
    else
        # 如果未取消注释，则添加配置并重新加载sysctl配置
        echo "net.ipv4.ip_forward=1 未在 /etc/sysctl.conf 中取消注释"
        echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
        sudo sysctl -p
        echo "已添加 net.ipv4.ip_forward=1 并重新加载sysctl配置"
    fi
}

# 关闭端口转发函数
close_port_forwarding() {
    sudo iptables -t nat -F
    echo "IP映射已成功关闭"
}

# 设置端口转发函数
setup_port_forwarding() {
    read -p "请输入VPS的IP地址: " vps_ip
    read -p "请输入VPS上要转发的端口: " vps_port
    read -p "请输入独立服务器的IP地址: " server_ip
    read -p "请输入独立服务器上要映射到的端口: " server_port

    # 执行端口转发设置
    iptables -t nat -A PREROUTING -p tcp --dport $vps_port -j DNAT --to-destination $server_ip:$server_port
    iptables -t nat -A POSTROUTING -p tcp -d $server_ip --dport $server_port -j SNAT --to-source $vps_ip

    echo "端口转发设置成功: $vps_ip:$vps_port -> $server_ip:$server_port"
}



# 挂载数据盘
mount_data_disk() {
    # 确定数据盘设备名
    read -p "请输入数据盘设备名[默认：/dev/vdb1]: " disk_device
    disk_device=${disk_device:-"/dev/vdb1"}

    # 确定挂载点目录
    read -p "请输入挂载点目录[默认：/data]: " mount_point
    mount_point=${mount_point:-"/data"}

    # 检查挂载点目录是否存在
    if [ ! -d "$mount_point" ]; then
        # 挂载点目录不存在，创建目录
        sudo mkdir "$mount_point"
    fi

    # 检查数据盘是否已经被挂载
    if grep -qs "$disk_device" /proc/mounts; then
        echo "数据盘 $disk_device 已经被挂载"
        return
    fi

    # 检查数据盘是否存在
    if [ ! -e "$disk_device" ]; then
        echo "数据盘 $disk_device 不存在"
        return
    fi

    # 挂载数据盘
    sudo mount "$disk_device" "$mount_point"
    echo "数据盘 $disk_device 成功挂载到 $mount_point"
    
    # 将数据盘添加到 /etc/fstab 实现开机自动挂载
    echo "$mount_path $mount_point ext4 defaults 0 2" | sudo tee -a /etc/fstab

    echo "数据盘已成功挂载到 $mount_point，并已设置为开机自动挂载。"
}

# 尝试安装netstat
install_netstat() {
    if ! command -v netstat &> /dev/null; then
        echo "netstat 未安装，正在尝试安装..."
        if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
            apt-get update && apt-get install -y net-tools
        elif [[ "$ID" == "centos" || "$ID" == "rhel" ]]; then
            yum install -y net-tools
        else
            echo "不支持的操作系统"
            exit 1
        fi
    fi
}

# 查看连接到本机的远程IP地址数量
show_connected_ips_count() {
    install_netstat
     netstat -tn | awk '{print $5}' | grep -v 'Address' | cut -d: -f1 | sort | uniq -c | sort -nr
    # 可以根据需要修改端口号或状态
}



function toggle_ssh() {
    if [[ -f /etc/redhat-release ]]; then
        # CentOS
        if sudo systemctl is-active --quiet sshd; then
            sudo systemctl stop sshd
            sudo systemctl disable sshd
            echo "SSH登录已禁用"
        else
            sudo systemctl enable sshd
            sudo systemctl start sshd
            echo "SSH登录已启用"
        fi
    elif [[ -f /etc/lsb-release ]]; then
        # Ubuntu
        if sudo service ssh status | grep "running" >/dev/null; then
            sudo service ssh stop
            sudo systemctl disable ssh
            echo "SSH登录已禁用"
        else
            sudo systemctl enable ssh
            sudo service ssh start
            echo "SSH登录已启用"
        fi
    elif [[ -f /etc/debian_version ]]; then
        # Debian
        if sudo service ssh status | grep "running" >/dev/null; then
            sudo service ssh stop
            sudo systemctl disable ssh
            echo "SSH登录已禁用"
        else
            sudo systemctl enable ssh
            sudo service ssh start
            echo "SSH登录已启用"
        fi
    else
        echo "不支持的操作系统"
    fi
}

function disable_swap() {
    if [[ -f /etc/fstab ]]; then
        sudo sed -i '/swap/d' /etc/fstab
        sudo swapoff -a
        echo "SWAP已关闭"
    else
        echo "无法找到fstab文件"
    fi
}



# 卸载数据盘
umount_data_disk() {
    # 确定挂载点目录
    read -p "请输入挂载点目录[默认：/data]: " mount_point
    mount_point=${mount_point:-"/data"}

    # 检查挂载点目录是否存在
    if [ ! -d "$mount_point" ]; then
        echo "挂载点目录 $mount_point 不存在"
        return
    fi

    # 检查挂载点目录是否被挂载
    if ! grep -qs "$mount_point" /proc/mounts; then
        echo "挂载点目录 $mount_point 未被挂载"
        return
    fi

    # 卸载数据盘
    sudo umount "$mount_point"
    echo "数据盘 $mount_point 成功卸载"
}

# 函数：创建用户并设置密码
create_user() {
    read -p "请输入要创建的用户名: " username

    # 检查用户是否已存在
    if id "$username" &>/dev/null; then
        echo "用户 $username 已存在"
    else
        # 创建用户
        sudo useradd -m $username
        if [ $? -eq 0 ]; then
            echo "用户 $username 创建成功"
            sudo passwd $username

            # 询问是否将用户添加到sudo组
            read -p "是否要将用户 $username 设置为管理员(y/n): " add_sudo
            if [ "$add_sudo" == "y" ]; then
                sudo usermod -aG wheel $username
                echo "用户 $username 已设置为管理员"
            fi
        else
            echo "创建用户 $username 失败"
        fi
    fi
}



# 定义增加IP地址函数
add_ip() {
    read -p "请输入要添加的IP地址：" ip
    read -p "请输入网关：" gateway
    read -p "请输入掩码：" netmask

    # 检查IP地址是否已经存在
    if ip addr show | grep -q $ip; then
        echo "IP地址已经存在，删除已存在的IP地址。"
        ip addr del $ip/$netmask dev eth0
    fi

    # 添加IP地址
    ip addr add $ip/$netmask dev eth0
    ip route add default via $gateway
    echo "IP地址添加成功。"

    # 将添加IP地址的命令添加到 /etc/rc.local 文件中
    echo "ip addr add $ip/$netmask dev eth0" >> /etc/rc.local
    echo "ip route add default via $gateway" >> /etc/rc.local
    
    # 提示用户重启网络接口或服务器
    echo "如果IP地址没有立即生效，请尝试重启网卡或重启服务器。"
}

# 定义函数用于格式化用户指定的数据硬盘
format_disk() {
    read -p "请输入要格式化的数据硬盘设备名称（回车默认/dev/vdb1）：" disk_name
    disk_name=${disk_name:-/dev/vdb1}

    # 检查硬盘是否存在
    if [ ! -b "$disk_name" ]; then
        echo "硬盘 $disk_name 不存在或不可用。"
        exit 1
    fi

    read -p "请输入文件系统类型（回车默认ext4）：" fs_type
    fs_type=${fs_type:-ext4}

    # 确认操作
    read -p "您确定要格式化硬盘 $disk_name 为文件系统 $fs_type 吗？(y/n)：" confirm
    if [ "$confirm" != "y" ]; then
        echo "取消操作。"
        exit 0
    fi

    # 格式化硬盘
    sudo mkfs.$fs_type $disk_name
    if [ $? -eq 0 ]; then
        echo "硬盘 $disk_name 成功格式化为文件系统 $fs_type。"
    else
        echo "无法格式化硬盘 $disk_name。"
    fi
}



# 函数：自定义设置并配置Swap空间
function set_swap() {
    read -p "请输入SWAP大小（单位：GB）: " swap_size

    if [[ ! $swap_size =~ ^[0-9]+$ ]]; then
        echo "无效的输入，请输入一个有效的数字"
        return
    fi

    if [[ -f /etc/fstab ]]; then
        sudo sed -i '/swap/d' /etc/fstab
        sudo swapoff -a

        if [[ -f /swapfile ]]; then
            sudo rm /swapfile
        fi

        sudo fallocate -l ${swap_size}G /swapfile
        sudo chmod 600 /swapfile
        sudo mkswap /swapfile
        sudo swapon /swapfile

        echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
        echo "SWAP已设置为 ${swap_size}GB"
        echo "SWAP设置已添加到 /etc/fstab，将在系统启动时自动启用"
    else
        echo "无法找到fstab文件"
    fi
}


# 函数：启用嵌套虚拟化
function enable_nested_virtualization() {
    if [[ -f /sys/module/kvm_intel/parameters/nested ]]; then
        # Intel processor
        sudo modprobe -r kvm_intel
        sudo modprobe kvm_intel nested=1
        echo "已开启虚拟化"
    elif [[ -f /sys/module/kvm_amd/parameters/nested ]]; then
        # AMD processor
        sudo modprobe -r kvm_amd
        sudo modprobe kvm_amd nested=1
        echo "已开启虚拟化"
    else
        echo "不支持的处理器"
    fi
}




# 重启服务器
restart_server() {
    read -p "确认要重启服务器吗？(y/n): " confirm
    if [[ $confirm == [yY] ]]; then
        echo "正在重启服务器..."
        # 在这里添加重启服务器的命令
        sudo reboot
    else
        echo "取消重启服务器"
    fi
}

# 一键修改密码
change_password() {
    username=$(whoami)
    sudo passwd "$username"
    echo "密码已成功修改。"
}

# 函数：显示服务器地理位置
show_server_location() {
    curl ipinfo.io
}

# 函数：显示服务器地理位置（中文）
show_server_location2() {
    curl iplark.com
}




# 同步上海时间函数
sync_shanghai_time() {
    install_ntpdate
    echo "正在同步上海时间..."
    sudo timedatectl set-timezone Asia/Shanghai
    sudo ntpdate cn.pool.ntp.org
    echo "时间同步完成。"
}

# 一键修改 SSH 端口
change_ssh_port() {
    read -p "请输入新的 SSH 端口: " new_port
    sed -i "s/Port [0-9]*/Port $new_port/" /etc/ssh/sshd_config
    systemctl restart sshd
    echo "SSH 端口已修改为 $new_port"
}

# 函数：一键修改DNS1和DNS2
function set_dns() {
    read -p "请输入新的DNS服务器地址: " dns_server
    if [[ -f /etc/redhat-release ]]; then
        # CentOS
        echo "nameserver $dns_server" | sudo tee /etc/resolv.conf >/dev/null
        echo "DNS服务器已修改为 $dns_server"
    elif [[ -f /etc/lsb-release ]]; then
        # Ubuntu
        sudo sed -i "s/nameserver .*/nameserver $dns_server/" /etc/resolv.conf
        echo "DNS服务器已修改为 $dns_server"
    elif [[ -f /etc/debian_version ]]; then
        # Debian
        sudo sed -i "s/nameserver .*/nameserver $dns_server/" /etc/resolv.conf
        echo "DNS服务器已修改为 $dns_server"
    else
        echo "不支持的操作系统"
    fi
}




# 一键更新 CentOS 最新版系统
update_centos() {
    read -p "确认要更新 CentOS 最新版系统吗？(y/n): " confirm
    if [[ $confirm == [yY] ]]; then
        echo "正在更新 CentOS 最新版系统..."
        # 在这里添加更新 CentOS 的命令
        sudo yum update
        echo "CentOS 最新版系统更新完成"
        reboot
    else
        echo "取消更新 CentOS 最新版系统"
    fi
}

# 一键更新 Ubuntu 最新版系统
update_ubuntu() {
    read -p "确认要更新 Ubuntu 最新版系统吗？(y/n): " confirm
    if [[ $confirm == [yY] ]]; then
        echo "正在更新 Ubuntu 最新版系统..."
        # 在这里添加更新 Ubuntu 的命令
        sudo apt update
        sudo apt upgrade -y
        echo "Ubuntu 最新版系统更新完成"
        reboot
    else
        echo "取消更新 Ubuntu 最新版系统"
    fi
}



# 函数：切换KSM状态
toggle_ksm() {
    ksm_status=$(cat /sys/kernel/mm/ksm/run)
    if [ $ksm_status -eq 0 ]; then
        /bin/systemctl start ksm
        /bin/systemctl start ksmtuned
        cat /sys/kernel/mm/ksm/run
        echo "KSM内存回收已开启。"
    else
        /bin/systemctl stop ksmtuned
        /bin/systemctl stop ksm
        echo 0 > /sys/kernel/mm/ksm/run
        echo "KSM内存回收已关闭。"
    fi
}

# 一键更新 Debian 最新版系统
update_debian() {
    read -p "确认要更新 Debian 最新版系统吗？(y/n): " confirm
    if [[ $confirm == [yY] ]]; then
        echo "正在更新 Debian 最新版系统..."
        # 在这里添加更新 Debian 的命令
        sudo apt update
        sudo apt upgrade -y
        echo "Debian 最新版系统更新完成"
        reboot
    else
        echo "取消更新 Debian 最新版系统"
    fi
}



# 更换CentOS 7源为阿里云源的函数
change_centos_to_aliyun() {
    if [ -f /etc/yum.repos.d/CentOS-Base.repo ]; then
        echo "正在更换CentOS的源为阿里云源..."
        sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
        cat << 'EOF' | sudo tee /etc/yum.repos.d/CentOS-Base.repo
[base]
name=CentOS-$releasever - Base - 阿里云镜像
baseurl=http://mirrors.aliyun.com/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

# 可选的，添加阿里云的额外源
[extras]
name=CentOS-$releasever - Extras - 阿里云镜像
baseurl=http://mirrors.aliyun.com/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

# 可选的，添加阿里云的更新源
[updates]
name=CentOS-$releasever - Updates - 阿里云镜像
baseurl=http://mirrors.aliyun.com/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7
EOF
        sudo yum clean all
        sudo yum makecache
        echo "CentOS源更换完成。"
    else
        echo "CentOS源配置文件不存在。"
    fi
}

# 更换Ubuntu 20.04源为阿里云源的函数
change_ubuntu_to_aliyun() {
    if [ -f /etc/apt/sources.list ]; then
        echo "正在更换Ubuntu的源为阿里云源..."
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
        sudo sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
        sudo sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
        echo "Ubuntu源更换完成。"
    else
        echo "Ubuntu源配置文件不存在。"
    fi
}



# 更换Debian源为阿里云源的函数
change_debian_to_aliyun() {
    if [ -f /etc/apt/sources.list ]; then
        echo "正在更换Debian的源为阿里云源..."
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
        sudo sed -i 's|http://[^ ]*|http://mirrors.aliyun.com|' /etc/apt/sources.list
        echo "Debian源更换完成。"
    else
        echo "Debian源配置文件不存在。"
    fi
}

# 检查并安装ntpdate
install_ntpdate() {
    if ! command -v ntpdate &> /dev/null; then
        echo "正在安装ntpdate..."
        if [ -f /etc/redhat-release ]; then
            sudo yum install -y ntpdate
        elif [ -f /etc/debian_version ]; then
            sudo apt-get install -y ntpdate
        else
            echo "不支持的操作系统类型。"
            exit 1
        fi
        echo "ntpdate安装完成。"
    fi
}



# 函数：显示服务器配置信息
show_server_config() {
    echo "=== 服务器配置信息 ==="
    echo "CPU核心数:"
    lscpu | grep -w "CPU(s):" | grep -v "\-"
    lscpu | grep -w "Model name:"
    echo "CPU频率:"
    lscpu | grep -w "CPU MHz"
    echo "虚拟化类型:"
    lscpu | grep -w "Hypervisor vendor:"
   echo "系统版本:"
    if [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        echo "Ubuntu $DISTRIB_RELEASE"
    elif [ -f /etc/debian_version ]; then
        DEBIAN_VERSION=$(cat /etc/debian_version)
        echo "Debian $DEBIAN_VERSION"
    elif [ -f /etc/centos-release ]; then
        CENTOS_VERSION=$(cat /etc/centos-release)
        echo "CentOS $CENTOS_VERSION"
    else
        echo "无法识别的系统类型"
    fi
    echo "内存信息:"
    free -h
    echo "硬盘信息:"
    df -h
}



# 一键重启网卡
function restart_network_card() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        os=$ID
    elif [ -f /etc/centos-release ]; then
        os="centos"
    else
        echo "Unsupported operating system."
        return
    fi

    if [ "$os" == "debian" ]; then
        sudo systemctl restart networking
    elif [ "$os" == "ubuntu" ]; then
        sudo systemctl restart networkd-dispatcher
    elif [ "$os" == "centos" ]; then
        sudo service network restart
    else
        echo "Unsupported operating system."
        return
    fi

    echo "网卡已重启"
}

# 上传文件到远程服务器
upload_file() {
    # 输入远程服务器的 IP 地址或域名
    read -p "请输入远程服务器的 IP 地址或域名: " remote_server

    # 输入远程服务器的用户名
    read -p "请输入远程服务器的用户名: " remote_user

    # 输入远程服务器的目标路径
    read -p "请输入远程服务器的目标路径: " remote_path

    # 输入本地文件的路径
    read -p "请输入要传输的本地文件的路径: " local_file

    # 使用 scp 命令传输文件
    echo "正在传输文件到远程服务器..."
    scp "$local_file" "$remote_user@$remote_server:$remote_path"
    echo "文件传输完成"
}



# 从远程服务器下载文件
download_file() {
    # 输入远程服务器的 IP 地址或域名
    read -p "请输入远程服务器的 IP 地址或域名: " remote_server

    # 输入远程服务器的用户名
    read -p "请输入远程服务器的用户名: " remote_user

    # 输入远程服务器的文件路径
    read -p "请输入远程服务器的文件路径: " remote_file

    # 输入本地保存文件的路径
    read -p "请输入本地保存文件的路径: " local_path

    # 使用 scp 命令从远程服务器下载文件
    echo "正在从远程服务器下载文件..."
    scp "$remote_user@$remote_server:$remote_file" "$local_path"
    echo "文件下载完成"
}



# 函数：一键开启/关闭Ping
toggle_ping() {
    if [ "$(sysctl -n net.ipv4.icmp_echo_ignore_all)" = "1" ]; then
        echo "正在开启Ping..."
        sudo sysctl -w net.ipv4.icmp_echo_ignore_all=0
        echo "已开启Ping。"
    else
        echo "正在关闭Ping..."
        sudo sysctl -w net.ipv4.icmp_echo_ignore_all=1
        echo "已关闭Ping。"
    fi
}

# 询问是否重启服务器
ask_reboot() {
    read -p "更新完成，是否重启服务器？(y/n): " confirm
    if [[ $confirm == [yY] ]]; then
        restart_server
    else
        echo "更新完成，服务器未重启"
    fi
}



# 主循环
while true
do
    show_menu
    read -p "请输入选项: " choice
    case $choice in
        1)
            while true
            do
                system_menu
                read -p "请输入选项: " system_choice
                case $system_choice in
                    1)
                        restart_server
                        ;;
                    2)
                        change_password
                        ;;
                    3)
                        sync_shanghai_time
                        ;;
                    4)
                        change_ssh_port
                        ;;
                    5)
                        set_dns
                        ;;
                    6)
                        toggle_ssh
                        ;;
                    7)
                        update_centos
                        ;;
                    8)
                        update_ubuntu
                        ;;
                    9)
                        update_debian
                        ;;
                    10) change_centos_to_aliyun;;
                    11) change_ubuntu_to_aliyun;;
                    12) change_debian_to_aliyun;;
                    13)
                        create_user
                        ;;     
                    14)
                        show_connected_ips_count
                        ;;     
                    15)
                        change_hostname
                        ;;   
                    16) update_repo;;
                    
                    17) show_login_ips;;
                    q)
                        break
                        ;;
                    *)
                        echo "无效的选项，请重新输入"
                        ;;
                esac
                read -p "按回车键继续..."
            done
            ;;
            
        2)
            while true
            do
                network_menu
                read -p "请输入选项: " network_choice
                case $network_choice in
                    1)
                        restart_network_card
                        ;;
                    2)
                        toggle_ping
                        ;;
                    3)
                        add_ip
                        ;;
                    4)
                        show_server_location
                        ;;
                    5)
                        show_server_location2
                        ;;    
                    6)
                        show_server_config
                        ;; 
                        
                    7)  install_dig
                        check_dns_udp
                        ;;       
                    8)
                        check_ip_forwarding
                        setup_port_forwarding
                        ;;
                    9)  
                        close_port_forwarding
                        ;;
                    10)
                        forwarding
                        ;;
                    11)
                        disable_forwarding
                        ;;
                    12)
                        netstat -tuln
                        ;; 
                    13)
                        check_and_install_iftop
                        start_iftop
                        ;;   
                        
                    q)
                        break
                        ;;
                    *)
                        echo "无效的选项，请重新输入"
                        ;;
                esac
                read -p "按回车键继续..."
            done
            ;;
            
        
        3)
            while true
            do
                file_transfer_menu
                read -p "请输入选项: " file_transfer_choice
                case $file_transfer_choice in
                    1)
                        upload_file
                        ;;
                    2)
                        download_file
                        ;;
                    3)
                        fdisk -l
                        ;;    
                    4)
                        mount_data_disk
                        ;;
                    5)
                        umount_data_disk
                        ;;   
                    6)
                        format_disk
                        ;; 
                    7)
                        repair_badblocks
                        ;;     
                    8)
                        custom_script
                        ;;
                    9) review_files_custom;;
                    10) view_history ;;
                    11) clear_history ;;
                    q)    
                        break
                        ;;
                    *)
                        echo "无效的选项，请重新输入"
                        ;;
                esac
                read -p "按回车键继续..."
            done
            ;;
            
       4)
            while true
            do
                clear
                echo "=== 宝塔面板菜单 ==="
                echo "1. 宝塔官方一键挂载硬盘脚本"
                echo "2. 安装堡塔主机安全系统"
                echo "3. 安装Centos/OpenCloud/Alibaba稳定版"
                echo "4. 安装Ubuntu/Deepin宝塔稳定版"
                echo "5. 安装Debian宝塔稳定版"
                echo "6. 安装宝塔面板最新正式版"
                echo "7. 一键安装宝塔WAF最新版"
                echo "q. 返回上级菜单"
                echo "===================="
                read -p "请输入选项: " other_choice
                case $other_choice in
                
               1)
                    while true
                do
                    clear
                    echo "请选择确认并选择您的操作系统"
                    echo "1. CentOS系统"
                    echo "2. Ubuntu系统"
                    echo "3. Debian系统"
                    echo "q. 返回上级菜单"
                    read -p "请输入选项: " other_choice
                    case $other_choice in
                    
                    1)
                    yum install wget -y && wget -O auto_disk.sh http://download.bt.cn/tools/auto_disk.sh && bash auto_disk.sh;;
                    2)
                    wget -O auto_disk.sh http://download.bt.cn/tools/auto_disk.sh && sudo bash auto_disk.sh;;
                    3)
                    wget -O auto_disk.sh http://download.bt.cn/tools/auto_disk.sh && sudo bash auto_disk.sh;;
                    q)
                    break
                    ;;
                    esac
                    done
                    ;;
                
               2) 
                   URL=https://download.bt.cn/bthids/scripts/install_hids.sh && if [ -f /usr/bin/curl ];then curl -sSO "$URL" ;else wget -O install_hids.sh "$URL";fi;bash install_hids.sh;;  
               3) 
                   url=https://download.bt.cn/install/install_lts.sh;if [ -f /usr/bin/curl ];then curl -sSO $url;else wget -O install_lts.sh $url;fi;bash install_lts.sh fe0808632;; 
               4) 
                   wget -O install.sh https://download.bt.cn/install/install_lts.sh && sudo bash install.sh fe0808632;;    
               5) 
                   wget -O install.sh https://download.bt.cn/install/install_lts.sh && bash install.sh fe0808632;; 
               6) 
                   if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh fe0808632;;    
               7) 
                   URL=https://download.bt.cn/cloudwaf/scripts/install_cloudwaf.sh && if [ -f /usr/bin/curl ];then curl -sSO "$URL" ;else wget -O install_cloudwaf.sh "$URL";fi;bash install_cloudwaf.sh;;    
               q)   
                   break
                   ;;
                esac
                read -p "按回车键继续..."
            done
            ;;
            
        5)
            while true
            do
                clear
                echo "=== 宿主机菜单 ==="
                echo "1. 一键开启云服务器虚拟化"
                echo "2. 一键自定义设置SWAP虚拟内存"
                echo "3. 一键关闭SWAP虚拟内存"
                echo "4. 一键开启/关闭KSM内存回收"
                echo "5. 一键关闭SELinux"
                echo "q. 返回上级菜单"
                echo "===================="
                read -p "请输入选项: " other_choice
                case $other_choice in
                
               1) 
                   enable_nested_virtualization;; 
                 
               2) 
                   set_swap;;  
                   
               3)    
                   disable_swap;;  
                   
               4)    
                   toggle_ksm;;
                   
               5)
                   disable_selinux;;
                        
               q)   
                   break
                   ;;
                *)
                   echo "无效的选项，请重新输入"
                    ;;
                esac
                read -p "按回车键继续..."
            done
            ;;
            
        6)
            bbryj
            ;;
        7)
            curl https://raw.githubusercontent.com/oneclickvirt/backtrace/main/backtrace_install.sh -sSf | bash && backtrace
            ;;
        8)
            bash <(curl -Ls IP.Check.Place)
            ;;
        9)
            lmtjc
            ;;
        10)
            bash <(wget -qO- bash.spiritlhl.net/ecs)
            ;;
        11)
            bash <(curl -sSL https://linuxmirrors.cn/main.sh)
            ;;
        12)
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --edu
            ;;
        13)
            if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh fe0808632
            ;;
        14)
            while true
            do
                clear
                echo "提醒：国内服务器请先换源！否则无法安装docker！"
                echo "1. 国内服务器安装1panel"
                echo "2. 海外服务器安装1panel"
                echo "q. 返回上一页"
                read -p "请输入选项: " other_choice
                case $other_choice in
                
               1) 
                   bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
                   curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
                   ;;
                 
               2) 
                   curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
                   ;;
                        
               q)   
                   break
                   ;;
                *)
                   echo "无效的选项，请重新输入"
                    ;;
                esac
                read -p "按回车键继续..."
            done
            ;;
15)
    # 备份配置文件
    cp /etc/sysctl.conf /etc/sysctl.conf.bak
    echo "已备份 /etc/sysctl.conf 为 /etc/sysctl.conf.bak"

    # 删除旧配置
    echo "正在删除旧配置..."
    sed -i '/net.ipv4.tcp_no_metrics_save/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_ecn/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_frto/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_mtu_probing/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_rfc1337/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_sack/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_fack/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_window_scaling/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_adv_win_scale/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_moderate_rcvbuf/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_rmem/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_wmem/d' /etc/sysctl.conf
    sed -i '/net.core.rmem_max/d' /etc/sysctl.conf
    sed -i '/net.core.wmem_max/d' /etc/sysctl.conf
    sed -i '/net.ipv4.udp_rmem_min/d' /etc/sysctl.conf
    sed -i '/net.ipv4.udp_wmem_min/d' /etc/sysctl.conf
    sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
    echo "旧配置已删除。"

    # 添加新配置
    echo "正在添加新配置..."
    cat >> /etc/sysctl.conf << EOF
net.ipv4.tcp_no_metrics_save=1
net.ipv4.tcp_ecn=0
net.ipv4.tcp_frto=0
net.ipv4.tcp_mtu_probing=0
net.ipv4.tcp_rfc1337=0
net.ipv4.tcp_sack=1
net.ipv4.tcp_fack=1
net.ipv4.tcp_window_scaling=1
net.ipv4.tcp_adv_win_scale=1
net.ipv4.tcp_moderate_rcvbuf=1
net.core.rmem_max=33554432
net.core.wmem_max=33554432
net.ipv4.tcp_rmem=4096 87380 33554432
net.ipv4.tcp_wmem=4096 16384 33554432
net.ipv4.udp_rmem_min=8192
net.ipv4.udp_wmem_min=8192
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF
    echo "新配置已添加。"

    # 检查并安装 sysctl
if ! command -v sysctl &> /dev/null; then
    echo "sysctl 命令未安装，正在自动安装..."
    if command -v apt &> /dev/null; then
        apt update && apt install -y procps
    elif command -v yum &> /dev/null; then
        yum install -y procps-ng
    elif command -v dnf &> /dev/null; then
        dnf install -y procps-ng
    else
        echo "无法自动安装 sysctl，请手动安装 procps 或 procps-ng 包。"
        exit 1
    fi
    echo "sysctl 已安装。"
fi

# 确保 sysctl 在 PATH 中
export PATH=$PATH:/sbin:/usr/sbin

# 再次检查 sysctl 是否存在
if ! command -v sysctl &> /dev/null; then
    echo "错误：sysctl 命令仍未找到，请手动检查系统。"
    exit 1
fi

# 应用配置
echo "正在应用配置..."
if sysctl -p && sysctl --system; then
    echo "配置已成功应用。"
else
    echo "应用配置失败，请检查 /etc/sysctl.conf 文件。"
    exit 1
fi

    echo "TCP 优化完成！"
    ;;
        q)
            echo "再见！服务器推荐：www.asiayun.com"
            break
            ;;
        *)
            echo "无效的选项，请重新输入"
            ;;
    esac
    read -p "按回车键继续..."
done
