#
# CentOS使用yumdownloader下载全量依赖包_By_GF
#
# Created by GF on 2023-03-16.
#

##################################################

安装yum-utils : yum -y install yum-utils

下载软件依赖包 : yumdownloader --resolve --destdir=/home/goufeng/temp 软件包名

--destdir选项说明 : 指定rpm包下载目录 (不指定时默认为当前目录)

--resolve选项说明 : 下载依赖的rpm包

##################################################
