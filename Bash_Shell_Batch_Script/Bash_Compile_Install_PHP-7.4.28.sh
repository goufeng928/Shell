#! /bin/bash
# Create By GF 2023-04-03 16:47

# Need File: zlib-1.2.13.tar.gz
# Need File: bzip2-1.0.6.tar.gz
# Need File: libxml2-2.9.1.tar.gz
# Need File: libxslt-1.1.28.tar.gz
# Need File: byacc-20230219.tar.gz
# Need File: krb5-1.20.1.tar.gz
# Need File: openssl-1.1.1g.tar.gz
# Need File: sqlite-autoconf-3410200.tar.gz
# Need File: curl-7.71.1.tar.gz
# Need File: onig-6.9.5-rev1.tar.gz
# Need File: php-7.4.28.tar.gz

STORAGE=/home/goufeng

# 部署zlib-1.2.13函数。
# --------------------
function deploy_zlib_1_2_13() {

    local NowDate=`date +%Y-%m-%d`
    # --------------------------------------------------
    local SH=/usr/local/zlib-1.2.13/deploy-zlib-1.2.13.sh
    # --------------------------------------------------
    if [[ ! -f "$SH" ]]; then touch $SH; fi
    # --------------------------------------------------
    cat /dev/null > $SH
    # --------------------------------------------------
    echo "#! /bin/bash" >> $SH
    echo "# Create By GF $NowDate" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Headers File ------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/include\" ]]; then" >> $SH
    echo "    mkdir /usr/local/include; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/include/zconf.h /usr/local/include/" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/include/zlib.h  /usr/local/include/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Library File ------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/lib\" ]]; then" >> $SH
    echo "    mkdir /usr/local/lib; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/lib/libz.a         /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/lib/libz.so        /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/lib/libz.so.1      /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/lib/libz.so.1.2.13 /usr/local/lib/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Pkg Config --------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/lib/pkgconfig\" ]]; then" >> $SH
    echo "    mkdir /usr/local/lib/pkgconfig; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/zlib-1.2.13/lib/pkgconfig/zlib.pc /usr/local/lib/pkgconfig/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "exit 0" >> $SH
    # --------------------------------------------------
    chmod +x $SH && $SH
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

# 部署bzip2-1.0.6函数。
# --------------------
function deploy_bzip2_1_0_6() {

    local NowDate=`date +%Y-%m-%d`
    # --------------------------------------------------
    local SH=/usr/local/bzip2-1.0.6/deploy-bzip2-1.0.6.sh
    # --------------------------------------------------
    if [[ ! -f "$SH" ]]; then touch $SH; fi
    # --------------------------------------------------
    cat /dev/null > $SH
    # --------------------------------------------------
    echo "#! /bin/bash" >> $SH
    echo "# Create By GF $NowDate" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Binary File -------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/bin\" ]]; then" >> $SH
    echo "    mkdir /usr/local/bin; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bunzip2      /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzcat        /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzcmp        /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzdiff       /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzegrep      /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzfgrep      /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzgrep       /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzip2        /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzip2recover /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzless       /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/bin/bzmore       /usr/local/bin/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Headers File ------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/include\" ]]; then" >> $SH
    echo "    mkdir /usr/local/include; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/include/bzlib.h /usr/local/include/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Library File ------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/lib\" ]]; then" >> $SH
    echo "    mkdir /usr/local/lib; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/bzip2-1.0.6/lib/libbz2.a /usr/local/lib/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "exit 0" >> $SH
    # --------------------------------------------------
    chmod +x $SH && $SH
    # --------------------------------------------------
    return 0
}

# 编译安装bzip2-1.0.6函数。
# ------------------------
function compile_install_bzip2_1_0_6() {

    if [[ ! -d "/usr/local/bzip2-1.0.6" ]]; then
    
        local verify=NULL
    
        read -p "Compile and Install \"bzip2-1.0.6\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/bzip2-1.0.6.tar.gz        && \
                                                       \
        cd $STORAGE/bzip2-1.0.6                     && \
                                                       \
        make                                        && \
                                                       \
        make install PREFIX=/usr/local/bzip2-1.0.6  && \
                                                       \
        deploy_bzip2_1_0_6                          && \
                                                       \
        cd $STORAGE                                 && \
                                                       \
        rm -rf $STORAGE/bzip2-1.0.6                 && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/bzip2-1.0.6\" Already Exists."

        return 0        
    fi
}

# 部署libxml2-2.9.1函数。
# ----------------------
function deploy_libxml2_2_9_1() {

    local NowDate=`date +%Y-%m-%d`
    # --------------------------------------------------
    local SH=/usr/local/libxml2-2.9.1/deploy-libxml2-2.9.1.sh
    # --------------------------------------------------
    if [[ ! -f "$SH" ]]; then touch $SH; fi
    # --------------------------------------------------
    cat /dev/null > $SH
    # --------------------------------------------------
    echo "#! /bin/bash" >> $SH
    echo "# Create By GF $NowDate" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Binary File -------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/bin\" ]]; then" >> $SH
    echo "    mkdir /usr/local/bin; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/bin/xml2-config /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/bin/xmlcatalog  /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/bin/xmllint     /usr/local/bin/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Headers File ------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/include\" ]]; then" >> $SH
    echo "    mkdir /usr/local/include; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/include/libxml\" ]]; then" >> $SH
    echo "    mkdir -p /usr/local/include/libxml; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/include/libxml2/libxml\" ]]; then" >> $SH
    echo "    mkdir -p /usr/local/include/libxml2/libxml; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/c14n.h             /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/catalog.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/chvalid.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/debugXML.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/dict.h             /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/DOCBparser.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/encoding.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/entities.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/globals.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/hash.h             /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/HTMLparser.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/HTMLtree.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/list.h             /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/nanoftp.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/nanohttp.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/parser.h           /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/parserInternals.h  /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/pattern.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/relaxng.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/SAX2.h             /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/SAX.h              /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/schemasInternals.h /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/schematron.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/threads.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/tree.h             /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/uri.h              /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/valid.h            /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xinclude.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xlink.h            /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlautomata.h      /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlerror.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlexports.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlIO.h            /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlmemory.h        /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlmodule.h        /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlreader.h        /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlregexp.h        /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlsave.h          /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlschemas.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlschemastypes.h  /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlstring.h        /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlunicode.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlversion.h       /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xmlwriter.h        /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xpath.h            /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xpathInternals.h   /usr/local/include/libxml2/libxml/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/xpointer.h         /usr/local/include/libxml2/libxml/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/include/libxml2/libxml/* /usr/local/include/libxml/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Library File ------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/lib\" ]]; then" >> $SH
    echo "    mkdir /usr/local/lib; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/libxml2.a        /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/libxml2.la       /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/libxml2.so       /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/libxml2.so.2     /usr/local/lib/" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/libxml2.so.2.9.1 /usr/local/lib/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/xml2Conf.sh      /usr/local/lib/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Pkg Config --------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/lib/pkgconfig\" ]]; then" >> $SH
    echo "    mkdir /usr/local/lib/pkgconfig; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/libxml2-2.9.1/lib/pkgconfig/pkgconfig/libxml-2.0.pc /usr/local/lib/pkgconfig/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "exit 0" >> $SH
    # --------------------------------------------------
    chmod +x $SH && $SH
    # --------------------------------------------------
    return 0
}

# 编译安装libxml2-2.9.1函数。
# --------------------------
function compile_install_libxml2_2_9_1() {

    if [[ ! -d "/usr/local/libxml2-2.9.1" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"libxml2-2.9.1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/libxml2-2.9.1.tar.gz        && \
                                                         \
        cd $STORAGE/libxml2-2.9.1                     && \
                                                         \
        ./configure --prefix=/usr/local/libxml2-2.9.1 && \
                                                         \
        make && make install                          && \
                                                         \
        deploy_libxml2_2_9_1                          && \
                                                         \
        cd $STORAGE                                   && \
                                                         \
        rm -rf $STORAGE/libxml2-2.9.1                 && \
                                                         \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/libxml2-2.9.1\" Already Exists."

        return 0        
    fi
}

# 编译安装libxslt-1.1.28函数。
# ---------------------------
function compile_install_libxslt_1_1_28() {

    if [[ ! -d "/usr/local/libxslt-1.1.28" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"libxslt-1.1.28\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/libxslt-1.1.28.tar.gz        && \
                                                          \
        cd $STORAGE/libxslt-1.1.28                     && \
                                                          \
        ./configure --prefix=/usr/local/libxslt-1.1.28 && \
                                                          \
        make && make install                           && \
                                                          \
        cd $STORAGE                                    && \
                                                          \
        rm -rf $STORAGE/libxslt-1.1.28                 && \
                                                          \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/libxslt-1.1.28\" Already Exists."

        return 0        
    fi
}

# 部署byacc-20230219函数。
# -----------------------
function deploy_byacc_20230219() {

    local NowDate=`date +%Y-%m-%d`
    # --------------------------------------------------
    local SH=/usr/local/byacc-20230219/deploy-byacc-20230219.sh
    # --------------------------------------------------
    if [[ ! -f "$SH" ]]; then touch $SH; fi
    # --------------------------------------------------
    echo "#! /bin/bash" > $SH
    echo "# Create By GF $NowDate" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Binary File -------------------" >> $SH
    echo "if [[ ! -d \"/usr/local/bin\" ]]; then" >> $SH
    echo "    mkdir /usr/local/bin; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/byacc-20230219/bin/yacc /usr/local/bin/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "exit 0" >> $SH
    # --------------------------------------------------
    chmod +x $SH && $SH
    # --------------------------------------------------
    return 0
}

# 编译安装byacc-20230219函数。
# ---------------------------
function compile_install_byacc_20230219() {

    if [[ ! -d "/usr/local/byacc-20230219" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"byacc-20230219\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/byacc-20230219.tar.gz        && \
                                                          \
        cd $STORAGE/byacc-20230219                     && \
                                                          \
        ./configure --prefix=/usr/local/byacc-20230219 && \
                                                          \
        make && make install                           && \
                                                          \
        deploy_byacc_20230219                          && \
                                                          \
        cd $STORAGE                                    && \
                                                          \
        rm -rf $STORAGE/byacc-20230219                 && \
                                                          \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/byacc-20230219\" Already Exists."

        return 0        
    fi
}

# 编译安装krb5-1.20.1函数。
# ------------------------
function compile_install_krb5_1_20_1() {

    if [[ ! -d "/usr/local/krb5-1.20.1" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"krb5-1.20.1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/krb5-1.20.1.tar.gz        && \
                                                       \
        cd $STORAGE/krb5-1.20.1/src                 && \
                                                       \
        ./configure --prefix=/usr/local/krb5-1.20.1 && \
                                                       \
        make && make install                        && \
                                                       \
        cd $STORAGE                                 && \
                                                       \
        rm -rf $STORAGE/krb5-1.20.1                 && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/krb5-1.20.1\" Already Exists."

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

# 编译安装SQLite-3.41.2函数。
# --------------------------
function compile_install_sqlite_3_41_2() {

    if [[ ! -d "/usr/local/SQLite-3.41.2" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"SQLite-3.41.2\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/sqlite-autoconf-3410200.tar.gz && \
                                                            \
        cd $STORAGE/sqlite-autoconf-3410200              && \
                                                            \
        ./configure --prefix=/usr/local/SQLite-3.41.2    && \
                                                            \
        make && make install                             && \
                                                            \
        cd $STORAGE                                      && \
                                                            \
        rm -rf $STORAGE/sqlite-autoconf-3410200          && \
                                                            \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/SQLite-3.41.2\" Already Exists."

        return 0        
    fi
}

# 编译安装curl-7.71.1函数。
# ------------------------
function compile_install_curl_7_71_1() {

    if [[ ! -d "/usr/local/curl-7.71.1" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"curl-7.71.1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/curl-7.71.1.tar.gz        && \
                                                       \
        cd $STORAGE/curl-7.71.1                     && \
                                                       \
        ./configure --prefix=/usr/local/curl-7.71.1 && \
                                                       \
        make && make install                        && \
                                                       \
        cd $STORAGE                                 && \
                                                       \
        rm -rf $STORAGE/curl-7.71.1                 && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/curl-7.71.1\" Already Exists."

        return 0        
    fi
}

# 编译安装onig-6.9.5-rev1函数。
# ----------------------------
function compile_install_onig_6_9_5_rev1() {

    if [[ ! -d "/usr/local/onig-6.9.5-rev1" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ]Compile and Install \"onig-6.9.5-rev1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/onig-6.9.5-rev1.tar.gz        && \
                                                           \
        cd $STORAGE/onig-6.9.5                          && \
                                                           \
        ./configure --prefix=/usr/local/onig-6.9.5-rev1 && \
                                                           \
        make && make install                            && \
                                                           \
        cd $STORAGE                                     && \
                                                           \
        rm -rf $STORAGE/onig-6.9.5                      && \
                                                           \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/onig-6.9.5-rev1\" Already Exists."

        return 0        
    fi
}

function error_handle_php_7_4_28() {

    # ---------------- Error Handle 1 ------------------
    # collect2: error: ld returned 1 exit status
    # undefined reference to `xmlFreeParserCtxt' | Handle : EXTRA_LIBS = -lxml2
    # undefined reference to `EVP_PKEY_free' | Handle : EXTRA_LIBS = -lssl
    # ...libcrypto.so.1.1: error adding symbols: DSO missing from command line | Handle : EXTRA_LIBS = -lcrypto
    # undefined reference to `xsltSaveResultToString' | Handle : EXTRA_LIBS = -lxslt
    # undefined reference to `sqlite3_reset' | Handle : EXTRA_LIBS = -lsqlite3
    # undefined reference to `curl_share_strerror' | Handle : EXTRA_LIBS = -lcurl
    # undefined reference to `OnigEncodingASCII' | Handle : EXTRA_LIBS = -lonig
    # undefined reference to `__dn_expand' | Handle : EXTRA_LIBS = -lresolv | From Glibc-2.17
    # --------------------------------------------------
    cd $STORAGE/php-7.4.28 && \
    sed -i 's#^EXTRA_LIBS = .*#EXTRA_LIBS = -L/usr/local/libxslt-1.1.28/lib -L/usr/local/SQLite-3.41.2/lib/ -L/usr/local/curl-7.71.1/lib/ -L/usr/local/onig-6.9.5-rev1/lib/ -L/usr/local/openssl-1.1.1g/lib -lrt -lbz2 -lrt -lm -lxml2 -lxslt -lsqlite3 -lcurl -lonig -lresolv -lssl -lcrypt -lcrypto#' ./Makefile
    # --------------------------------------------------
    return 0
}

function create_user_for_php_7_4_28() {

    # --------------------------------------------------
    # ------------- Create User and Group --------------
    local User_Exists=$(cat /etc/passwd | grep -o php)
    if [[ -z "$User_Exists" ]]; then
        groupadd php
        useradd php -g php -s /sbin/nologin -M; fi
    # --------------------------------------------------
    return 0
}

function configure_php_7_4_28() {

    # --------------------------------------------------
    # ---------------- Configure File ------------------
    cp $STORAGE/php-7.4.28/php.ini-production               /usr/local/php-7.4.28/etc/php.ini
    cp /usr/local/php-7.4.28/etc/php-fpm.conf.default       /usr/local/php-7.4.28/etc/php-fpm.conf
    cp /usr/local/php-7.4.28/etc/php-fpm.d/www.conf.default /usr/local/php-7.4.28/etc/php-fpm.d/www.conf
    # --------------------------------------------------
    sed -i 's#^;pid = run/php-fpm.pid#pid = /var/run/php-fpm.pid#' /usr/local/php-7.4.28/etc/php-fpm.conf
    sed -i 's#^;error_log = log/php-fpm.log#error_log = /var/log/php-fpm.log#' /usr/local/php-7.4.28/etc/php-fpm.conf
    # --------------------------------------------------
    # -------------- init.d Boot Options ---------------
    cp $STORAGE/php-7.4.28/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
    chmod +x /etc/init.d/php-fpm
    # --------------------------------------------------
    # ------------ Systemctl Boot Options --------------
    cp $STORAGE/php-7.4.28/sapi/fpm/php-fpm.service /lib/systemd/system/php-fpm.service
    # --------------------------------------------------
    return 0
}

function deploy_php_7_4_28() {

    local NowDate=`date +%Y-%m-%d`
    # --------------------------------------------------
    local SH=/usr/local/php-7.4.28/deploy-php-7.4.28.sh
    # --------------------------------------------------
    if [[ ! -f "$SH" ]]; then touch $SH; fi
    # --------------------------------------------------
    cat /dev/null > $SH
    # --------------------------------------------------
    echo "#! /bin/bash" >> $SH
    echo "# Create By GF $NowDate" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "# ------------------ Binary File -------------------" >> $SH
    echo "if [[ ! -d "/usr/local/bin" ]]; then" >> $SH
    echo "    mkdir /usr/local/bin; fi" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/pear       /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/peardev    /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/pecl       /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/phar       /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/phar.phar  /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/php        /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/php-cgi    /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/php-config /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/phpdbg     /usr/local/bin/" >> $SH
    echo "ln -sf /usr/local/php-7.4.28/bin/phpize     /usr/local/bin/" >> $SH
    echo "# --------------------------------------------------" >> $SH
    echo "exit 0" >> $SH
    # --------------------------------------------------
    chmod +x $SH && $SH
    # --------------------------------------------------
    return 0
}

function compile_install_php_7_4_28() {
    
    if [[ ! -d "/usr/local/php-7.4.28" ]]; then
    
        local verify=NULL
    
        read -p "[ SH Opt ] Compile and Install \"php-7.4.28\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/php-7.4.28.tar.gz                       && \
                                                                      \
        cd $STORAGE/php-7.4.28                                     && \
                                                                      \
        create_user_for_php_7_4_28                                 && \
                                                                      \
        ZLIB_CFLAGS=-I/usr/local/zlib-1.2.13/include                  \
        ZLIB_LIBS=-L/usr/local/zlib-1.2.13/lib                        \
        KERBEROS_CFLAGS=-I/usr/local/krb5-1.20.1/include              \
        KERBEROS_LIBS=-L/usr/local/krb5-1.20.1/lib                    \
        OPENSSL_CFLAGS=-I/usr/local/openssl-1.1.1g/include            \
        OPENSSL_LIBS=-L/usr/local/openssl-1.1.1g/lib                  \
        SQLITE_CFLAGS=-I/usr/local/SQLite-3.41.2/include              \
        SQLITE_LIBS=-L/usr/local/SQLite-3.41.2/lib                    \
        CURL_CFLAGS=-I/usr/local/curl-7.71.1/include                  \
        CURL_LIBS=-L/usr/local/curl-7.71.1/lib                        \
        ONIG_CFLAGS=-I/usr/local/onig-6.9.5-rev1/include              \
        ONIG_LIBS=-L/usr/local/onig-6.9.5-rev1/lib                    \
        XSL_CFLAGS=-I/usr/local/libxslt-1.1.28/include                \
        XSL_LIBS=-L/usr/local/libxslt-1.1.28/lib                      \
        LIBXML_CFLAGS=-I/usr/local/libxml2-2.9.1/include/libxml2      \
        LIBXML_LIBS=-L/usr/local/libxml2-2.9.1/lib                    \
                                                                      \
        ./configure --prefix=/usr/local/php-7.4.28                    \
                    --with-config-file-path=/usr/local/php-7.4.28/etc \
                    --with-fpm-user=php                               \
                    --with-fpm-group=php                              \
                    --with-curl                                       \
                    --with-freetype-dir                               \
                    --with-gd                                         \
                    --with-gettext                                    \
                    --with-iconv-dir                                  \
                    --with-kerberos                                   \
                    --with-libdir=lib64                               \
                    --with-libxml-dir                                 \
                    --with-mysqli                                     \
                    --with-openssl                                    \
                    --with-pcre-regex                                 \
                    --with-pdo-mysql                                  \
                    --with-pdo-sqlite                                 \
                    --with-pear                                       \
                    --with-png-dir                                    \
                    --with-jpeg-dir                                   \
                    --with-xmlrpc                                     \
                    --with-xsl                                        \
                    --with-zlib                                       \
                    --with-bz2                                        \
                    --with-mhash                                      \
                    --enable-fpm                                      \
                    --enable-bcmath                                   \
                    --enable-libxml                                   \
                    --enable-inline-optimization                      \
                    --enable-mbregex                                  \
                    --enable-mbstring                                 \
                    --enable-opcache                                  \
                    --enable-pcntl                                    \
                    --enable-shmop                                    \
                    --enable-soap                                     \
                    --enable-sockets                                  \
                    --enable-sysvsem                                  \
                    --enable-sysvshm                                  \
                    --enable-xml                                      \
                    --enable-zip                                      \
                    --enable-fpm                                   && \
                                                                      \
        error_handle_php_7_4_28                                    && \
                                                                      \
        make && make install                                       && \
                                                                      \
        configure_php_7_4_28                                       && \
                                                                      \
        deploy_php_7_4_28                                          && \
                                                                      \
        cd $STORAGE                                                && \
	                                                                  \
        rm -rf $STORAGE/php-7.4.28                                 && \
                                                                      \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/php-7.4.28\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_zlib_1_2_13
    compile_install_bzip2_1_0_6
    compile_install_libxml2_2_9_1
    compile_install_libxslt_1_1_28
    compile_install_byacc_20230219
    compile_install_krb5_1_20_1
    compile_install_openssl_1_1_1g
    compile_install_sqlite_3_41_2
    compile_install_curl_7_71_1
    compile_install_onig_6_9_5_rev1
    compile_install_php_7_4_28
}

main