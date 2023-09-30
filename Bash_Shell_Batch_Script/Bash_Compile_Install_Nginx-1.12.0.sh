#! /bin/bash
# Create By GF 2023-03-30 17:02

STORAGE=/home/goufeng

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
    if [[ ! -d "/usr/local/include/lib/pkgconfig" ]]; then
        mkdir /usr/local/include/lib/pkgconfig; fi
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
    ln -s /usr/local/pcre-8.37/lib/pkgconfig/libpcrecpp.pc   /usr/local/lib/pkgconfig/
    ln -s /usr/local/pcre-8.37/lib/pkgconfig/libpcre.pc      /usr/local/lib/pkgconfig/
    ln -s /usr/local/pcre-8.37/lib/pkgconfig/libpcreposix.pc /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    ldconfig
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

function error_handle_for_nginx_1_12_0() {

    # --------------------------------------------------
    # src/core/ngx_murmurhash.c: In function ‘ngx_murmur_hash2’:
    local Error_1_Exists=$(cat $STORAGE/nginx-1.12.0/objs/Makefile | grep -o "CFLAGS =  -pipe  -O -W -Wall -Wpointer-arith -Wno-unused-parameter -Werror -g")
    if [[ -n "$Error_1_Exists" ]]; then
        sed -i 's/CFLAGS =  -pipe  -O -W -Wall -Wpointer-arith -Wno-unused-parameter -Werror -g/CFLAGS =  -pipe  -O -W -Wall -Wpointer-arith -Wno-unused-parameter -g/g' $STORAGE/nginx-1.12.0/objs/Makefile; fi
    
    # --------------------------------------------------
    # src/os/unix/ngx_user.c: In function ‘ngx_libc_crypt’: 
    local Error_2_Exists=$(cat $STORAGE/nginx-1.12.0/src/os/unix/ngx_user.c | grep -o "cd\.current_salt\[0\] = ~salt\[0\];")
    if [[ -n "$Error_2_Exists" ]]; then
        #注释。
        sed -i 's#cd.current_salt#//&#' $STORAGE/nginx-1.12.0/src/os/unix/ngx_user.c; fi
        #删除指定行号的行。
        #sed -i '36d' $STORAGE/nginx-1.12.0/src/os/unix/ngx_user.c; fi
    
    # --------------------------------------------------
    return 0
}

function create_user_for_nginx_1_12_0() {

    if [[ -f "/usr/bin/adduser" ]]; then
        local User_Exists=$(cat /etc/passwd | grep -o nginx)
        if [[ -z "$User_Exists" ]]; then
            adduser nginx -s /sbin/nologin -M; fi
    fi
    # --------------------------------------------------
    if [[ -f "/usr/bin/useradd" ]]; then
        local User_Exists=$(cat /etc/passwd | grep -o nginx)
        if [[ -z "$User_Exists" ]]; then
            useradd nginx -s /sbin/nologin -M; fi
    fi
    # --------------------------------------------------
    return 0
}

function configure_nginx_1_12_0() {

    # --------------------------------------------------
    # ---------------- Sys Binary File -----------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin; fi
    # --------------------------------------------------
    ln -s /usr/local/nginx-1.12.0/sbin/nginx /usr/local/sbin/
    # --------------------------------------------------
    # ----------------- System Service -----------------
    touch /lib/systemd/system/nginx.service                                                    && \
    echo "[Unit]"                                         >> /lib/systemd/system/nginx.service && \
    echo "Description=nginx"                              >> /lib/systemd/system/nginx.service && \
    echo "After=network.target"                           >> /lib/systemd/system/nginx.service && \
    echo "[Service]"                                      >> /lib/systemd/system/nginx.service && \
    echo "Type=forking"                                   >> /lib/systemd/system/nginx.service && \
    echo "PIDFile=/usr/local/nginx-1.12.0/logs/nginx.pid" >> /lib/systemd/system/nginx.service && \
    echo "ExecStart=/usr/local/nginx-1.12.0/sbin/nginx"   >> /lib/systemd/system/nginx.service && \
    echo "ExecReload=/bin/kill -s HUP \$MAINPID"          >> /lib/systemd/system/nginx.service && \
    echo "ExecStop=/bin/kill -s QUIT \$MAINPID"           >> /lib/systemd/system/nginx.service && \
    echo "PrivateTmp=true"                                >> /lib/systemd/system/nginx.service && \
    echo "[Install]"                                      >> /lib/systemd/system/nginx.service && \
    echo "WantedBy=multi-user.target"                     >> /lib/systemd/system/nginx.service && \
    chmod 754 /lib/systemd/system/nginx.service
    # Useage: systemctl start nginx.service
    # Useage: systemctl enable nginx.service
    # --------------------------------------------------
    return 0
}

function compile_install_nginx_1_12_0() {
    
    if [[ ! -d "/usr/local/nginx-1.12.0" ]]; then
    
        local verify
    
        read -p "[ SH Opt ] Compile and Install \"nginx-1.12.0\"? (y/n)>" verify
        
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar -zxvf $STORAGE/nginx-1.12.0.tar.gz     && \
                                                      \
        cd $STORAGE/nginx-1.12.0                   && \
                                                      \
        create_user_for_nginx_1_12_0               && \
                                                      \
        ./configure --prefix=/usr/local/nginx-1.12.0  \
                    --user=nginx                      \
                    --group=nginx                     \
                    --with-http_stub_status_module && \
                                                      \
        make
        # --------------------------------------------------
        
        if [[ $? -eq 2 ]]; then
            error_handle_for_nginx_1_12_0; fi      && \
                                                      \
        make && make install                       && \
                                                      \
        configure_nginx_1_12_0                     && \
                                                      \
        cd $STORAGE                                && \
	                                                  \
        rm -rf $STORAGE/nginx-1.12.0               && \
                                                      \
        return 0
    else
    
        echo "[ SH Note ] Path: \"/usr/local/nginx-1.12.0\" Already Exists."
        
        return 0
    fi
}

function main() {

    compile_install_pcre_8_37
    compile_install_nginx_1_12_0
}

main