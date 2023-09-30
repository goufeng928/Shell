# BSD-动态库管理-ldconfig配置：

# Create By GF 2023-05-24 20:36

# FreeBSD和linux不是一样的。

# 在 /etc/ 下加入 ld-elf.so.conf 里面写上你的目录，比如 /usr/local/samba/lib，没有的话可以创建。

# 目录配置完成后，执行以下命令：

    sudo /etc/rc.d/ldconfig restart

    # or

    /etc/rc.d/ldconfig forcerestart

# --------------------------------------------------

# 查看加载的动态库路径，执行以下命令

    ldconfig -r

    ldconfig -r | less

# --------------------------------------------------

# 或者 /etc/rc.conf 里加ldconfig_path=""，这是系统起来的时候再设置的。

# --------------------------------------------------
# EOF