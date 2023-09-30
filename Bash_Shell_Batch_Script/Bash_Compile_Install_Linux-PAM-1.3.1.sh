#! /bin/bash
# Create By GF 2023-03-21 17:23

# Need File : zlib-1.2.13.tar.gz
# Need File : libtirpc-1.2.6.tar.bz2
# Need File : Linux-PAM-1.3.1.tar.xz

# 全局变量。
# ---------
STORAGE=/home/goufeng

# 部署zlib-1.2.13函数。
# --------------------
function deploy_zlib_1_2_13() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include; fi
    # --------------------------------------------------
    ln -sf /usr/local/zlib-1.2.13/include/zconf.h /usr/local/include/
    ln -sf /usr/local/zlib-1.2.13/include/zlib.h  /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib; fi
    # --------------------------------------------------
    ln -sf /usr/local/zlib-1.2.13/lib/libz.a         /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/libz.so        /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/libz.so.1      /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/libz.so.1.2.13 /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig; fi
    # --------------------------------------------------
    ln -sf /usr/local/zlib-1.2.13/lib/pkgconfig/zlib.pc /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    return 0
}

# 编译安装zlib-1.2.13函数。
# ------------------------
function compile_install_zlib_1_2_13() {

    if [[ ! -d "/usr/local/zlib-1.2.13" ]]; then
    
        local verify=NULL
    
        read -p "Compile and Install \"zlib-1.2.13\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/zlib-1.2.13.tar.gz        && \
                                                       \
        cd $STORAGE/zlib-1.2.13                     && \
                                                       \
        ./configure --prefix=/usr/local/zlib-1.2.13 && \
                                                       \
        make && make install                        && \
                                                       \
        deploy_zlib_1_2_13                          && \
                                                       \
        cd $STORAGE                                 && \
                                                       \
        rm -rf $STORAGE/zlib-1.2.13                 && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/zlib-1.2.13\" Already Exists."

        return 0        
    fi
}

# 配置librpc-1.2.6函数。
# ---------------------
function configure_tirpc_1_2_6() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include/rpc" ]]; then
        mkdir /usr/local/include/rpc; fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/include/rpcsvc" ]]; then
        mkdir /usr/local/include/rpcsvc; fi
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/netconfig.h     /usr/local/include/
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/auth_des.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/auth.h      /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/auth_unix.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/clnt.h      /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/clnt_soc.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/clnt_stat.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/des_crypt.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/des.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/key_prot.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/nettype.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/pmap_clnt.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/pmap_prot.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/pmap_rmt.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/raw.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpcb_clnt.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpcb_prot.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpcb_prot.x /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpc_com.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpcent.h    /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpc.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/rpc_msg.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/svc_auth.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/svc_dg.h    /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/svc.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/svc_mt.h    /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/svc_soc.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/types.h     /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpc/xdr.h       /usr/local/include/rpc/
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpcsvc/crypt.h  /usr/local/include/rpcsvc/
    ln -sf /usr/local/tirpc-1.2.6/include/tirpc/rpcsvc/crypt.x  /usr/local/include/rpcsvc/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    ln -sf /usr/local/tirpc-1.2.6/lib/libtirpc.la       /usr/local/lib/
    ln -sf /usr/local/tirpc-1.2.6/lib/libtirpc.so       /usr/local/lib/
    ln -sf /usr/local/tirpc-1.2.6/lib/libtirpc.so.3     /usr/local/lib/
    ln -sf /usr/local/tirpc-1.2.6/lib/libtirpc.so.3.0.0 /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig; fi
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.2.6/lib/pkgconfig/libtirpc.pc /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    return 0
}

# 编译安装librpc-1.2.6函数。
# -------------------------
function compile_install_tirpc_1_2_6() {

    if [[ ! -d "/usr/local/tirpc-1.2.6" ]]; then
    
        local verify
    
        read -p "Compile and Install \"tirpc-1.2.6\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi
        
        tar jxvf $STORAGE/libtirpc-1.2.6.tar.bz2    && \
                                                       \
        cd $STORAGE/libtirpc-1.2.6                  && \
                                                       \
        ./configure --prefix=/usr/local/tirpc-1.2.6    \
                    --disable-static                   \
                    --disable-gssapi                && \
                                                       \
        make                                        && \
                                                       \
        make install                                && \
                                                       \
        configure_tirpc_1_2_6                       && \
                                                       \
        cd $STORAGE                                 && \
                                                       \
        rm -rf $STORAGE/libtirpc-1.2.6              && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/tirpc-1.2.6\" Already Exists."
        
        return 0
    fi
    
    # --------------------------------------------------
    # -------------- ./configure Default ---------------
    # ./configure --prefix=/usr/local/tirpc-1.2.6 \
    #             --sysconfdir=/etc               \
    #             --disable-static                \
    #             --disable-gssapi
}

# 配置Linxu-PAM-1.3.1函数。
# ------------------------
function configure_Linxu_PAM_1_3_1() {

    # --------------------------------------------------
    # ------------------- Conf File --------------------
    if [[ -f "/etc/pam.conf" && ! -f "/etc/pam.conf.self.contained" ]]; then
        cp -p /etc/pam.conf /etc/pam.conf.self.contained; fi
    # --------------------------------------------------
    cp -p $STORAGE/Linux-PAM-1.3.1/conf/pam.conf /etc/pam.conf
    # --------------------------------------------------
    return 0
}

# 部署Linxu-PAM-1.3.1函数。
# ------------------------
function deploy_Linxu_PAM_1_3_1() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include/pam" ]]; then
        mkdir /usr/local/include/pam; fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/include/security" ]]; then
        mkdir /usr/local/include/security; fi
    # --------------------------------------------------
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_appl.h    /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_client.h  /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/_pam_compat.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_ext.h     /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_filter.h  /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/_pam_macros.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_misc.h    /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_modules.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_modutil.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.3.1/include/_pam_types.h  /usr/local/include/pam/
    # --------------------------------------------------
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_appl.h    /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_client.h  /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/_pam_compat.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_ext.h     /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_filter.h  /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/_pam_macros.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_misc.h    /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_modules.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/pam_modutil.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.3.1/include/_pam_types.h  /usr/local/include/security/
    
    #Block# # --------------------------------------------------
    #Block# # ------------------ Library File ------------------
    #Block# # Must First Delete Self Contained Linux-PAM Library File
    #Block# # --------------------------------------------------
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpamc.la            /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpamc.so            /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpamc.so.0          /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpamc.so.0.82.1     /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam.la             /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam.so             /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam.so.0           /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam.so.0.84.2      /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam_misc.la        /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam_misc.so        /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam_misc.so.0      /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/libpam_misc.so.0.82.1 /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/lib/security              /usr/local/lib/
    #Block# # --------------------------------------------------
    #Block# # ---------------- Sys Binary File -----------------
    #Block# # Must First Delete Self Contained Linux-PAM Sys Binary File
    #Block# # --------------------------------------------------
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/sbin/mkhomedir_helper    /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/sbin/pam_tally           /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/sbin/pam_tally2          /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/sbin/pam_timestamp_check /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/sbin/unix_chkpwd         /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.3.1/sbin/unix_update         /usr/local/sbin/
    
    # --------------------------------------------------
    return 0
}

# 编译安装Linxu-PAM-1.3.1函数。
# ----------------------------
function compile_install_Linxu_PAM_1_3_1() {

    if [[ ! -d "/usr/local/Linux-PAM-1.3.1" ]]; then
    
        local verify
    
        read -p "Compile and Install \"Linux-PAM-1.3.1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi
    
        tar xvJf $STORAGE/Linux-PAM-1.3.1.tar.xz        && \
                                                           \
        cd $STORAGE/Linux-PAM-1.3.1                     && \
                                                           \
        ./configure --prefix=/usr/local/Linux-PAM-1.3.1    \
                    --enable-read-both-confs            && \
                                                           \
        make LIBS="-ltirpc"                             && \
                                                           \
        make install                                    && \
                                                           \
        configure_Linxu_PAM_1_3_1 devel                 && \
                                                           \
        deploy_Linxu_PAM_1_3_1                          && \
                                                           \
        cd $STORAGE                                     && \
                                                           \
        rm -rf $STORAGE/Linux-PAM-1.3.1                 && \
                                                           \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/Linux-PAM-1.3.1\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_zlib_1_2_13
    compile_install_tirpc_1_2_6
    compile_install_Linxu_PAM_1_3_1
    
    exit 0
}

main
