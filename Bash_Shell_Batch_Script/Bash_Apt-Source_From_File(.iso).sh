#! /bin/bash
# Create By GF 2023-03-21 22:08

sudo umount /dev/sr0

sudo mount -t iso9660 -o loop ./Source.iso /cdrom

if [[ ! -f "/etc/apt/sources.list.self-contained" ]]; then

    cp /etc/apt/sources.list /etc/apt/sources.list.self-contained
    
    echo "[ SH ] 已备份文件：\"/etc/apt/sources.list\" -> \"/etc/apt/sources.list.self-contained\""

else

    echo "[ SH ] 文件已存在：\"/etc/apt/sources.list.self-contained\""

fi

cat /dev/null > /etc/apt/sources.list

# -------------------- Status 1 --------------------
# 新的/etc/apt/sources.list包含以下内容：
# deb file:///cdrom bionic main restricted
# 其中bionic是18.04的代号，换为相应版本的代号。

# -------------------- Status 2 --------------------
# 新的/etc/apt/sources.list包含以下内容：
# deb file:///cdrom jammy main restricted
# 其中jammy是22.04的代号，换为相应版本的代号。

echo "deb file:///cdrom bionic main restricted" > /etc/apt/sources.list

apt clean all

apt update

# 清理和更新后就可以使用apt install xxx安装软件了。