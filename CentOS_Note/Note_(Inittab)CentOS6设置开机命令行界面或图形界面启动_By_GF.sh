#
# CentOS6设置开机命令行界面或图形界面启动_By_GF.
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

# CentOS 7以下版本设置开机命令行界面或图形界面启动：

    vim /etc/inittab

    id:5:initdefault: -------> id:3:initdefault:

##################################################
