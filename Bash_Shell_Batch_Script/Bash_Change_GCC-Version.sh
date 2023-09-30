#! /bin/bash
# Create By GF 2023-03-21 17:23

# 全局变量。
# ---------
storage_path=/home/goufeng

function ubuntu2204_cdrom_gcc() {

    ln -sf /usr/bin/gcc-11 /usr/bin/gcc
        
    echo "[ SH Succ ] \"gcc\" Original Soft Link Created"

    ln -sf /usr/bin/g++-11 /usr/bin/g++
        
    echo "[ SH Succ ] \"g++\" Original Soft Link Created"

    ln -sf /etc/alternatives/c++ /usr/bin/c++
        
    echo "[ SH Succ ] \"c++\" Original Soft Link Created"
}

function change_gcc630() {
        
    ln -sf /usr/local/gcc630/bin/gcc /usr/bin/gcc
        
    echo "[ SH Succ ] \"gcc\" Version 6.3.0 Soft Link Created"

    ln -sf /usr/local/gcc630/bin/g++ /usr/bin/g++
        
    echo "[ SH Succ ] \"g++\" Version 6.3.0 Soft Link Created"

    ln -sf /usr/local/gcc630/bin/c++ /usr/bin/c++
        
    echo "[ SH Succ ] \"c++\" Version 6.3.0 Soft Link Created"

    ln -sf /usr/local/gcc630/lib64/libstdc++.so.6.0.22 /usr/lib64/libstdc++.so.6
        
    echo "[ SH Succ ] \"libstdc++.so.6\" Version 6.3.0 Soft Link Created"
}

function main() {

    #ubuntu2204_cdrom_gcc
    change_gcc630
}

main