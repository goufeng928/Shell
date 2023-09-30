#! /bin/bash
# Create By GF 2023-03-21 17:23

# 全局变量。
# ---------
STORAGE=/home/goufeng

# 配置portablexdr-4.9.1函数。
# --------------------------
function configure_portablexdr_4_9_1() {

    # /usr/local/portablexdr-4.9.1/lib
    # - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
    #   during execution
    # - add LIBDIR to the `LD_RUN_PATH' environment variable
    #   during linking
    # - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
    # - have your system administrator add LIBDIR to `/etc/ld.so.conf'
    # --------------------------------------------------

    #echo "export C_INCLUDE_PATH=/usr/local/portablexdr-4.9.1/include:$C_INCLUDE_PATH" >> /etc/profile
    #echo "export LD_RUN_PATH=/usr/local/portablexdr-4.9.1/lib:$LD_RUN_PATH" >> /etc/profile
    #echo "export LD_LIBRARY_PATH=/usr/local/portablexdr-4.9.1/lib:$LD_LIBRARY_PATH" >> /etc/profile
    # --------------------------------------------------
    local LD_Exists=$(cat /etc/ld.so.conf | grep -o /usr/local/portablexdr-4.9.1/lib)
    if [[ -z "$LD_Exists" ]]; then
        echo "/usr/local/portablexdr-4.9.1/lib" >> /etc/ld.so.conf; fi
    # --------------------------------------------------
    #ln -sf /usr/local/portablexdr-4.9.1/bin/portable-rpcgen  /usr/local/bin
    # --------------------------------------------------     
    #ln -sf /usr/local/portablexdr-4.9.1/include/rpc/rpc.h   /usr/local/include/rpc
    #ln -sf /usr/local/portablexdr-4.9.1/include/rpc/types.h /usr/local/include/rpc
    #ln -sf /usr/local/portablexdr-4.9.1/include/rpc/xdr.h   /usr/local/include/rpc
}

# 编译安装portablexdr-4.9.1函数。
# ------------------------------
function compile_install_compile_install_portablexdr_4_9_1() {

    if [[ ! -d "/usr/local/portablexdr-4.9.1" ]]; then
    
        local verify
    
        read -p "Compile and Install \"portablexdr-4.9.1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi
    
        tar zxvf $STORAGE/portablexdr-4.9.1.tar.gz        && \
                                                             \
        cd $STORAGE/portablexdr-4.9.1                     && \
                                                             \
        ./configure --prefix=/usr/local/portablexdr-4.9.1 && \
                                                             \
        make                                              && \
                                                             \
        make install                                      && \
                                                             \
        cd $STORAGE                                       && \
                                                             \
        rm -rf $STORAGE/portablexdr-4.9.1                 && \
                                                             \
        configure_portablexdr_4_9_1                       && \
                                                             \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/portablexdr-4.9.1\" Already Exists."
    fi
}

function main() {

    compile_install_portablexdr_4_9_1
    
    exit 0
}

main
