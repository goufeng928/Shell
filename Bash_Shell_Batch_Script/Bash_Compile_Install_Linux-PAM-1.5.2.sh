#! /bin/bash
# Create By GF 2023-03-21 17:23

# Need File: zlib-1.2.13.tar.gz
# Need File: libtirpc-1.3.3.tar.bz2
# Need File: rpcsvc-proto-1.4.3.tar.xz
# Need File: Linux-PAM-1.5.2.tar.xz

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
    
        local verify
    
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

# 部署libtirpc-1.3.3函数。
# ---------------------
function deploy_tirpc_1_3_3() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include/rpc" ]]; then
        mkdir /usr/local/include/rpc; fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/include/rpcsvc" ]]; then
        mkdir /usr/local/include/rpcsvc; fi
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/netconfig.h     /usr/local/include/
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/auth_des.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/auth.h      /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/auth_unix.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/clnt.h      /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/clnt_soc.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/clnt_stat.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/des_crypt.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/des.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/key_prot.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/nettype.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/pmap_clnt.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/pmap_prot.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/pmap_rmt.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/raw.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpcb_clnt.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpcb_prot.h /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpcb_prot.x /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpc_com.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpcent.h    /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpc.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/rpc_msg.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/svc_auth.h  /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/svc_dg.h    /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/svc.h       /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/svc_mt.h    /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/svc_soc.h   /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/types.h     /usr/local/include/rpc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpc/xdr.h       /usr/local/include/rpc/
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpcsvc/crypt.h  /usr/local/include/rpcsvc/
    ln -sf /usr/local/tirpc-1.3.3/include/tirpc/rpcsvc/crypt.x  /usr/local/include/rpcsvc/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    ln -sf /usr/local/tirpc-1.3.3/lib/libtirpc.la       /usr/local/lib/
    ln -sf /usr/local/tirpc-1.3.3/lib/libtirpc.so       /usr/local/lib/
    ln -sf /usr/local/tirpc-1.3.3/lib/libtirpc.so.3     /usr/local/lib/
    ln -sf /usr/local/tirpc-1.3.3/lib/libtirpc.so.3.0.0 /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig; fi
    # --------------------------------------------------
    ln -sf /usr/local/tirpc-1.3.3/lib/pkgconfig/libtirpc.pc /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    return 0
}

# 编译安装librpc-1.3.3函数。
# -------------------------
function compile_install_tirpc_1_3_3() {

    if [[ ! -d "/usr/local/tirpc-1.3.3" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"tirpc-1.3.3\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi
        
        tar jxvf $STORAGE/libtirpc-1.3.3.tar.bz2    && \
                                                       \
        cd $STORAGE/libtirpc-1.3.3                  && \
                                                       \
        ./configure --prefix=/usr/local/tirpc-1.3.3    \
                    --disable-static                   \
                    --disable-gssapi                && \
                                                       \
        make                                        && \
                                                       \
        make install                                && \
                                                       \
        cd $STORAGE                                 && \
                                                       \
        rm -rf $STORAGE/libtirpc-1.3.3              && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/tirpc-1.3.3\" Already Exists."
        
        return 0
    fi
    
    # --------------------------------------------------
    # -------------- ./configure Default ---------------
    # ./configure --prefix=/usr/local/tirpc-1.3.3 \
    #             --sysconfdir=/etc               \
    #             --disable-static                \
    #             --disable-gssapi
}

# 部署rpcsvc-proto-1.4.3函数。
# ---------------------------
function deploy_rpcsvc_proto_1_4_3() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include/rpcsvc" ]]; then
        mkdir /usr/local/include/rpcsvc; fi
    # --------------------------------------------------
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/bootparam_prot.h /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/bootparam_prot.x /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/key_prot.h       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/key_prot.x       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/klm_prot.h       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/klm_prot.x       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/mount.h          /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/mount.x          /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/nfs_prot.h       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/nfs_prot.x       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/nlm_prot.h       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/nlm_prot.x       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rex.h            /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rex.x            /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rquota.h         /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rquota.x         /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rstat.h          /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rstat.x          /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rusers.h         /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/rusers.x         /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/sm_inter.h       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/sm_inter.x       /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/spray.h          /usr/local/include/rpcsvc/
    ln -sf /usr/local/rpcsvc-proto-1.4.3/include/rpcsvc/spray.x          /usr/local/include/rpcsvc/
    # --------------------------------------------------
    # ------------------ Binary File -------------------
    ln -sf /usr/local/rpcsvc-proto-1.4.3/bin/rpcgen /usr/local/bin/
    # --------------------------------------------------
    # --------------------------------------------------
    return 0
}

# 编译安装rpcsvc-proto-1.4.3函数。
# -------------------------------
function compile_install_rpcsvc_proto_1_4_3() {

    if [[ ! -d "/usr/local/rpcsvc-proto-1.4.3" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"rpcsvc-proto-1.4.3\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi
    
        tar xvJf $STORAGE/rpcsvc-proto-1.4.3.tar.xz        && \
                                                              \
        cd $STORAGE/rpcsvc-proto-1.4.3                     && \
                                                              \
        ./configure --prefix=/usr/local/rpcsvc-proto-1.4.3 && \                       
                                                              \
        make                                               && \
                                                              \
        make install                                       && \
                                                              \
        cd $STORAGE                                        && \
                                                              \
        rm -rf $STORAGE/rpcsvc-proto-1.4.3                 && \
                                                              \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/rpcsvc-proto-1.4.3\" Already Exists."
        
        return 0
    fi
    
    # --------------------------------------------------
    # -------------- ./configure Default ---------------
    # ./configure --prefix=/usr/local/rpcsvc-proto-1.4.3 \
    #             --sysconfdir=/etc                        
}

# 配置Linxu-PAM-1.5.2函数。
# ------------------------
function configure_Linxu_PAM_1_5_2() {

    #Block# # --------------------------------------------------
    #Block# # ---------------- System Service ------------------
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/systemd/system/pam_namespace.service /lib/systemd/system/pam.service
    
    # --------------------------------------------------
    return 0
}

# 部署Linxu-PAM-1.5.2函数。
# ------------------------
function deploy_Linxu_PAM_1_5_2() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include/pam" ]]; then
        mkdir /usr/local/include/pam; fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/include/security" ]]; then
        mkdir /usr/local/include/security; fi
    # --------------------------------------------------
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_appl.h    /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_client.h  /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/_pam_compat.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_ext.h     /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_filter.h  /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/_pam_macros.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_misc.h    /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_modules.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_modutil.h /usr/local/include/pam/
    ln -s /usr/local/Linux-PAM-1.5.2/include/_pam_types.h  /usr/local/include/pam/
    # --------------------------------------------------
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_appl.h    /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_client.h  /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/_pam_compat.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_ext.h     /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_filter.h  /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/_pam_macros.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_misc.h    /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_modules.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/pam_modutil.h /usr/local/include/security/
    ln -s /usr/local/Linux-PAM-1.5.2/include/_pam_types.h  /usr/local/include/security/
    
    #Block# # --------------------------------------------------
    #Block# # ------------------ Library File ------------------
    #Block# # Must First Delete Self Contained Linux-PAM Library File
    #Block# # --------------------------------------------------
    #Block# if [[ ! -d "/usr/local/include/lib" ]]; then
    #Block#     mkdir /usr/local/include/lib; fi
    #Block# # --------------------------------------------------
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpamc.la            /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpamc.so            /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpamc.so.0          /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpamc.so.0.82.1     /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam.la             /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam_misc.la        /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam_misc.so        /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam_misc.so.0      /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam_misc.so.0.82.1 /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam.so             /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam.so.0           /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/libpam.so.0.85.1      /usr/local/lib/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/security              /usr/local/lib/
    #Block# # --------------------------------------------------
    #Block# # ------------------ Pkg Config --------------------
    #Block# # Must First Delete Self Contained Linux-PAM Pkg Config
    #Block# # --------------------------------------------------
    #Block# if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
    #Block#     mkdir /usr/local/lib/pkgconfig; fi
    #Block# # --------------------------------------------------
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/pkgconfig/pamc.pc     /usr/local/lib/pkgconfig/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/pkgconfig/pam_misc.pc /usr/local/lib/pkgconfig/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/lib/pkgconfig/pam.pc      /usr/local/lib/pkgconfig/
    #Block# # --------------------------------------------------
    #Block# # ---------------- Sys Binary File -----------------
    #Block# # Must First Delete Self Contained Linux-PAM Sys Binary File
    #Block# # --------------------------------------------------
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/faillock             /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/mkhomedir_helper     /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/pam_namespace_helper /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/pam_timestamp_check  /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/pwhistory_helper     /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/unix_chkpwd          /usr/local/sbin/
    #Block# ln -s /usr/local/Linux-PAM-1.5.2/sbin/unix_update          /usr/local/sbin/

    # --------------------------------------------------
    return 0
}

# 编译安装pam-1.5.2函数。
# ---------------------
function compile_install_Linxu_PAM_1_5_2() {

    if [[ ! -d "/usr/local/Linux-PAM-1.5.2" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"Linux-PAM-1.5.2\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi
    
        tar xvJf $STORAGE/Linux-PAM-1.5.2.tar.xz            && \
                                                               \
        cd $STORAGE/Linux-PAM-1.5.2                         && \
                                                               \
        ./configure --prefix=/usr/local/Linux-PAM-1.5.2     && \
                                                               \
        make LIBS="-ltirpc"                                 && \
                                                               \
        make install                                        && \
                                                               \
        configure_Linxu_PAM_1_5_2                           && \
                                                               \
        cd $STORAGE                                         && \
                                                               \
        rm -rf $STORAGE/Linux-PAM-1.5.2                     && \
                                                               \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/Linux-PAM-1.5.2\" Already Exists."
        
        return 0
    fi
    
    # --------------------------------------------------
    # -------------- ./configure Default ---------------
    # ./configure --prefix=/usr                              \
    #             --sbindir=/usr/sbin                        \
    #             --sysconfdir=/etc                          \
    #             --libdir=/usr/lib                          \
    #             --enable-securedir=/usr/lib/security       \
    #             --docdir=/usr/share/doc/Linux-PAM-1.5.2
}

function main() {

    compile_install_zlib_1_2_13        && deploy_zlib_1_2_13
    compile_install_tirpc_1_3_3        && deploy_tirpc_1_3_3
    compile_install_rpcsvc_proto_1_4_3 && deploy_rpcsvc_proto_1_4_3
    compile_install_Linxu_PAM_1_5_2    && deploy_Linxu_PAM_1_5_2
    
    exit 0
}

main
