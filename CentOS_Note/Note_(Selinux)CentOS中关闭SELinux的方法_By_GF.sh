#
# CentOS中关闭SELinux的方法_By_GF
#
# Created by GF on 2023-03-17.
#

##################################################

# 临时关闭selinux：

    # 临时关闭selinux：

        setenforce 0
    
    # 查看selinux状态：
    
        getenforce

##################################################

# 永久关闭selinux：

    # 方法1 直接通过命令关闭selinux

        sed -ri 's/SELINUX=enforcing/SELINUX=disabled/'  /etc/selinux/config

    # 方法2 修改配置文件

        vim /etc/selinux/config

        # 将`SELINUX=enforcing`修改为`SELINUX=disabled`

# reboot 或init 6 重启Linux服务器让以上配置永久生效。

# 如果不想现在重启服务器，也可以先临时关闭selinux，等到下次重启服务器，selinux就可以永久关闭了。

##################################################
