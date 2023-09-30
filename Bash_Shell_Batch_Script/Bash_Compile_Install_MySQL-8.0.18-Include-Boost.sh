#! /bin/bash
# Create By GF 2023-05-22 20:33

# ====================================================================================================

# Need File: zlib-1.2.13.tar.gz
# Need File: cmake-3.15.2.tar.gz
# Need File: pkg-config-0.29.2.tar.gz
# Need File: libunwind-1.6.2.tar.gz    | (Provide: unw_get_reg)
# Need File: openssl-1.1.1g.tar.gz
# Need File: ncurses-6.4.tar.gz
# Need File: mysql-boost-8.0.18.tar.gz

# ====================================================================================================

# Warning: Need GCC 5.3 or newer (GCC > 5.3).
# Warning: If it is under 5.7 and includes 5.7, still using utf8, cannot add -DDEFAULT_ CHARSET=utf8mb4

# ====================================================================================================

# FreeBSD Need To Manually Add Users : mysql
# FreeBSD Need To Manually Add Group : mysql
#                          Full Name : MySQL Default User
#                              Shell : nologin
#                               Home : /nonexistent
#                    FreeBSD Command : adduser (Add) / rmuser (Remove)

# ====================================================================================================

# MySQL 8.0.18 "my.cnf" Location                    : /usr/local/mysql-data/conf/my.cnf && Need: chmod 644
# MySQL 8.0.18 Initialize                           : mysqld --defaults-file=/usr/local/mysql-data/conf/my.cnf --initialize --user=mysql
# MySQL 8.0.18 Temporary Password                   : cat /usr/local/mysql-data/log/error_log/mysql-error.log | grep password
# Log in to MySQL 8.0.18                            : mysql -uroot -pujbbqC?A+38g
# MySQL 8.0.18 View Password Verification VARIABLES : mysql> SHOW VARIABLES LIKE 'validate_password%'; (Only Example)
# MySQL 8.0.18 Password Modification Policy         : mysql> set global validate_password.policy=0; (Optional: 0 or LOW / 1 or MEDIUM / 2 or STRONG)
# MySQL 8.0.18 Modify Password Length               : mysql> set global validate_password.length=6;
# MySQL 8.0.18 Password Modification                : mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY '@Binghe123456';

# ====================================================================================================

TARGET_SYSTEM="Linux" # Optional: FreeBSD / Linux

TARGET_C_COMPILER="GCC7" # Optional: Clang13 / GCC7 / GCC9

STORAGE=/home/goufeng

function deploy_zlib_1_2_13() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    ln -sf /usr/local/zlib-1.2.13/include/*.h           /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/zlib-1.2.13/lib/*.a               /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/*.so              /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/*.so.*            /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # ..................................................
    ln -sf /usr/local/zlib-1.2.13/lib/pkgconfig/*.pc    /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    # ---------------- Reload ldconfig -----------------
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        /etc/rc.d/ldconfig restart
        # ..............................................
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        ldconfig
    fi
    # ==================================================
    return 0
}

function compile_install_zlib_1_2_13() {

    if [[ ! -d "/usr/local/zlib-1.2.13" && ! -f "/usr/include/zlib.h" ]]; then
        # ==================================================
        echo "Compile and Install ( zlib-1.2.13 )? (y/n)"
        read verify
        # ==================================================
        if [[ "$verify" != "y" ]]; then exit 1; fi
        # ==================================================
        tar zxvf $STORAGE/zlib-1.2.13.tar.gz        && \
        cd $STORAGE/zlib-1.2.13                     && \
        ./configure --prefix=/usr/local/zlib-1.2.13 && \
        make && make install                        && \
        deploy_zlib_1_2_13                          && \
        cd $STORAGE && rm -rf $STORAGE/zlib-1.2.13
        # ==================================================
        return 0
    else
        echo "[ SH Note ] Path: ( zlib ) Already Exists."
        # ==================================================
        return 0        
    fi
}

function deploy_cmake_3_15_2() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/cmake-3.15.2/bin/cmake /usr/local/bin/cmake3
    # ==================================================
    return 0
}

function compile_install_cmake_3_15_2() {

    if [[ ! -d "/usr/local/cmake-3.15.2" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( cmake-3.15.2 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then exit 1; fi
        # ==================================================
        tar zxvf $STORAGE/cmake-3.15.2.tar.gz        && \
        cd $STORAGE/cmake-3.15.2                     && \
        ./configure --prefix=/usr/local/cmake-3.15.2 && \
        make && make install                         && \
        deploy_cmake_3_15_2                          && \
        cd $STORAGE && rm -rf $STORAGE/cmake-3.15.2  && \
        return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/cmake-3.15.2 ) Already Exists."
        # ==================================================
        return 0
    fi
}

function deploy_pkg-config_0_29_2() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/pkg-config-0.29.2/bin/pkg-config /usr/local/bin/
    # ==================================================
    return 0
}

# ----------------------------------------------------------------------------------------------------

function compile_install_pkg-config_0_29_2() {

    if [[ ! -d "/usr/local/pkg-config-0.29.2" && ! -f "/usr/bin/pkg-config" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( pkg-config-0.29.2 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then exit 1; fi
        # ==================================================
        tar zxvf $STORAGE/pkg-config-0.29.2.tar.gz        && \
        cd $STORAGE/pkg-config-0.29.2                     && \
        ./configure --prefix=/usr/local/pkg-config-0.29.2    \
                    --with-internal-glib                  && \
        make &&  make install                             && \
        deploy_pkg-config_0_29_2                          && \
        cd $STORAGE && rm -rf $STORAGE/pkg-config-0.29.2  && \
        # ==================================================
        return 0
    else
        echo "[ SH Note ] Path: ( pkg-config ) Already Exists."
        # ==================================================
        return 0
    fi
}

function deploy_libunwind_1_6_2() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    ln -sf /usr/local/libunwind-1.6.2/include/*.h           /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/libunwind-1.6.2/lib/*.a               /usr/local/lib/
    ln -sf /usr/local/libunwind-1.6.2/lib/*.la              /usr/local/lib/
    ln -sf /usr/local/libunwind-1.6.2/lib/*.so              /usr/local/lib/
    ln -sf /usr/local/libunwind-1.6.2/lib/*.so.*            /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # ..................................................
    ln -sf /usr/local/libunwind-1.6.2/lib/pkgconfig/*.pc    /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    # ---------------- Reload ldconfig -----------------
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        /etc/rc.d/ldconfig restart
        # ..............................................
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        ldconfig
    fi
    # ==================================================
    return 0
}

function compile_install_libunwind_1_6_2() {

    if [[ ! -d "/usr/local/libunwind-1.6.2" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( libunwind-1.6.2 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then exit 1; fi
        # ==================================================
        tar zxvf $STORAGE/libunwind-1.6.2.tar.gz        && \
        cd $STORAGE/libunwind-1.6.2                     && \
        ./configure --prefix=/usr/local/libunwind-1.6.2 && \
        make && make install                            && \
        deploy_libunwind_1_6_2                          && \
        cd $STORAGE && rm -rf $STORAGE/libunwind-1.6.2
        # ==================================================
        return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/libunwind-1.6.2 ) Already Exists."
        # ==================================================
        return 0
    fi
}

function backup_self_contained_openssl() {

    if [[ -f "/usr/bin/openssl" && ! -f "/usr/bin/openssl.self.contained" ]]; then
        mv /usr/bin/openssl /usr/bin/openssl.self.contained; fi
    # ==================================================
    return 0
}

function deploy_openssl_1_1_1g() {

    backup_self_contained_openssl

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/openssl-1.1.1g/bin/openssl             /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    if [[ ! -d "/usr/local/include/openssl" ]]; then
        mkdir /usr/local/include/openssl; fi
    # ..................................................
    ln -sf /usr/local/openssl-1.1.1g/include/openssl/*.h     /usr/local/include/openssl/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    if [[ ! -d "/usr/local/lib/engines-1.1" ]]; then
        mkdir /usr/local/lib/engines-1.1
    fi
    # ..................................................
    ln -sf /usr/local/openssl-1.1.1g/lib/*.a                 /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/*.so                /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/*.so.*              /usr/local/lib/
    # ..................................................
    ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/*.so    /usr/local/lib/engines-1.1/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # ..................................................
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/*.pc      /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    # ------------ Compatible Library File -------------
    if [[ $TARGET_SYSTEM == "Linux" ]]; then
        # --------------------------------------------------
        # ------- Ubuntu 18.04 : Library 64bit File --------
        ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /lib64/libssl.so.1.1
        ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /lib64/libcrypto.so.1.1
        #Block# # --------------------------------------------------
        #Block# # ------- Ubuntu 22.04 : Library 64bit File --------
        #Block# ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /usr/lib64/libssl.so.1.1
        #Block# ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
    fi
    # --------------------------------------------------
    # ---------------- Reload ldconfig -----------------
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        /etc/rc.d/ldconfig restart
        # ..............................................
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        ldconfig
    fi
    # ==================================================
    return 0
}

function compile_install_openssl_1_1_1g() {

    if [[ ! -d "/usr/local/openssl-1.1.1g" ]]; then
        # ==================================================
        echo "[ SH Opt ]Compile and Install ( openssl-1.1.1g )? (y/n)"
        read verify
        # ==================================================
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/openssl-1.1.1g.tar.gz         && \
        cd $STORAGE/openssl-1.1.1g                      && \
        ./config --prefix=/usr/local/openssl-1.1.1g        \
                 --openssldir=/usr/local/openssl-1.1.1g    \
                 --shared zlib                          && \
        make && make install                            && \
        deploy_openssl_1_1_1g                           && \
        cd $STORAGE && rm -rf $STORAGE/openssl-1.1.1g   && \
        # ==================================================
        return 0
    else
    
        echo "[ SH Note ] Path: ( /usr/local/openssl-1.1.1g ) Already Exists."
        # ==================================================
        return 0        
    fi
}

function deploy_ncurses_6_4() {

    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    if [[ ! -d "/usr/local/include/ncurses" ]]; then
        mkdir /usr/local/include/ncurses
    fi
    # ..................................................
    ln -sf /usr/local/ncurses-6.4/include/ncurses/*.h    /usr/local/include/
    # ..................................................
    ln -sf /usr/local/ncurses-6.4/include/ncurses/*.h    /usr/local/include/ncurses/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/ncurses-6.4/lib/*.a                /usr/local/lib/
    ln -sf /usr/local/ncurses-6.4/lib/*.so               /usr/local/lib/
    ln -sf /usr/local/ncurses-6.4/lib/*.so.*             /usr/local/lib/
    # ..................................................
    ln -sf /usr/local/ncurses-6.4/lib/terminfo           /usr/local/lib/
    # ==================================================
    return 0
}

function compile_install_ncurses_6_4() {

    if [[ ! -d "/usr/local/ncurses-6.4" && ! -f /usr/include/curses.h ]]; then
        # ==================================================
        echo "Compile and Install ( ncurses-6.4 )? (y/n)"
        read verify
        # ==================================================
        if [[ "$verify" != "y" ]]; then exit 1; fi
        # ==================================================
        tar zxvf $STORAGE/ncurses-6.4.tar.gz        && \
        cd $STORAGE/ncurses-6.4                     && \
        ./configure --prefix=/usr/local/ncurses-6.4    \
                    --with-shared                   && \
        make && make install                        && \
        deploy_ncurses_6_4                          && \
        cd $STORAGE && rm -rf $STORAGE/ncurses-6.4
        # ==================================================
        return 0
    else
        echo "[ SH Note ] Path: ( ncurses ) Already Exists."
        # ==================================================
        return 0        
    fi
}

function error_handle_mysql_boost_8_0_18() {

    if [[ $TARGET_SYSTEM == "FreeBSD" && $TARGET_C_COMPILER == "Clang13" ]]; then
        # Clang-11: error: cannot initialize return object of type 'bool' with an rvalue of type 'nullptr_t'
        sed -i ".bak" "548 s/NULL, NULL, NULL, NULL, NULL, NULL, NULL,/false, NULL, NULL, NULL, NULL, NULL, NULL,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/plugin.cc
        sed -i ".bak" "549 s/NULL, NULL, DEFAULT_THREAD_PRIORITY, 1, false,/NULL, false, DEFAULT_THREAD_PRIORITY, 1, false,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/plugin.cc
        sed -i ".bak" "605 s/0, NULL, NULL, NULL, NULL, NULL, NULL, NULL,/0, NULL, NULL, false, NULL, NULL, NULL, NULL,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/recovery_state_transfer.cc
        sed -i ".bak" "606 s/NULL, NULL, NULL, NULL, DEFAULT_THREAD_PRIORITY,/NULL, NULL, NULL, false, DEFAULT_THREAD_PRIORITY,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/recovery_state_transfer.cc
    fi
    # ==================================================
    return 0
}

function prepare_mysql_boost_8_0_18() {

    # ------------------------------------------------------------
    # -------------- Create User / Group For MySQL ---------------
    MySQL_User=`cat /etc/passwd | grep -o "mysql"`
    # ------------------------------------------------------------
    if [[ -z "$MySQL_User" && $TARGET_SYSTEM == "Linux" ]]; then    
        useradd mysql -s /sbin/nologin -u 3306 -M
        # ........................................................
        # The difference between "adduser" and "useradd":
        # "adduser" is not a standard Linux command, it is essentially a Perl script.
        # Calling the "useradd" command in the background makes this advanced utility more efficient when creating users in Linux.
        # "useradd" provides options for creating a home directory, setting passwords, and other parameters.
        # ........................................................
        # useradd Option Description:
        # -c: Add note text and save it in the note column of passwd.
        # -d: Specify the user's home directory when logging in, replace the system default value of /home/<username>.
        # -g: Specify the group to which the user belongs. The value can be either a group name or a GID. The user group must already exist, with a default value of 100, which is users.
        # -s: Specify the shell that the user will use after logging in. The default value is /bin/bash.
        # -u: Specify the user ID number. This value must be unique within the system. 0~499 is reserved for the system user account by default, so the value must be greater than 499.
        # -m: Automatically establish the user's login directory.
        # -M: Do not automatically establish a user's login directory
        # ........................................................
    fi
    # ------------------------------------------------------------
    # --------- Create The Required Directory For MySQL ----------
    if [[ ! -d "/usr/local/mysql-data" ]]; then
        mkdir -p /usr/local/mysql-data/run
        mkdir -p /usr/local/mysql-data/data
        mkdir -p /usr/local/mysql-data/tmp
        mkdir -p /usr/local/mysql-data/conf
        mkdir -p /usr/local/mysql-data/log/bin_log
        mkdir -p /usr/local/mysql-data/log/error_log
        mkdir -p /usr/local/mysql-data/log/query_log
        mkdir -p /usr/local/mysql-data/log/general_log
        mkdir -p /usr/local/mysql-data/log/innodb_ts
        mkdir -p /usr/local/mysql-data/log/undo_space
        mkdir -p /usr/local/mysql-data/log/innodb_log
    fi
    # ------------------------------------------------------------
    # ------ Granting mysql-data Permissions To MySQL Users ------
    chown -R mysql:mysql /usr/local/mysql-data
    # ============================================================
    return 0
}

function deploy_mysql_boost_8_0_18() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/bin/*                     /usr/local/bin/
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    if [[ ! -d "/usr/local/include/mysql" ]]; then
        mkdir /usr/local/include/mysql
    fi
    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/include/*.h               /usr/local/include/
    # --------------------------------------------------
    ln -sf /usr/local/mysql-8.0.18/include/mysql/*.h         /usr/local/include/mysql/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    if [[ ! -d "/usr/local/lib/mysqlrouter" ]]; then
        mkdir /usr/local/lib/mysqlrouter
    fi
    # ..................................................
    if [[ ! -d "/usr/local/lib/plugin" ]]; then
        mkdir /usr/local/lib/plugin
    fi
    # ..................................................
    if [[ ! -d "/usr/local/lib/plugin/debug" ]]; then
        mkdir /usr/local/lib/plugin/debug
    fi
    # ..................................................
    if [[ ! -d "/usr/local/lib/private" ]]; then
        mkdir /usr/local/lib/private
    fi
    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/lib/*.a                   /usr/local/lib/
    ln -sf /usr/local/mysql-8.0.18/lib/*.so                  /usr/local/lib/
    ln -sf /usr/local/mysql-8.0.18/lib/*.so.*                /usr/local/lib/
    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/lib/mysqlrouter/*.so      /usr/local/lib/mysqlrouter/
    ln -sf /usr/local/mysql-8.0.18/lib/mysqlrouter/*.so.*    /usr/local/lib/mysqlrouter/

    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/lib/plugin/*.so           /usr/local/lib/plugin/
    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/lib/private/*.so.*        /usr/local/lib/private/
    # --------------------------------------------------
    # #----------------- Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # ..................................................
    ln -sf /usr/local/mysql-8.0.18/lib/pkgconfig/*.pc        /usr/local/lib/pkgconfig/
    # --------------------------------------------------
    # ---------------- Reload ldconfig -----------------
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        /etc/rc.d/ldconfig restart
        # ..............................................
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        ldconfig
    fi
    # ==================================================
    return 0
}

function configure_mysql_boost_8_0_18() {
    
    # --------------------------------------------------
    # ----------- Copy MySQL Configure File ------------
    #cp /usr/local/mysql-5.5.11/support-files/my-medium.cnf /usr/local/mysql-data/my.cnf
    # --------------------------------------------------
    # ------------ Copy MySQL Startup File -------------
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        cp /usr/local/mysql-8.0.18/support-files/mysql.server    /etc/rc.d/mysqld && \
        chmod 700 /etc/rc.d/mysqld
        # ..............................................
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        cp /usr/local/mysql-8.0.18/support-files/mysql.server    /etc/init.d/mysqld && \
        chmod 700 /etc/init.d/mysqld
    fi
    # ==================================================
    return 0
}

function compile_install_mysql_boost_8_0_18() {

    if [[ ! -d "/usr/local/mysql-8.0.18" ]]; then
        # ============================================================
        echo "[ SH Opt ] Compile and Install ( mysql-8.0.18 )? (y/n)"
        read verify
        # ============================================================
        if [[ $verify != "y" ]]; then exit 1; fi
        # ============================================================
        tar -zxvf $STORAGE/mysql-boost-8.0.18.tar.gz                    && \
        cd $STORAGE/mysql-8.0.18                                        && \
        error_handle_mysql_boost_8_0_18                                 && \
        prepare_mysql_boost_8_0_18
        # ============================================================
        cd $STORAGE/mysql-8.0.18                                        && \
        cmake3 -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-8.0.18              \
               -DMYSQL_DATADIR=/usr/local/mysql-data/data                  \
               -DDEFAULT_CHARSET=utf8mb4                                   \
               -DDEFAULT_COLLATION=utf8mb4_general_ci                      \
               -DEXTRA_CHARSETS=all                                        \
               -DENABLED_LOCAL_INFILE=ON                                   \
               -DWITH_INNODB_MEMCACHED=ON                                  \
               -DWITH_INNOBASE_STORAGE_ENGINE=1                            \
               -DWITH_FEDERATED_STORAGE_ENGINE=1                           \
               -DWITH_BLACKHOLE_STORAGE_ENGINE=1                           \
               -DWITH_ARCHIVE_STORAGE_ENGINE=1                             \
               -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1                          \
               -DWITH_PERFSCHEMA_STORAGE_ENGINE=1                          \
               -DCOMPILATION_COMMENT="binghe edition"                      \
               -DWITH_BOOST=$STORAGE/mysql-8.0.18/boost/boost_1_70_0       \
               -DMYSQL_UNIX_ADDR=/usr/local/mysql-data/run/mysql.sock      \
               -DMYSQL_TCP_PORT=3306                                       \
               -DSYSCONFDIR=/usr/local/mysql-data/conf                     \
               -DWITH_READLINE=1                                           \
               -DFORCE_INSOURCE_BUILD=1                                    \
               -DWITH_SSL=system                                           \
               -DWITH_ZLIB=system                                          \
               -DCMAKE_C_COMPILER=/usr/bin/gcc                             \
               -DCMAKE_CXX_COMPILER=/usr/bin/g++                        && \
        make && make install                                            && \
        deploy_mysql_boost_8_0_18                                       && \
        chown -R mysql:mysql /usr/local/mysql-8.0.18                    && \
        configure_mysql_boost_8_0_18                                    && \
        cd $STORAGE && rm -rf $STORAGE/mysql-8.0.18
        # ============================================================
        return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/mysql-8.0.18 ) Already Exists."
        # ============================================================
        return 0
    fi
}

function main() {

    compile_install_zlib_1_2_13
    compile_install_cmake_3_15_2
    compile_install_pkg-config_0_29_2
    compile_install_libunwind_1_6_2
    compile_install_openssl_1_1_1g
    compile_install_ncurses_6_4
    compile_install_mysql_boost_8_0_18
}

main