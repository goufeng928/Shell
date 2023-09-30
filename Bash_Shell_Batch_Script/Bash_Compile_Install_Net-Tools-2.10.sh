#! /bin/bash
# Create By GF 2023-03-21 17:23

# Need File : net-tools-2.10.tar.xz

STORAGE=/home/goufeng

# 如果接受所有的缺省设置，就用yes "" | make config 来配置。

# 编译安装net-tools-2.10函数。
# --------------------------
function compile_install_net_tools_2_10() {

    if [[ ! -f "/usr/bin/ifconfig" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"net-tools-2.10\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar xvJf $STORAGE/net-tools-2.10.tar.xz && \
	                                               \
        cd $STORAGE/net-tools-2.10              && \
	                                               \
        yes "" | make config                    && \
	                                               \
        make && make install                    && \
	                                               \
        cd $STORAGE                             && \
                                                   \
        rm -rf $STORAGE/net-tools-2.10          && \
                                                   \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/bin/ifconfig\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_net_tools_2_10
}

main
