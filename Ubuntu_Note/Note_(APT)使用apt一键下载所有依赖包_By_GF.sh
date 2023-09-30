#
# 使用apt一键下载所有依赖包
#
# Created by GF on 2022-08-27.
#

##################################################

# 使用apt一键下载所有依赖包

sudo apt-get install --reinstall -d `apt-cache depends 软件包名 | grep "依赖" | cut -d: -f2 |tr -d "<>"`

##################################################
