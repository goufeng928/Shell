#
# scp命令的基本使用
#
# Created by GF on 2023/2/21.
#

##################################################

# 从本地复制到远程

scp /home/space/music/1.mp3 root@www.runoob.com:/home/root/others/music
# 或者
scp /home/space/music/1.mp3 root@www.runoob.com:/home/root/others/music/001.mp3
# 或者
scp /home/space/music/1.mp3 www.runoob.com:/home/root/others/music
# 或者
scp /home/space/music/1.mp3 www.runoob.com:/home/root/others/music/001.mp3

# 第1,2个指定了用户名，命令执行后需要再输入密码，第1个仅指定了远程的目录，文件名字不变，第2个指定了文件名。
# 第3,4个没有指定用户名，命令执行后需要输入用户名和密码，第3个仅指定了远程的目录，文件名字不变，第4个指定了文件名。

##################################################

# 从远程复制到本地

scp root@www.runoob.com:/home/root/others/music /home/space/music/1.mp3 
# 或者
scp -r www.runoob.com:/home/root/others/ /home/space/music/

# 从远程复制到本地，只要将从本地复制到远程的命令的后2个参数调换顺序即可。

##################################################

# 使用密钥免密从本地复制到远程

scp -i /home/keys/id_rsa -P 2390 /home/file1 user@192.268.1.3:/home/user

# 如果公钥和私钥存储在非标准位置，则需要指定它们的路径，例如，如果私钥存储在/home/keys/id_rsa。

##################################################
