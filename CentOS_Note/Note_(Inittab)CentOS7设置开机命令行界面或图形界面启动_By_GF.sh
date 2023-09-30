#
# CentOS7设置开机命令行界面或图形界面启动_By_GF.
#
# Created by GF on 2023-03-17.
#

##################################################

# CentOS中6种运行级别如下：

# 0：关机 ------------- runleve0 --- poweroff.target
# 1：单用户 ----------- runleve1 --- rescue.target
# 2：多用户无网络 ------ runleve2 --- multi-user.target
# 3：多用户有网络 ------ runleve3 --- multi-user.target
# 4：保留 ------------- runleve4 --- multi-user.target
# 5：图形界面 --------- runleve5 --- graphical.target
# 6：关机并重启 ------- runleve6 --- reboot.target

##################################################

# CentOS 7(含)以上版本设置开机命令行界面启动：

    systemclt set-default multi-user.target
    
    # 或者

    systemctl set-default runlevel3
 
    # 等同于

    rm /etc/systemd/system/default.target && ln -sf /lib/systemd/system/multi-user.target /etc/systemd/system/default.target

##################################################

# CentOS 7(含)以上版本设置开机图形界面启动：

    systemclt set-default graphical.target
    
    # 或者

    systemctl set-default runlevel5
 
    # 等同于

    rm /etc/systemd/system/default.target && ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

##################################################

# 手动启动某个模式：

    # 运行命令行模式
    
    init 3
 
    # 运行图形界面
    
    init 5

##################################################
