#! /bin/bash
# Create By GF 2023-04-03 16:47

# Need File: zlib-1.2.13.tar.gz
# Need File: openssl-1.1.1g.tar.gz
# Need File: Python-3.8.0.tgz

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

# 编译安装openssl-1.1.1g函数。
# ---------------------------
function compile_install_openssl_1_1_1g() {

    if [[ ! -d "/usr/local/openssl-1.1.1g" ]]; then
    
        local verify=NULL
    
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

function deploy_Python_3_8_0() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    ln -s /usr/local/Python-3.8.0/bin/python3 /usr/local/bin/python380
    ln -s /usr/local/Python-3.8.0/bin/pip3    /usr/local/bin/pip380
    # --------------------------------------------------
    return 0
}

function compile_install_Python_3_8_0() {
    
    if [[ ! -d "/usr/local/Python-3.8.0" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ] Compile and Install \"Python-3.8.0\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/Python-3.8.0.tgz                  && \
                                                                \
        cd $STORAGE/Python-3.8.0                             && \
                                                                \
        ./configure --prefix=/usr/local/Python-3.8.0            \
                    --with-openssl=/usr/local/openssl-1.1.1g && \
                                                                \
        make && make install                                 && \
                                                                \
        deploy_Python_3_8_0                                  && \
                                                                \
        cd $STORAGE                                          && \
	                                                            \
        rm -rf $STORAGE/Python-3.8.0                         && \
                                                                \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/Python-3.8.0\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_zlib_1_2_13
    compile_install_openssl_1_1_1g
    compile_install_Python_3_8_0
}

main