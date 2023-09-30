#
# Centos7使用yum和rpm命令卸载软件或程序_By_GF
#
# Created by GF on 2023-03-17.
#

##################################################

yum remove Konqueror

# 温馨提示：Centos7 KDE图形界面自带的Konqueror软件不能随便卸载，不然会导致系统崩溃，这里只是举个例子。

# 出现 Complete! 就证明已经卸载完成了。

##################################################

# 如果是用 rpm 包安装的软件呢，则使用如下命令进行卸载：

rpm -e 软件名

##################################################

# yum remove 实操：

#[centos@ip-172-31-33-40 ~]$ sudo rpm -qa | grep clamd*  #提示：rpm -qa | grep 列出需要卸载的安装包，支持通配符。
#clamav-filesystem-0.103.6-1.el7.noarch
#clamav-update-0.103.6-1.el7.x86_64
#clamav-devel-0.103.6-1.el7.x86_64
#clamav-data-0.103.6-1.el7.noarch
#clamav-lib-0.103.6-1.el7.x86_64
#clamav-0.103.6-1.el7.x86_64
#[centos@ip-172-31-33-40 ~]$ sudo yum remove clamav*  #提示：执行卸载，同样支持通配符。
#Loaded plugins: fastestmirror
#Resolving Dependencies
#--> Running transaction check
#---> Package clamav.x86_64 0:0.103.6-1.el7 will be erased
#---> Package clamav-data.noarch 0:0.103.6-1.el7 will be erased
#---> Package clamav-devel.x86_64 0:0.103.6-1.el7 will be erased
#---> Package clamav-filesystem.noarch 0:0.103.6-1.el7 will be erased
#---> Package clamav-lib.x86_64 0:0.103.6-1.el7 will be erased
#---> Package clamav-update.x86_64 0:0.103.6-1.el7 will be erased
#--> Finished Dependency Resolution
#
#Dependencies Resolved
#
#================================================================================================================================
#Package Arch Version Repository Size
#================================================================================================================================
#Removing:
#clamav x86_64 0.103.6-1.el7 @epel 13 M
#clamav-data noarch 0.103.6-1.el7 @epel 219 M
#clamav-devel x86_64 0.103.6-1.el7 @epel 73 k
#clamav-filesystem noarch 0.103.6-1.el7 @epel 26 k
#clamav-lib x86_64 0.103.6-1.el7 @epel 2.2 M
#clamav-update x86_64 0.103.6-1.el7 @epel 163 M
#
#Transaction Summary
#================================================================================================================================
#Remove 6 Packages
#
#Installed size: 397 M
#Is this ok [y/N]: y      #提示：为防止误删除，不建议在yum中加入 -y。
#Downloading packages:
#Running transaction check
#Running transaction test
#Transaction test succeeded
#Running transaction
#Erasing : clamav-devel-0.103.6-1.el7.x86_64 1/6
#Erasing : clamav-data-0.103.6-1.el7.noarch 2/6
#Erasing : clamav-0.103.6-1.el7.x86_64 3/6
#Erasing : clamav-lib-0.103.6-1.el7.x86_64 4/6
#Erasing : clamav-update-0.103.6-1.el7.x86_64 5/6
#Erasing : clamav-filesystem-0.103.6-1.el7.noarch 6/6
#Verifying : clamav-update-0.103.6-1.el7.x86_64 1/6
#Verifying : clamav-lib-0.103.6-1.el7.x86_64 2/6
#Verifying : clamav-filesystem-0.103.6-1.el7.noarch 3/6
#Verifying : clamav-devel-0.103.6-1.el7.x86_64 4/6
#Verifying : clamav-data-0.103.6-1.el7.noarch 5/6
#Verifying : clamav-0.103.6-1.el7.x86_64 6/6
#
#Removed:
#clamav.x86_64 0:0.103.6-1.el7 clamav-data.noarch 0:0.103.6-1.el7 clamav-devel.x86_64 0:0.103.6-1.el7
#clamav-filesystem.noarch 0:0.103.6-1.el7 clamav-lib.x86_64 0:0.103.6-1.el7 clamav-update.x86_64 0:0.103.6-1.el7
#
#Complete!

##################################################