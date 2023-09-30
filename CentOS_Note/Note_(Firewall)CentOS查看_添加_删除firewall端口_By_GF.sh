#
# CentOS查看_添加_删除firewall端口_By_GF.
#
# Created by GF on 2023-03-17.
#

##################################################

# 查看已开放的端口：

    firewall-cmd --list-ports

##################################################

# 查询指定端口是否开放：

    firewall-cmd --query-port=3306/tcp

##################################################

# 开放指定端口(--permanent代表永久生效)：

    # 添加 6379 端口并设置为永久生效：

        firewall-cmd --zone=public --add-port=6379/tcp --permanent
    
    # 添加完端口，一定要重启防火墙，配置才会生效：

        firewall-cmd --reload

##################################################

# 删除指定端口：

    # 删除 13306 端口：

        firewall-cmd --zone=public --remove-port=13306/tcp --permanent
    
    # 删除完端口，一定要重启防火墙，配置才会生效：

        firewall-cmd --reload

##################################################
