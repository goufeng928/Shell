#! /bin/bash
# Create By GF 2023-03-21 17:23

# 全局变量。
# ---------
storage_path=/home/goufeng

bin_m4=/usr/local/bin/m4

# 编译安装m4函数。
# --------------
function compile_install_m4() {

    if [[ ! -f "$bin_m4" ]]; then
        
        tar -xzvf $storage_path/m4-1.4.13.tar.gz

        if [[ $? -eq 0 ]]; then cd $storage_path/m4-1.4.13; fi

        if [[ $? -eq 0 ]]; then
            sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' ./lib/*.c
            echo "#define _IO_IN_BACKUP 0x100" >> ./lib/stdio-impl.h; fi
        
        if [[ $? -eq 0 ]]; then
            ./configure --prefix=/usr/local; fi
        
        if [[ $? -eq 0 ]]; then make; fi
        
        if [[ $? -eq 0 ]]; then make install; else exit 1; fi

        if [[ $? -eq 0 ]]; then rm -rf $storage_path/m4-1.4.13; fi
    else
    
        echo "[ SH ] Bin: \"m4\" Already Exists, In $bin_m4"
    fi
}

# 编译安装gmp-6.1.2函数。
# ---------------------
function compile_install_gmp612() {

    if [[ ! -d "/usr/local/gmp612" ]]; then
        
        tar -xvJf $storage_path/gmp-6.1.2.tar.xz

        if [[ $? -eq 0 ]]; then cd $storage_path/gmp-6.1.2; fi
        
        if [[ $? -eq 0 ]]; then
            ./configure --prefix=/usr/local/gmp612; fi
        
        if [[ $? -eq 0 ]]; then make; fi
        
        if [[ $? -eq 0 ]]; then make check; else exit 1; fi
        
        if [[ $? -eq 0 ]]; then make install; fi
        
        if [[ $? -eq 0 ]]; then
            echo "export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/gmp612/include" >> /etc/profile
            echo "export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/gmp612/lib" >> /etc/profile
            echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/gmp612/lib" >> /etc/profile
            source /etc/profile; fi

        if [[ $? -eq 0 ]]; then rm -rf $storage_path/gmp-6.1.2; fi
        
    else
    
        echo "[ SH ] Path: \"gmp-6.1.2\" Already Exists, In /usr/local/gmp612"
    fi
}

# 编译安装mpfr-4.0.2函数。
# ----------------------
function compile_install_mpfr402() {

    if [[ ! -d "/usr/local/mpfr402" ]]; then
        
        tar -xzvf $storage_path/mpfr-4.0.2.tar.gz

        if [[ $? -eq 0 ]]; then cd $storage_path/mpfr-4.0.2; fi
        
        if [[ -f "$storage_path/mpfr-4.0.2/src/mpfr.h" ]]; then
            sed -i "31i\#define mpfr_sub_one_ulp(x,r) (mpfr_sgn (x) > 0 ? mpfr_nextbelow (x) : mpfr_nextabove (x))" ./src/mpfr.h
            sed -i "31i\#define mpfr_add_one_ulp(x,r) (mpfr_sgn (x) > 0 ? mpfr_nextabove (x) : mpfr_nextbelow (x))" ./src/mpfr.h; fi
        
        if [[ $? -eq 0 ]]; then
            ./configure --prefix=/usr/local/mpfr402 \
                        --with-gmp=/usr/local/gmp612; fi
        
        if [[ $? -eq 0 ]]; then make; fi
        
        if [[ $? -eq 0 ]]; then make check; else exit 1; fi
        
        if [[ $? -eq 0 ]]; then make install; fi
        
        if [[ $? -eq 0 ]]; then
            echo "export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/mpfr402/include" >> /etc/profile
            echo "export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/mpfr402/lib" >> /etc/profile
            echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mpfr402/lib" >> /etc/profile
            source /etc/profile; fi

        if [[ $? -eq 0 ]]; then rm -rf $storage_path/mpfr-4.0.2; fi
        
    else
    
        echo "[ SH ] Path: \"mpfr-4.0.2\" Already Exists, In /usr/local/mpfr402"
    fi
}

# 编译安装mpc-1.0.3函数。
# ---------------------
function compile_install_mpc103() {

    if [[ ! -d "/usr/local/mpc103" ]]; then
        
        tar -zxvf $storage_path/mpc-1.0.3.tar.gz

        if [[ $? -eq 0 ]]; then cd $storage_path/mpc-1.0.3; fi
        
        if [[ $? -eq 0 ]]; then
            sed -i 's/mpfr_fmma/mpfr_fmma_mul/g' ./src/mul.c; fi
        
        if [[ $? -eq 0 ]]; then
            ./configure --prefix=/usr/local/mpc103 \
                        --with-gmp=/usr/local/gmp612 \
                        --with-mpfr=/usr/local/mpfr402; fi
        
        if [[ $? -eq 0 ]]; then make; fi
        
        if [[ $? -eq 0 ]]; then make check; else exit 1; fi
        
        if [[ $? -eq 0 ]]; then make install; fi
        
        if [[ $? -eq 0 ]]; then
            echo "export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/mpc103/include" >> /etc/profile
            echo "export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/mpc103/lib" >> /etc/profile
            echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mpc103/lib" >> /etc/profile
            source /etc/profile; fi

        if [[ $? -eq 0 ]]; then rm -rf $storage_path/mpc-1.0.3; fi
        
    else
    
        echo "[ SH ] Path: \"mpc-1.0.3\" Already Exists, In /usr/local/mpc103"
    fi
}

# 编译安装GCC-6.3.0函数。
# ---------------------
function compile_install_gcc630() {

    if [[ ! -d "/usr/local/gcc630" ]]; then
        
        tar -zxvf $storage_path/gcc-6.3.0.tar.gz

        if [[ $? -eq 0 ]]; then cd $storage_path/gcc-6.3.0; fi
        
        if [[ $? -eq 0 ]]; then
        ./configure --prefix=/usr/local/gcc630 \
                    --enable-threads=posix \
                    --enable-bootstrap \
                    --disable-multilib \
                    --with-gmp=/usr/local/gmp612 \
                    --with-mpfr=/usr/local/mpfr402 \
                    --with-mpc=/usr/local/mpc103; fi
                    
        
        # Debugging Make.
        #if [[ $? -eq 0 ]]; then make; fi
        
        # Formal Make && Make Install.
        if [[ $? -eq 0 ]]; then make && make install; fi
       
        # Error Handle: 
        # ./md-unwind-support.h:65:47: 错误： dereferencing pointer to incomplete type ‘struct ucontext’
        # sc = (struct sigcontext *) (void *) &uc_->uc_mcontext;
        #
        # md-unwind-support.h文件在build/x86_64-unknown-linux-gnu/libgcc下
        # 找到出错的65行，往上四行，也就是61行的位置，是*uc_的定义
        # 将该行改为：struct ucontext_t *uc_ = context->cfa;
        
        if [[ $? -eq 0 ]]; then rm -rf $storage_path/gcc-6.3.0; fi
    else
    
        echo "[ SH ] Path: \"gcc-6.3.0\" Already Exists, In /usr/local/gcc630"
    fi
}

function main() {
    
    compile_install_m4
    if [[ $? -eq 0 ]]; then compile_install_gmp612; fi   
    if [[ $? -eq 0 ]]; then compile_install_mpfr402; fi
    if [[ $? -eq 0 ]]; then compile_install_mpc103; fi
    if [[ $? -eq 0 ]]; then compile_install_gcc630; fi
    
    exit 0
}

main
