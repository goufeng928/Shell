#! /bin/bash
# Create By GF 2023-04-02 11:55

STORAGE=/home/goufeng

function configure_expat_2_5_0() {
    
    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin; fi
    # --------------------------------------------------
    ln -s /usr/local/expat-2.5.0/bin/xmlwf /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include; fi
    # --------------------------------------------------
    ln -s /usr/local/expat-2.5.0/include/expat_config.h   /usr/local/include/
    ln -s /usr/local/expat-2.5.0/include/expat_external.h /usr/local/include/
    ln -s /usr/local/expat-2.5.0/include/expat.h          /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib; fi
    # --------------------------------------------------
    ln -s /usr/local/expat-2.5.0/lib/libexpat.a         /usr/local/lib/
    ln -s /usr/local/expat-2.5.0/lib/libexpat.la        /usr/local/lib/
    ln -s /usr/local/expat-2.5.0/lib/libexpat.so        /usr/local/lib/
    ln -s /usr/local/expat-2.5.0/lib/libexpat.so.1      /usr/local/lib/
    ln -s /usr/local/expat-2.5.0/lib/libexpat.so.1.8.10 /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig; fi
    # --------------------------------------------------
    ln -s /usr/local/expat-2.5.0/lib/pkgconfig/expat.pc /usr/local/lib/pkgconfig
<<DO_NOT_LINK_BECAUSE_ONLY_AS_DEPENDENT
    # --------------------------------------------------
    # ------------------ CMake File --------------------
    if [[ ! -d "/usr/local/lib/cmake" ]]; then
        mkdir /usr/local/lib/cmake; fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/lib/cmake/expat-2.5.0" ]]; then
        mkdir /usr/local/lib/cmake/expat-2.5.0; fi
    # --------------------------------------------------
    ln -s /usr/local/expat-2.5.0/lib/cmake/expat-2.5.0/expat.cmake                /usr/local/lib/cmake/expat-2.5.0/
    ln -s /usr/local/expat-2.5.0/lib/cmake/expat-2.5.0/expat-config.cmake         /usr/local/lib/cmake/expat-2.5.0/
    ln -s /usr/local/expat-2.5.0/lib/cmake/expat-2.5.0/expat-config-version.cmake /usr/local/lib/cmake/expat-2.5.0/
    ln -s /usr/local/expat-2.5.0/lib/cmake/expat-2.5.0/expat-noconfig.cmake       /usr/local/lib/cmake/expat-2.5.0/
DO_NOT_LINK_BECAUSE_ONLY_AS_DEPENDENT
    # --------------------------------------------------
    return 0
}

function compile_install_expat_2_5_0() {
    
    if [[ ! -d "/usr/local/expat-2.5.0" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"expat-2.5.0\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/expat-2.5.0.tar.gz       && \
                                                       \
        cd $STORAGE/expat-2.5.0                     && \
                                                       \
        ./configure --prefix=/usr/local/expat-2.5.0 && \
                                                       \
        make && make install                        && \
                                                       \
        configure_expat_2_5_0                       && \
                                                       \
        cd $STORAGE                                 && \
	                                                   \
        rm -rf $STORAGE/expat-2.5.0                 && \
                                                       \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/expat-2.5.0\" Already Exists."
        
        return 0
    fi
}

function compile_install_apr_1_7_0() {
    
    if [[ ! -d "/usr/local/apr-1.7.0" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"apr-1.7.0\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/apr-1.7.0.tar.gz       && \
                                                     \
        cd $STORAGE/apr-1.7.0                     && \
                                                     \
        ./configure --prefix=/usr/local/apr-1.7.0 && \
                                                     \
        make && make install                      && \
                                                     \
        cd $STORAGE                               && \
	                                                 \
        rm -rf $STORAGE/apr-1.7.0                 && \
                                                     \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/apr-1.7.0\" Already Exists."
        
        return 0
    fi
}

function compile_install_apr_util_1_6_1() {
    
    if [[ ! -d "/usr/local/apr-util-1.6.1" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"apr-util-1.6.1\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/apr-util-1.6.1.tar.gz       && \
                                                          \
        cd $STORAGE/apr-util-1.6.1                     && \
                                                          \
        ./configure --prefix=/usr/local/apr-util-1.6.1    \
                    --with-apr=/usr/local/apr-1.7.0    && \
                                                          \
        make && make install                           && \
                                                          \
        cd $STORAGE                                    && \
	                                                      \
        rm -rf $STORAGE/apr-util-1.6.1                 && \
                                                          \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/apr-util-1.6.1\" Already Exists."
        
        return 0
    fi
}

# 配置openssl-1.1.1g函数。
# -----------------------
function configure_openssl_1_1_1g() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin; fi
    # --------------------------------------------------
    ln -s /usr/local/openssl-1.1.1g/bin/c_rehash /usr/local/bin/
    ln -s /usr/local/openssl-1.1.1g/bin/openssl  /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib; fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/lib/engines-1.1" ]]; then
        mkdir /usr/local/lib/engines-1.1; fi
    # --------------------------------------------------
    ln -s /usr/local/openssl-1.1.1g/lib/libcrypto.a      /usr/local/lib/
    ln -s /usr/local/openssl-1.1.1g/lib/libcrypto.so     /usr/local/lib/
    ln -s /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /usr/local/lib/
    ln -s /usr/local/openssl-1.1.1g/lib/libssl.a         /usr/local/lib/
    ln -s /usr/local/openssl-1.1.1g/lib/libssl.so        /usr/local/lib/
    ln -s /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /usr/local/lib/
    # --------------------------------------------------
    ln -s /usr/local/openssl-1.1.1g/lib/engines-1.1/afalg.so   /usr/local/lib/engines-1.1/
    ln -s /usr/local/openssl-1.1.1g/lib/engines-1.1/capi.so    /usr/local/lib/engines-1.1/
    ln -s /usr/local/openssl-1.1.1g/lib/engines-1.1/padlock.so /usr/local/lib/engines-1.1/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig; fi
    # --------------------------------------------------
    ln -s /usr/local/openssl-1.1.1g/lib/pkgconfig/libcrypto.pc /usr/local/lib/pkgconfig/
    ln -s /usr/local/openssl-1.1.1g/lib/pkgconfig/libssl.pc    /usr/local/lib/pkgconfig/
    ln -s /usr/local/openssl-1.1.1g/lib/pkgconfig/openssl.pc   /usr/local/lib/pkgconfig/
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
        configure_openssl_1_1_1g                        && \
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

function configure_pcre_8_37() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin; fi
    # --------------------------------------------------
    ln -s /usr/local/pcre-8.37/bin/pcre-config /usr/local/bin/
    ln -s /usr/local/pcre-8.37/bin/pcregrep    /usr/local/bin/
    ln -s /usr/local/pcre-8.37/bin/pcretest    /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include; fi
    # --------------------------------------------------
    ln -s /usr/local/pcre-8.37/include/pcrecpparg.h       /usr/local/include/
    ln -s /usr/local/pcre-8.37/include/pcrecpp.h          /usr/local/include/
    ln -s /usr/local/pcre-8.37/include/pcre.h             /usr/local/include/
    ln -s /usr/local/pcre-8.37/include/pcreposix.h        /usr/local/include/
    ln -s /usr/local/pcre-8.37/include/pcre_scanner.h     /usr/local/include/
    ln -s /usr/local/pcre-8.37/include/pcre_stringpiece.h /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/include/lib" ]]; then
        mkdir /usr/local/include/lib; fi
    # --------------------------------------------------
    ln -s /usr/local/pcre-8.37/lib/libpcre.a             /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcrecpp.a          /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcrecpp.la         /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcrecpp.so         /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcrecpp.so.0       /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcrecpp.so.0.0.1   /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcre.la            /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcreposix.a        /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcreposix.la       /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcreposix.so       /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcreposix.so.0     /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcreposix.so.0.0.3 /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcre.so            /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcre.so.1          /usr/local/lib/
    ln -s /usr/local/pcre-8.37/lib/libpcre.so.1.2.5      /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/include/lib/pkgconfig" ]]; then
        mkdir /usr/local/include/lib/pkgconfig; fi
    # --------------------------------------------------
    ln -s /usr/local/pcre-8.37/lib/pkgconfig/libpcrecpp.pc   /usr/local/lib/pkgconfig/
    ln -s /usr/local/pcre-8.37/lib/pkgconfig/libpcre.pc      /usr/local/lib/pkgconfig/
    ln -s /usr/local/pcre-8.37/lib/pkgconfig/libpcreposix.pc /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    return 0
}

function compile_install_pcre_8_37() {
    
    if [[ ! -d "/usr/local/pcre-8.37" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"pcre-8.37\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/pcre-8.37.tar.gz       && \
                                                     \
        cd $STORAGE/pcre-8.37                     && \
                                                     \
        ./configure --prefix=/usr/local/pcre-8.37 && \
                                                     \
        make && make install                      && \
                                                     \
        configure_pcre_8_37                       && \
                                                     \
        cd $STORAGE                               && \
	                                                 \
        rm -rf $STORAGE/pcre-8.37                 && \
                                                     \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/pcre-8.37\" Already Exists."
        
        return 0
    fi
}

function create_user_for_httpd_2_4_54() {

    if [[ -f "/usr/bin/adduser" ]]; then
        local User_Exists=$(cat /etc/passwd | grep -o apache)
        if [[ -z "$User_Exists" ]]; then
            adduser apache -s /sbin/nologin -M; fi
    fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/useradd" ]]; then
        local User_Exists=$(cat /etc/passwd | grep -o apache)
        if [[ -z "$User_Exists" ]]; then
            useradd apache -s /sbin/nologin -M; fi
    fi
    # --------------------------------------------------
    return 0
}

function configure_httpd_2_4_54() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin; fi
    # --------------------------------------------------
    ln -s /usr/local/httpd-2.4.54/bin/ab           /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/apachectl    /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/apxs         /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/checkgid     /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/dbmmanage    /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/envvars      /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/envvars-std  /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/fcgistarter  /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/htcacheclean /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/htdbm        /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/htdigest     /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/htpasswd     /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/httpd        /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/httxt2dbm    /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/logresolve   /usr/local/bin/
    ln -s /usr/local/httpd-2.4.54/bin/rotatelogs   /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include; fi
    # --------------------------------------------------
    ln -s /usr/local/httpd-2.4.54/include/apache_noprobes.h  /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_compat.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_config_auto.h   /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_config.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_config_layout.h /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_expr.h          /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_hooks.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_listen.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_mmn.h           /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_mpm.h           /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_provider.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_regex.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_regkey.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_release.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_slotmem.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/ap_socache.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/cache_common.h     /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/heartbeat.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_config.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_connection.h  /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_core.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/httpd.h            /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_log.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_main.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_protocol.h    /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_request.h     /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_ssl.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/http_vhost.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_auth.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_cache.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_cgi.h          /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_core.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_dav.h          /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_dbd.h          /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_include.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_log_config.h   /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_proxy.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_request.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_rewrite.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_session.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_so.h           /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_ssl.h          /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_ssl_openssl.h  /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_status.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_unixd.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_watchdog.h     /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mod_xml2enc.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/mpm_common.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/os.h               /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/scoreboard.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/unixd.h            /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_cfgtree.h     /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_charset.h     /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_cookies.h     /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_ebcdic.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_fcgi.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_filter.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_ldap.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_md5.h         /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_mutex.h       /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_script.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_time.h        /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_varbuf.h      /usr/local/include/
    ln -s /usr/local/httpd-2.4.54/include/util_xml.h         /usr/local/include/
    # --------------------------------------------------
    return 0
}

function compile_install_httpd_2_4_54() {
    
    if [[ ! -d "/usr/local/httpd-2.4.54" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"httpd-2.4.54\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/httpd-2.4.54.tar.gz             && \
                                                              \
        cd $STORAGE/httpd-2.4.54                           && \
                                                              \
        ./configure --prefix=/usr/local/httpd-2.4.54          \
                    --enable-so                               \
                    --enable-ssl                              \
                    --enable-cgi                              \
                    --enable-rewrite                          \
                    --with-zlib                               \
                    --with-pcre                               \
                    --with-apr=/usr/local/apr-1.7.0           \
                    --with-apr-util=/usr/local/apr-util-1.6.1 \
                    --with-ssl=/usr/local/openssl-1.1.1g      \
                    --enable-modules=most                     \
                    --enable-mpms-shared=all                  \
                    --with-mpm=prefork                     && \
                                                              \
        make && make install                               && \
                                                              \
        configure_httpd_2_4_54                             && \
                                                              \
        cd $STORAGE                                        && \
	                                                          \
        rm -rf $STORAGE/httpd-2.4.54                       && \
                                                              \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/httpd-2.4.54\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_expat_2_5_0
    compile_install_apr_1_7_0
    compile_install_apr_util_1_6_1
    compile_install_openssl_1_1_1g
    #compile_install_pcre_8_37
    compile_install_httpd_2_4_54
}

main