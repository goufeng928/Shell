#! /bin/tcsh
# Create By GF 2023-05-22 20:33

# ====================================================================================================

# Need File: zlib-1.2.13.tar.gz
# Need File: cmake-3.15.2.tar.gz
# Need File: pkg-config-0.29.2.tar.gz
# Need File: libunwind-1.6.2.tar.gz    | (Provide: unw_get_reg)
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

set TARGET_SYSTEM = "FreeBSD" # Optional: FreeBSD / Linux

set TARGET_C_COMPILER = "Clang13" # Optional: Clang13 / GCC7 / GCC9

set STORAGE = /home/goufeng

# ####################################################################################################
# ################################### Compile Install zlib-1.2.13 ####################################
if ( ! -d "/usr/local/zlib-1.2.13" && ! -f "/usr/include/zlib.h" ) then
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
        ln -sf /usr/local/zlib-1.2.13/include/*.h           /usr/local/include/
        # --------------------------------------------------
        # ------------------ Library File ------------------
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # ..................................................
        ln -sf /usr/local/zlib-1.2.13/lib/*.a               /usr/local/lib/
        ln -sf /usr/local/zlib-1.2.13/lib/*.so              /usr/local/lib/
        ln -sf /usr/local/zlib-1.2.13/lib/*.so.*            /usr/local/lib/
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
    echo "[ SH Note ] Path: ( zlib ) Already Exists."
endif

# ####################################################################################################
# ################################### Compile Install cmake-3.15.2 ###################################
if ( ! -d "/usr/local/cmake-3.15.2" ) then
    # ==================================================
    echo "[ SH Opt ] Compile and Install ( cmake-3.15.2 )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar zxvf $STORAGE/cmake-3.15.2.tar.gz        && \
    cd $STORAGE/cmake-3.15.2                     && \
    ./configure --prefix=/usr/local/cmake-3.15.2 && \
    make                                         && \
    make install                                 && \
	set Deploy_cmake_3_15_2 = 1
    set Remove_cmake_3_15_2 = 1
    # ==================================================
    if ( $? == 0 && $Deploy_cmake_3_15_2 == 1 ) then
        # ##################################################
        # ############## Deploy cmake-3.15.2 ###############
        # --------------------------------------------------
        # ------------------ Binary File -------------------
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # ..................................................
        ln -sf /usr/local/cmake-3.15.2/bin/cmake    /usr/local/bin/cmake3
    endif
    # ==================================================
    if ( $? == 0 && $Remove_cmake_3_15_2 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/cmake-3.15.2
    endif
else
    echo "[ SH Note ] Path: ( cmake-3.15.2 ) Already Exists."
endif

# ####################################################################################################
# ################################ Compile Install pkg-config-0.29.2 #################################
if ( ! -d "/usr/local/pkg-config-0.29.2" && ! -f "/usr/bin/pkg-config" ) then
    # ==================================================
    echo "[ SH Opt ] Compile and Install ( pkg-config-0.29.2 )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar zxvf $STORAGE/pkg-config-0.29.2.tar.gz        && \
    cd $STORAGE/pkg-config-0.29.2                     && \
    ./configure --prefix=/usr/local/pkg-config-0.29.2    \
                --with-internal-glib                  && \
    make                                              && \
    make install                                      && \
	set Deploy_pkg_config_0_29_2 = 1                  && \
    set Remove_pkg_config_0_29_2 = 1
    # ==================================================
    if ( $? == 0 && $Deploy_pkg_config_0_29_2 == 1 ) then
        # ##################################################
        # ############ Deploy pkg-config-0.29.2 ############
        # --------------------------------------------------
        # ------------------ Binary File -------------------
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # ..................................................
        ln -sf /usr/local/pkg-config-0.29.2/bin/pkg-config    /usr/local/bin/
    endif
    # ==================================================
    if ( $? == 0 && $Remove_pkg_config_0_29_2 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/pkg-config-0.29.2
    endif
else
    echo "[ SH Note ] Path: ( pkg-config ) Already Exists."
endif

# ####################################################################################################
# ################################# Compile Install libunwind-1.6.2 ##################################
if ( ! -d "/usr/local/libunwind-1.6.2" ) then
    # ==================================================
    echo "[ SH Opt ] Compile and Install ( libunwind-1.6.2 )? (y/n)"
    set verify = $<
    # ==================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ==================================================
    tar zxvf $STORAGE/libunwind-1.6.2.tar.gz        && \
    cd $STORAGE/libunwind-1.6.2                     && \
    ./configure --prefix=/usr/local/libunwind-1.6.2 && \
    make                                            && \
    make install                                    && \
    set Deploy_libunwind_1_6_2 = 1                  && \
    set Remove_libunwind_1_6_2 = 1
    # ==================================================
    if ( $? == 0 && $Deploy_libunwind_1_6_2 == 1 ) then
        # ##################################################
        # ############# Deploy libunwind-1.6.2 #############
        # --------------------------------------------------
        # ------------------ Headers File ------------------
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # ..................................................
        ln -sf /usr/local/libunwind-1.6.2/include/*.h    /usr/local/include/
        # --------------------------------------------------
        # ------------------ Library File ------------------
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # ..................................................
        ln -sf /usr/local/libunwind-1.6.2/lib/*.a       /usr/local/lib/
        ln -sf /usr/local/libunwind-1.6.2/lib/*.la      /usr/local/lib/
        ln -sf /usr/local/libunwind-1.6.2/lib/*.so      /usr/local/lib/
        ln -sf /usr/local/libunwind-1.6.2/lib/*.so.*    /usr/local/lib/
        # --------------------------------------------------
        # ------------------ Pkg Config --------------------
        if ( ! -d "/usr/local/lib/pkgconfig" ) then
            mkdir /usr/local/lib/pkgconfig
        endif
        # ..................................................
        ln -sf /usr/local/libunwind-1.6.2/lib/pkgconfig/*.pc    /usr/local/lib/pkgconfig/
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
    if ( $? == 0 && $Remove_libunwind_1_6_2 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/libunwind-1.6.2
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/libunwind-1.6.2 ) Already Exists."
endif

# ####################################################################################################
# ########################### Compile Install MySQL-8.0.18 (Include Boost) ###########################
if ( ! -d "/usr/local/mysql-8.0.18" ) then
    # ============================================================
    echo "[ SH Opt ] Compile and Install ( mysql-8.0.18 )? (y/n)"
    set verify = $<
    # ============================================================
    if ( $verify != "y" ) then
        exit 1
    endif
    # ============================================================
    tar -zxvf $STORAGE/mysql-boost-8.0.18.tar.gz                    && \
    cd $STORAGE/mysql-8.0.18
    # ############################################################
    # ############# Error Handle mysql-boost-8.0.18 ##############
    if ( $TARGET_SYSTEM == "FreeBSD" && $TARGET_C_COMPILER == "Clang13" ) then
        # Clang-11: error: cannot initialize return object of type 'bool' with an rvalue of type 'nullptr_t'
        sed -i ".bak" "548 s/NULL, NULL, NULL, NULL, NULL, NULL, NULL,/false, NULL, NULL, NULL, NULL, NULL, NULL,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/plugin.cc
        sed -i ".bak" "549 s/NULL, NULL, DEFAULT_THREAD_PRIORITY, 1, false,/NULL, false, DEFAULT_THREAD_PRIORITY, 1, false,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/plugin.cc
        sed -i ".bak" "605 s/0, NULL, NULL, NULL, NULL, NULL, NULL, NULL,/0, NULL, NULL, false, NULL, NULL, NULL, NULL,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/recovery_state_transfer.cc
        sed -i ".bak" "606 s/NULL, NULL, NULL, NULL, DEFAULT_THREAD_PRIORITY,/NULL, NULL, NULL, false, DEFAULT_THREAD_PRIORITY,/" $STORAGE/mysql-8.0.18/plugin/group_replication/src/recovery_state_transfer.cc
    endif
    # ############################################################
    # ######### Create The Required Directory For MySQL ##########
    if ( $? == 0 ) then
        if ( ! -d "/usr/local/mysql-data" ) then
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
        endif
    endif
    # ############################################################
    # ############## Create User / Group For MySQL ###############
    if ( $? == 0 ) then
        set MySQL_User = `cat /etc/passwd | grep -o "mysql"`
        # ------------------------------------------------------------
        if ( "$MySQL_User" == "" && $TARGET_SYSTEM == "Linux" ) then    
            useradd mysql -s /sbin/nologin -u 3306 -M
            # ..................................................
            # The difference between "adduser" and "useradd":
            # "adduser" is not a standard Linux command, it is essentially a Perl script.
            # Calling the "useradd" command in the background makes this advanced utility more efficient when creating users in Linux.
            # "useradd" provides options for creating a home directory, setting passwords, and other parameters.
            # ..................................................
            # useradd Option Description:
            # -c: Add note text and save it in the note column of passwd.
            # -d: Specify the user's home directory when logging in, replace the system default value of /home/<username>.
            # -g: Specify the group to which the user belongs. The value can be either a group name or a GID. The user group must already exist, with a default value of 100, which is users.
            # -s: Specify the shell that the user will use after logging in. The default value is /bin/bash.
            # -u: Specify the user ID number. This value must be unique within the system. 0~499 is reserved for the system user account by default, so the value must be greater than 499.
            # -m: Automatically establish the user's login directory.
            # -M: Do not automatically establish a user's login directory
            # ..................................................
            set Granting_mysql_data = 1
        else
            set Granting_mysql_data = 1
        endif
    endif
    # ############################################################
    # ###### Granting mysql-data Permissions To MySQL Users ######
    if ( $? == 0 && $Granting_mysql_data == 1 ) then
        chown -R mysql:mysql /usr/local/mysql-data
    endif
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
           -DCMAKE_C_COMPILER=/usr/bin/clang                           \
           -DCMAKE_CXX_COMPILER=/usr/bin/clang++                    && \
    make                                                            && \
    make install                                                    && \
    set Granting_mysql_8_0_18 = 1                                   && \
    set Deploy_mysql_8_0_18 = 1
    set Remove_mysql_8_0_18 = 1
    # ############################################################
    # ################ Copy MySQL Configure File #################
    #cp /usr/local/mysql-8.0.18/support-files/my-medium.cnf /usr/local/mysql-data/my.cnf
    # ############################################################
    # ######## Granting mysql Permissions To MySQL Users #########
    if ( $? == 0 && $Granting_mysql_8_0_18 == 1 ) then
        chown -R mysql:mysql /usr/local/mysql-8.0.18
    endif
    # ============================================================
    if ( $? == 0 && $Deploy_mysql_8_0_18 == 1 ) then
        # ########################################################
        # ############## Deploy mysql-boost-8.0.18 ###############
        # --------------------------------------------------
        # ------------------ Binary File -------------------
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # ..................................................
        ln -sf /usr/local/mysql-8.0.18/bin/*                     /usr/local/bin/
        # --------------------------------------------------
        # ------------------ Headers File ------------------
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # ..................................................
        if ( ! -d "/usr/local/include/mysql" ) then
            mkdir /usr/local/include/mysql
        endif
        # ..................................................
        ln -sf /usr/local/mysql-8.0.18/include/*.h               /usr/local/include/
        # ..................................................
        ln -sf /usr/local/mysql-8.0.18/include/mysql/*.h         /usr/local/include/mysql/
        # --------------------------------------------------
        # ------------------ Library File ------------------
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # ..................................................
        if ( ! -d "/usr/local/lib/mysqlrouter" ) then
            mkdir /usr/local/lib/mysqlrouter
        endif
        # ..................................................
        if ( ! -d "/usr/local/lib/plugin" ) then
            mkdir /usr/local/lib/plugin
        endif
        # ..................................................
        if ( ! -d "/usr/local/lib/plugin/debug" ) then
            mkdir /usr/local/lib/plugin/debug
        endif
        # ..................................................
        if ( ! -d "/usr/local/lib/private" ) then
            mkdir /usr/local/lib/private
        endif
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
        # ------------------ Pkg Config --------------------
        if ( ! -d "/usr/local/lib/pkgconfig" ) then
            mkdir /usr/local/lib/pkgconfig
        endif
        # ..................................................
        ln -sf /usr/local/mysql-8.0.18/lib/pkgconfig/*.pc        /usr/local/lib/pkgconfig/
        # --------------------------------------------------
        # ---------------- Reload ldconfig -----------------
        if ( $TARGET_SYSTEM == "FreeBSD" ) then
            /etc/rc.d/ldconfig restart
            # ..............................................
        else if ( $TARGET_SYSTEM == "Linux" ) then
            ldconfig
        endif
    endif
    # ##################################################
    # ########## Configure mysql-boost-8.0.18 ##########
    if ( $TARGET_SYSTEM == "FreeBSD" ) then
        cp /usr/local/mysql-8.0.18/support-files/mysql.server    /etc/rc.d/mysqld && \
        chmod 700 /etc/rc.d/mysqld
        # ..............................................
    else if ( $TARGET_SYSTEM == "Linux" ) then
        cp /usr/local/mysql-8.0.18/support-files/mysql.server    /etc/init.d/mysqld && \
        chmod 700 /etc/init.d/mysqld
    endif
    # ==================================================
    if ( $? == 0 && $Remove_mysql_8_0_18 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/mysql-8.0.18
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/mysql-8.0.18 ) Already Exists."
endif

# ====================================================================================================
# EOF