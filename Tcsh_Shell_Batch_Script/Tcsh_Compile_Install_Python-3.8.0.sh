#! /bin/tcsh
# Create By GF 2023-05-22 20:33

# Need File: zlib-1.2.13.tar.gz
# Need File: perl-5.26.1.tar.gz 
# Need File: openssl-1.1.1g.tar.gz
# Need File: Python-3.8.0.tgz

# ====================================================================================================

set TARGET_SYSTEM = "FreeBSD" # Optional: FreeBSD / Linux

set TARGET_C_COMPILER = "Clang" # Optional: Clang / GCC

set STORAGE = /home/goufeng

# ####################################################################################################
# ################################### Compile Install zlib-1.2.13 ####################################
if ( ! -d "/usr/local/zlib-1.2.13" ) then
    # ==================================================
    echo "[ SH Opt ] Compile and Install ( zlib-1.2.13 )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar zxvf $STORAGE/zlib-1.2.13.tar.gz        && \
    cd $STORAGE/zlib-1.2.13                     && \
    ./configure --prefix=/usr/local/zlib-1.2.13 && \
    make                                        && \
    make install                                && \
	set Deploy_zlib_1_2_13 = 1                  && \
    set Remove_zlib_1_2_13 = 1
    # ==================================================
    if ( $? == 0 && $Deploy_zlib_1_2_13 == 1 ) then
        # ##################################################
        # ############### Deploy zlib-1.2.13 ###############
        # --------------------------------------------------
        # ------------------ Headers File ------------------
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # ..................................................
        ln -sf /usr/local/zlib-1.2.13/include/*.h    /usr/local/include/
        # --------------------------------------------------
        # ------------------ Library File ------------------
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # ..................................................
        ln -sf /usr/local/zlib-1.2.13/lib/*.a       /usr/local/lib/
        ln -sf /usr/local/zlib-1.2.13/lib/*.so      /usr/local/lib/
        ln -sf /usr/local/zlib-1.2.13/lib/*.so.*    /usr/local/lib/
        # --------------------------------------------------
        # ------------------ Pkg Config --------------------
        if ( ! -d "/usr/local/lib/pkgconfig" ) then
            mkdir /usr/local/lib/pkgconfig
        endif
        # ..................................................
        ln -sf /usr/local/zlib-1.2.13/lib/pkgconfig/*.pc    /usr/local/lib/pkgconfig/
        # --------------------------------------------------
        # ---------------- Reload ldconfig -----------------
        if ( $TARGET_SYSTEM == "FreeBSD" ) then
            /etc/rc.d/ldconfig restart
            # ..............................................
        else if ( $TARGET_SYSTEM == "Linux" ) then
            ldconfig
        endif
    endif
    # ==================================================
    if ( $? == 0 && $Remove_zlib_1_2_13 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/zlib-1.2.13
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/zlib-1.2.13 ) Already Exists."
endif

# ####################################################################################################
# ################################### Compile Install perl-5.26.1 ####################################
if ( ! -d "/usr/local/perl-5.26.1" ) then
    # ==================================================
    echo "[ SH Opt ] Compile and Install ( perl-5.26.1 )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar zxvf $STORAGE/perl-5.26.1.tar.gz                          && \
    cd $STORAGE/perl-5.26.1                                       && \
    ./Configure -des -Dprefix=/usr/local/perl-5.26.1 -Duseshrplib && \
    make                                                          && \
    make install                                                  && \
	set Deploy_perl_5_26_1 = 1                                    && \
    set Remove_perl_5_26_1 = 1
    # ==================================================
    if ( $? == 0 && $Deploy_perl_5_26_1 == 1 ) then
        # ##################################################
        # ############### Deploy perl-5.26.1 ###############
        # --------------------------------------------------
        # ------------------ Binary File -------------------
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # ..................................................
        ln -sf /usr/local/perl-5.26.1/bin/*    /usr/local/bin/
        # --------------------------------------------------
        # ------------------ Library File ------------------
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # ..................................................
        if ( $TARGET_SYSTEM == "FreeBSD" ) then
            ln -sf /usr/local/perl-5.26.1/lib/5.26.1/amd64-freebsd/CORE/libperl.so /usr/local/lib/
            # ..............................................
        else if ( $TARGET_SYSTEM == "Linux" ) then
            ln -sf /usr/local/perl-5.26.1/lib/5.26.1/x86_64-linux/CORE/libperl.so /usr/local/lib/
        endif
    endif
    # ==================================================
    if ( $? == 0 && $Remove_perl_5_26_1 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/perl-5.26.1
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/perl-5.26.1 ) Already Exists."
endif

# ####################################################################################################
# ################################## Compile Install openssl-1.1.1g ##################################
if ( ! -d "/usr/local/openssl-1.1.1g" ) then
    # ==================================================
    echo "[ SH Opt ]Compile and Install ( openssl-1.1.1g )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar zxvf $STORAGE/openssl-1.1.1g.tar.gz         && \
    cd $STORAGE/openssl-1.1.1g                      && \
    ./config --prefix=/usr/local/openssl-1.1.1g        \
             --openssldir=/usr/local/openssl-1.1.1g    \
             --shared zlib                          && \
    make                                            && \
    make install                                    && \
	set Deploy_openssl_1_1_1g = 1                   && \
    set Remove_openssl_1_1_1g = 1
    # ==================================================
    if ( $? == 0 && $Deploy_openssl_1_1_1g == 1 ) then
        # ##################################################
        # ############# Deploy openssl-1.1.1g ##############
        # --------------------------------------------------
        # ---------- Backup Self-Contained Binary ----------
        if ( -f "/usr/bin/openssl" && ! -f "/usr/bin/openssl.self.contained" ) then
            mv /usr/bin/openssl /usr/bin/openssl.self.contained
        endif
        # --------------------------------------------------
        # ------------------ Binary File -------------------
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # ..................................................
        ln -sf /usr/local/openssl-1.1.1g/bin/*    /usr/local/bin/
        # --------------------------------------------------
        # ------------------ Headers File ------------------
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # ..................................................
        if ( ! -d "/usr/local/include/openssl" ) then
            mkdir /usr/local/include/openssl
        endif
        # ..................................................
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/*.h    /usr/local/include/openssl/
        # --------------------------------------------------
        # ------------------ Library File ------------------
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # ..................................................
        if ( ! -d "/usr/local/lib/engines-1.1" ) then
            mkdir /usr/local/lib/engines-1.1
        endif
        # ..................................................
        ln -sf /usr/local/openssl-1.1.1g/lib/*.a       /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/*.so      /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/*.so.*    /usr/local/lib/
        # ..................................................
        ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/*.so    /usr/local/lib/engines-1.1/
        # --------------------------------------------------
        # ------------------ Pkg Config --------------------
        if ( ! -d "/usr/local/lib/pkgconfig" ) then
            mkdir /usr/local/lib/pkgconfig
        endif
        # ..................................................
        ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/*.pc    /usr/local/lib/pkgconfig/
        # --------------------------------------------------
        # ---------------- Reload ldconfig -----------------
        if ( $TARGET_SYSTEM == "FreeBSD" ) then
            /etc/rc.d/ldconfig restart
            # ..............................................
        else if ( $TARGET_SYSTEM == "Linux" ) then
            ldconfig
        endif
    endif
    # ==================================================
    if ( $? == 0 && $Remove_openssl_1_1_1g == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/openssl-1.1.1g
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/openssl-1.1.1g ) Already Exists."
endif

# ####################################################################################################
# ################################### Compile Install Python-3.8.0 ###################################
if ( ! -d "/usr/local/Python-3.8.0" ) then
    # ==================================================
    echo "[ SH Opt ] Compile and Install ( Python-3.8.0 )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar -zxvf $STORAGE/Python-3.8.0.tgz                  && \
    cd $STORAGE/Python-3.8.0
    # ##################################################
    # ########### Error Handle Python-3.8.0 ############
    if ( $TARGET_SYSTEM == "FreeBSD" ) then
        # FreeBSD: ModuleNotFoundError: No module named '_sysconfigdata__freebsd13_x86_64-unknown-freebsd13'.
        # FreeBSD: patch Out Python's Erroneous Multiarch Detection Using Sed.
        # ..............................................
        sed -i ".bak" "s/^MULTIARCH=.*/MULTIARCH=/" $STORAGE/Python-3.8.0/configure
        # ..............................................
    else if ( $TARGET_SYSTEM == "Linux" ) then
        set Skip = 1
    endif
    # ==================================================
    cd $STORAGE/Python-3.8.0                             && \
    ./configure --prefix=/usr/local/Python-3.8.0            \
                --with-openssl=/usr/local/openssl-1.1.1g && \
    make                                                 && \
    make install                                         && \
	set Deploy_Python_3_8_0 = 1                          && \
    set Remove_Python_3_8_0 = 1
    # ==================================================
    if ( $? == 0 && $Deploy_Python_3_8_0 == 1 ) then
        # ##################################################
        # ############## Deploy Python-3.8.0 ###############
        # --------------------------------------------------
        # ------------------ Binary File -------------------
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # ..................................................
        ln -sf /usr/local/Python-3.8.0/bin/python3 /usr/local/bin/python380
        ln -sf /usr/local/Python-3.8.0/bin/pip3    /usr/local/bin/pip380
    endif
    # ==================================================
    if ( $? == 0 && $Remove_Python_3_8_0 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/Python-3.8.0
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/Python-3.8.0 ) Already Exists."
endif

# ====================================================================================================
# EOF