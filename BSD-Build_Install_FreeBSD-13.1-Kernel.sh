#! /bin/tcsh
# Create By GF 2023-05-22 20:33

# Need File: {FreeBSD DVD}/USR/FREEBSD_DIST/SRC.TXZ

set STORAGE = /home/goufeng

# ##################################################
# ##### 0. Remove Old (Self-Contained) Kernel ######
rm -rf /usr/src/

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ######## 1. Decompress Kernel Source Code ########
if ( $? == 0 ) then
    tar xzpf $STORAGE/SRC.TXZ -C /
endif
# --------------------------------------------------
# tar -p xzpf src.txz -C / 中 -p 表示保留文件权限属性。

# ----------------------------------------------------------------------------------------------------

# ######################################################################
# ### 2. Switch To "conf" Under Corresponding Architecture Directory ###
# ----------------------------------------------------------------------
# /usr/src/sys/<架构>/conf
# ----------------------------------------------------------------------
if ( $? == 0 ) then
    cd /usr/src/sys/amd64/conf
endif

# ----------------------------------------------------------------------------------------------------

# #######################################################
# ### 3. Copy a Kernel Configuration File As MYKERNEL ###
if ( $? == 0 ) then
    cp GENERIC MYKERNEL
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# #### 4. Edit Custom Kernel Configuration File ####

# --------------------------------------------------
# (1) Copy the original and edit it.
# --------------------------------------------------
# ee MYKERNEL
# '''
# ident    MYKERNEL #修改内核配置文件名称
# ...
# # Floppy drives
# #device  fdc  #比如，禁用软盘驱动
# ...
# '''
# --------------------------------------------------
# (2) Create a new blank kernel configuration file MYKERNEL and edit it.
# --------------------------------------------------
# ee MYKERNEL
# '''
# include GENERIC #引入初始的GENERIC配置文件
# ident  MYKERNEL #本配置文件名称
# ...
# #使用nooptions或nodevice选项来排除某些设定
# nodevice  fdc  #禁用软盘驱动
# #此方法适合对内核参数做少量更改的情况。
# '''
# --------------------------------------------------

# ##################################################
# ##### 5. Recompile And Reinstall The Kernel ######
if ( $? == 0 ) then
    cd /usr/src                          && \
    make buildkernel KERNCONF=MYKERNEL   && \
    make installkernel KERNCONF=MYKERNEL
endif

# ----------------------------------------------------------------------------------------------------
# EOF