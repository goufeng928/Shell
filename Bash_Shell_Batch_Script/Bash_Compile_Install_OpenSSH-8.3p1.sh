#! /bin/bash
# Create By GF 2023-03-21 17:23

# Need to Install First: Linux-PAM-1.5.2

# Need File : openssl-1.1.1g.tar.gz
# Need File : openssh-8.3p1.tar.gz

# 全局变量。
# ---------
STORAGE=/home/goufeng

# 备份原版OpenSSL函数。
# --------------------
function backup_self_contained_openssl() {

    if [[ -f "/usr/bin/openssl" && ! -f "/usr/bin/openssl.self.contained" ]]; then
        mv /usr/bin/openssl /usr/bin/openssl.self.contained; fi
    # --------------------------------------------------
    return 0
}

# 部署OpenSSL-1.1.1g函数。
# -----------------------
function deploy_openssl_1_1_1g() {

    backup_self_contained_openssl

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    ln -sf /usr/local/openssl-1.1.1g/bin/openssl /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include/openssl" ]]; then
        mkdir /usr/local/include/openssl; fi
    # --------------------------------------------------
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/aes.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1err.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1_mac.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1t.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/asyncerr.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/async.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/bioerr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/bio.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/blowfish.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/bnerr.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/bn.h          /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/buffererr.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/buffer.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/camellia.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/cast.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/cmac.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/cmserr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/cms.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/comperr.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/comp.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/conf_api.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/conferr.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/conf.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/cryptoerr.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/crypto.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/cterr.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ct.h          /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/des.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/dherr.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/dh.h          /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/dsaerr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/dsa.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/dtls1.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ebcdic.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ecdh.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ecdsa.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ecerr.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ec.h          /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/engineerr.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/engine.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/e_os2.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/err.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/evperr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/evp.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/hmac.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/idea.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/kdferr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/kdf.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/lhash.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/md2.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/md4.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/md5.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/mdc2.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/modes.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/objectserr.h  /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/objects.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/obj_mac.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ocsperr.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ocsp.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/opensslconf.h /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/opensslv.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ossl_typ.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pem2.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pemerr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pem.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs12err.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs12.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs7err.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs7.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rand_drbg.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/randerr.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rand.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rc2.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rc4.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rc5.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ripemd.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rsaerr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/rsa.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/safestack.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/seed.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/sha.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/srp.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/srtp.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ssl2.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ssl3.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/sslerr.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ssl.h         /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/stack.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/storeerr.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/store.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/symhacks.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/tls1.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/tserr.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ts.h          /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/txt_db.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/uierr.h       /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/ui.h          /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/whrlpool.h    /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509err.h     /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509.h        /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509v3err.h   /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509v3.h      /usr/local/include/openssl/
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509_vfy.h    /usr/local/include/openssl/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib/engines-1.1" ]]; then
        mkdir /usr/local/lib/engines-1.1; fi
    # --------------------------------------------------
    ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/afalg.so   /usr/local/lib/engines-1.1/
    ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/capi.so    /usr/local/lib/engines-1.1/
    ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/padlock.so /usr/local/lib/engines-1.1/
    # --------------------------------------------------
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.a      /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so     /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.a         /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so        /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /usr/local/lib/
    # --------------------------------------------------
    # ----------------- Pkg Config File ----------------
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/libcrypto.pc /usr/local/lib/pkgconfig/
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/libssl.pc    /usr/local/lib/pkgconfig/
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/openssl.pc   /usr/local/lib/pkgconfig/
    
    # --------------------------------------------------
    # ------- Ubuntu 18.04 : Library 64bit File --------
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /lib64/libssl.so.1.1
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /lib64/libcrypto.so.1.1
    
    #Block# # --------------------------------------------------
    #Block# # ------- Ubuntu 22.04 : Library 64bit File --------
    #Block# ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /usr/lib64/libssl.so.1.1
    #Block# ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
    
    # --------------------------------------------------
    # ---------------- Update LD Library ---------------
    # Full Installation Requires Refreshing The Dynamic Library
    
    ldconfig
    
    # --------------------------------------------------
    return 0

}

# 编译安装openssl-1.1.1g函数。
# ---------------------------
function compile_install_openssl_1_1_1g() {

    if [[ ! -d "/usr/local/openssl-1.1.1g" ]]; then
    
        local verify
    
        read -p "[ SH Opt ]Compile and Install \"openssl-1.1.1g\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/openssl-1.1.1g.tar.gz         && \
                                                           \
        cd $STORAGE/openssl-1.1.1g                      && \
                                                           \
        ./config --prefix=/usr/local/openssl-1.1.1g        \
                 --openssldir=/usr/local/openssl-1.1.1g    \
                 --shared zlib                          && \
                                                           \
        make && make install                            && \
                                                           \
        deploy_openssl_1_1_1g                           && \
                                                           \
        cd $STORAGE                                     && \
                                                           \
        rm -rf $STORAGE/openssl-1.1.1g                  && \
                                                           \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/openssl-1.1.1g\" Already Exists."

        return 0        
    fi
}

function add_user_openssh_8_3p1() {

    # --------------------------------------------------
    # ------------------ Error Handle ------------------
    # Privilege separation user sshd does not exist
    
    local User_Exists=$(cat /etc/passwd | grep -o sshd)
    if [[ -z "$User_Exists" ]]; then
        echo "sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin" >> /etc/passwd; fi
    # --------------------------------------------------
    return 0
}

# 配置openssh-8.3p1函数。
# -----------------------
function configure_openssh_8_3p1() {

    # --------------------------------------------------
    # ------------- System Kernel Values ---------------
    local What_System_Ubuntu=$(uname -a | grep -o Ubuntu)
    local What_System_el7=$(uname -a | grep -o el7)
    # --------------------------------------------------
    # ------------ If Ubuntu : init.d File -------------
    if [[ ! -z "$What_System_Ubuntu" ]]; then
        cp $STORAGE/openssh-8.3p1/opensshd.init /etc/init.d/sshd && \
        chmod a+x /etc/init.d/sshd; fi
    # --------------------------------------------------
    # ------------ If Redhat : init.d File -------------
    if [[ ! -z "$What_System_el7" ]]; then
        cp $STORAGE/openssh-8.3p1/contrib/redhat/sshd.init /etc/init.d/sshd && \
        chmod a+x /etc/init.d/sshd; fi
    # --------------------------------------------------
    # ------------------- PAM File ---------------------
    cp -a $STORAGE/openssh-8.3p1/contrib/redhat/sshd.pam /etc/pam.d/sshd.pam
    
    # --------------------------------------------------
    # -------- Systemctl Controller File : Copy --------
    # Manual Operation Required
    
    #Prompt# /etc/init.d/sshd.init start
    #Prompt# # --------------------------------------------------
    #Prompt# cp /run/systemd/generator.late/sshd.service  /lib/systemd/system/sshd.service
    
    # --------------------------------------------------
    # ---- Ubuntu Systemctl Controller File : Create ---
    if [[ ! -f "/lib/systemd/system/sshd.service" ]]; then
        touch /lib/systemd/system/sshd.service; fi
    # --------------------------------------------------
    cat /dev/null > /lib/systemd/system/sshd.service
    # --------------------------------------------------
    echo "# Automatically generated by systemd-sysv-generator" >> /lib/systemd/system/sshd.service
    echo " " >> /lib/systemd/system/sshd.service
    echo "[Unit]" >> /lib/systemd/system/sshd.service
    echo "Documentation=man:systemd-sysv-generator(8)" >> /lib/systemd/system/sshd.service
    echo "SourcePath=/etc/init.d/sshd" >> /lib/systemd/system/sshd.service
    echo " " >> /lib/systemd/system/sshd.service
    echo "[Service]" >> /lib/systemd/system/sshd.service
    echo "Type=forking" >> /lib/systemd/system/sshd.service
    echo "Restart=no" >> /lib/systemd/system/sshd.service
    echo "TimeoutSec=5min" >> /lib/systemd/system/sshd.service
    echo "IgnoreSIGPIPE=no" >> /lib/systemd/system/sshd.service
    echo "KillMode=process" >> /lib/systemd/system/sshd.service
    echo "GuessMainPID=no" >> /lib/systemd/system/sshd.service
    echo "RemainAfterExit=yes" >> /lib/systemd/system/sshd.service
    echo "ExecStart=/etc/init.d/sshd start" >> /lib/systemd/system/sshd.service
    echo "ExecStop=/etc/init.d/sshd stop" >> /lib/systemd/system/sshd.service
    
    #Block# # --------------------------------------------------
    #Block# # ---- CentOS Systemctl Controller File : Create ---
    #Block# if [[ ! -f "/usr/lib/systemd/system/sshd.service" ]]; then
    #Block#     touch /usr/lib/systemd/system/sshd.service; fi
    #Block# # --------------------------------------------------
    #Block# cat /dev/null > /usr/lib/systemd/system/sshd.service
    #Block# # --------------------------------------------------
    #Block# echo "# Automatically generated by systemd-sysv-generator" >> /usr/lib/systemd/system/sshd.service
    #Block# echo " " >> /usr/lib/systemd/system/sshd.service
    #Block# echo "[Unit]" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "Documentation=man:systemd-sysv-generator(8)" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "SourcePath=/etc/rc.d/init.d/sshd.init" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "Description=SYSV: OpenSSH server daemon" >> /usr/lib/systemd/system/sshd.service
    #Block# echo " " >> /usr/lib/systemd/system/sshd.service
    #Block# echo "[Service]" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "Type=forking" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "Restart=no" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "TimeoutSec=5min" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "IgnoreSIGPIPE=no" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "KillMode=process" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "GuessMainPID=no" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "RemainAfterExit=no" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "PIDFile=/var/run/sshd.pid" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "ExecStart=/etc/rc.d/init.d/sshd.init start" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "ExecStop=/etc/rc.d/init.d/sshd.init stop" >> /usr/lib/systemd/system/sshd.service
    #Block# echo "ExecReload=/etc/rc.d/init.d/sshd.init reload" >> /usr/lib/systemd/system/sshd.service
    
    # --------------------------------------------------
    return 0
}

# 备份原版openssh函数。
# --------------------
function backup_self_contained_openssh() {

    if [[ -f "/usr/bin/scp" && ! -f "/usr/bin/scp.self.contained" ]]; then
        mv /usr/bin/scp /usr/bin/scp.self.contained; fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/sftp" && ! -f "/usr/bin/sftp.self.contained" ]]; then
        mv /usr/bin/sftp /usr/bin/sftp.self.contained; fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/ssh" && ! -f "/usr/bin/ssh.self.contained" ]]; then
        mv /usr/bin/ssh /usr/bin/ssh.self.contained; fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/ssh-add" && ! -f "/usr/bin/ssh-add.self.contained" ]]; then
        mv /usr/bin/ssh-add /usr/bin/ssh-add.self.contained; fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/ssh-agent" && ! -f "/usr/bin/ssh-agent.self.contained" ]]; then
        mv /usr/bin/ssh-agent /usr/bin/ssh-agent.self.contained; fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/ssh-keygen" && ! -f "/usr/bin/ssh-keygen.self.contained" ]]; then
        mv /usr/bin/ssh-keygen /usr/bin/ssh-keygen.self.contained; fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/ssh-keyscan" && ! -f "/usr/bin/ssh-keyscan.self.contained" ]]; then
        mv /usr/bin/ssh-keyscan /usr/bin/ssh-keyscan.self.contained; fi
    # --------------------------------------------------
    return 0
}

# 部署openssh-8.3p1函数。
# -----------------------
function deploy_openssh_8_3p1() {

    backup_self_contained_openssh
    
    # --------------------------------------------------
    # ------------------ Binary File -------------------
    ln -s /usr/local/openssh-8.3p1/bin/scp         /usr/local/bin/
    ln -s /usr/local/openssh-8.3p1/bin/sftp        /usr/local/bin/
    ln -s /usr/local/openssh-8.3p1/bin/ssh         /usr/local/bin/
    ln -s /usr/local/openssh-8.3p1/bin/ssh-add     /usr/local/bin/
    ln -s /usr/local/openssh-8.3p1/bin/ssh-agent   /usr/local/bin/
    ln -s /usr/local/openssh-8.3p1/bin/ssh-keygen  /usr/local/bin/
    ln -s /usr/local/openssh-8.3p1/bin/ssh-keyscan /usr/local/bin/
    # --------------------------------------------------
    # ---------------- Sys Binary File -----------------
    ln -s /usr/local/openssh-8.3p1/sbin/sshd /usr/local/sbin/
    # --------------------------------------------------
    return 0
}

# 编译安装openssh-8.3p1函数。
# --------------------------
function compile_install_openssh_8_3p1() {

    if [[ ! -d "/usr/local/openssh-8.3p1" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"openssh-8.3p1\"? (y/n)>" verify

        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/openssh-8.3p1.tar.gz               && \
                                                                \
        cd $STORAGE/openssh-8.3p1                            && \
                                                                \
        add_user_openssh_8_3p1                               && \
                                                                \
        CFLAGS="-I/usr/local/openssl-1.1.1g/include"            \
        LDFLAGS="-L/usr/local/openssl-1.1.1g/lib                \
                 -L/usr/local/Linux-PAM-1.5.2/lib"              \
                                                                \
        ./configure --prefix=/usr/local/openssh-8.3p1           \
                    --sysconfdir=/etc/ssh                       \
                    --with-ssl-dir=/usr/local/openssl-1.1.1g    \
                    --with-pam                               && \
                                                                \
        make && make install                                 && \
                                                                \
        configure_openssh_8_3p1                              && \
                                                                \
        deploy_openssh_8_3p1                                 && \
                                                                \
        cd $STORAGE                                          && \
                                                                \
        rm -rf $STORAGE/openssh-8.3p1                        && \
                                                                \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/openssh-8.3p1\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_openssl_1_1_1g
    compile_install_openssh_8_3p1
    
    exit 0
}

main
