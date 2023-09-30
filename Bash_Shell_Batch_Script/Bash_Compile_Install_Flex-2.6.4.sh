#! /bin/bash
# Create By GF 2023-03-24 23:39

# Need File: 0003-c-stack-stop-using-SIGSTKSZ.patch

STORAGE=/home/goufeng

function error_handle_1_m4_1_4_18() {

    # --- Error Handle 1 ---
    # c-stack.c:55:26: error: missing binary operator before token "("
    
    patch -p1 < $STORAGE/0003-c-stack-stop-using-SIGSTKSZ.patch && \
                                                                   \
    return 0
}

function error_handle_2_m4_1_4_18() {

    # --- Error Handle 2 ---
    # -freadahead.c: In function ‘freadahead’

    cd $STORAGE/m4-1.4.18                                    && \
    sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' ./lib/*.c        && \
    echo "#define _IO_IN_BACKUP 0x100" >> ./lib/stdio-impl.h && \
                                                                \
    return 0
}

function compile_install_1_m4_1_4_18() {

    if [[ ! -f "/usr/local/bin/m4" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"m4-1.4.18\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/m4-1.4.18.tar.gz && \
	                                           \
        cd $STORAGE/m4-1.4.18               && \
	                                           \
        error_handle_1_m4_1_4_18            && \
                                               \
	    error_handle_2_m4_1_4_18            && \
                                               \
	    ./configure                         && \
	                                           \
        make && make install                && \
	                                           \
        cd $STORAGE                         && \
                                               \
        rm -rf $STORAGE/m4-1.4.18           && \
                                               \
        return 0
    else
    
        echo "[ SH Note ] Bin: \"/usr/local/bin/m4\" Already Exists."
        
        return 0
    fi
}

function compile_install_2_autoconf_2_69() {

    if [[ ! -f "/usr/local/bin/autoconf" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"autoconf-2.69\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf autoconf-2.69.tar.gz && \
	                                      \
        cd $STORAGE/autoconf-2.69      && \
	                                      \
        ./configure                    && \
	                                      \
        make && make install           && \
	                                      \
        cd $STORAGE                    && \
                                          \
        rm -rf $STORAGE/autoconf-2.69  && \
                                          \
        return 0
    else
    
        echo "[ SH Note ] Bin: \"/usr/local/bin/autoconf\" Already Exists."
        
        return 0
    fi
}

function compile_install_3_automake_1_15() {

    if [[ ! -f "/usr/local/bin/automake" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"automake-1.15\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf automake-1.15.tar.gz && \
	                                      \
        cd $STORAGE/automake-1.15      && \
	                                      \
        ./configure                    && \
	                                      \
        make && make install           && \
                                          \
        cd $STORAGE                    && \
	                                      \
        rm -rf $STORAGE/automake-1.15  && \
                                          \
        return 0
    else
    
        echo "[ SH Note ] Bin: \"/usr/local/bin/automake\" Already Exists."
        
        return 0
    fi
}

function compile_install_4_libtool_2_4_6() {

    if [[ ! -f "/usr/local/bin/libtool" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"libtool-2.4.6\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf libtool-2.4.6.tar.gz && \
	                                      \
        cd $STORAGE/libtool-2.4.6      && \
	                                      \
        ./configure                    && \
	                                      \
        make && make install           && \
                                          \
        cd $STORAGE                    && \
	                                      \
        rm -rf $STORAGE/libtool-2.4.6  && \
                                          \
        return 0
    else
    
        echo "[ SH Note ] Bin: \"/usr/local/bin/libtool\" Already Exists."
        
        return 0
    fi
}

function compile_install_5_gettext_0_19_7() {

    if [[ ! -f "/usr/local/bin/gettext" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"gettext-0.19.7\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf gettext-0.19.7.tar.gz && \
	                                       \
        cd $STORAGE/gettext-0.19.7      && \
	                                       \
        ./configure                     && \
	                                       \
        make && make install            && \
                                           \
        cd $STORAGE                     && \
                                           \
        rm -rf $STORAGE/gettext-0.19.7  && \
                                           \
        return 0
	    
    else
    
        echo "[ SH Note ] Bin: \"/usr/local/bin/gettext\" Already Exists."
        
        return 0
    fi
}

function compile_install_6_flex_2_6_4() {
    
    if [[ ! -f "/usr/local/bin/flex" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"flex-2.6.4\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf flex-2.6.4.tar.gz      && \
                                            \
        cd $STORAGE/flex-2.6.4           && \
                                            \
        ./autogen.sh                     && \
                                            \
        ./configure CFLAGS=-D_GNU_SOURCE && \
                                            \
        make && make install             && \
                                            \
        cd $STORAGE                      && \
	                                        \
        rm -rf $STORAGE/flex-2.6.4       && \
                                            \
        return 0
    else
    
        echo "[ SH Note ] Bin: \"/usr/local/bin/flex\" Already Exists."
        
        return 0
    fi
    
    # --- Cross Compile Item ---
    #export PATH=/opt/arm-4.8.1/bin:$PATH  && \
    #./configure --host=arm-none-linux-gnueabi
    
    # --- Ubuntu Compile Item ---
    #./configure CFLAGS=-D_GNU_SOURCE
}

function main() {

    compile_install_1_m4_1_4_18
    compile_install_2_autoconf_2_69
    compile_install_3_automake_1_15
    compile_install_4_libtool_2_4_6
    compile_install_5_gettext_0_19_7
    compile_install_6_flex_2_6_4
}

main