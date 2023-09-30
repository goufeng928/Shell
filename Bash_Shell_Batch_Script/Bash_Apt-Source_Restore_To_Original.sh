#! /bin/bash
# Create By GF 2023-03-21 22:08

umount /dev/sr0

rm /etc/apt/sources.list

cp /etc/apt/sources.list.self-contained /etc/apt/sources.list

apt clean all

apt update

# 清理和更新后就可以使用apt install xxx安装软件了。