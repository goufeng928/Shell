#! /bin/bash
# Create By GF 2023-05-28 10:33

# Need File: cmake-2.8.5.tar.gz
# Need File: mysql-5.5.11.tar.gz

# ====================================================================================================

# FreeBSD Need To Manually Add Users : mysql
# FreeBSD Need To Manually Add Group : mysql
#                          Full Name : MySQL Default User
#                              Shell : nologin
#                               Home : /nonexistent
#                    FreeBSD Command : adduser (Add) / rmuser (Remove)

# ====================================================================================================

# MySQL 5.5.11 "my.cnf" Location                    : /usr/local/mysql-data/conf/my.cnf && Need: chmod 644
# MySQL 5.5.11 Initialize                           : /usr/local/mysql-5.5.11/script/mysql_install_db --basedir=/usr/local/mysql-5.5.11 --user=mysql
# MySQL 5.5.11 Manually Copying Startup Files       : cp /usr/local/mysql-5.5.11/support-files/mysql.server [/etc/rc.d | /etc/init.d]
# MySQL 5.5.11 Setting Password (Default: Empty)    : mysqladmin -u root password 'Your-Password'
# MySQL 5.5.11 View Password Verification VARIABLES : mysql> SHOW VARIABLES LIKE 'validate_password%'; (Only Example)
# MySQL 5.5.11 Password Modification Policy         : mysql> set global validate_password.policy=0; (Optional: 0 or LOW / 1 or MEDIUM / 2 or STRONG)
# MySQL 5.5.11 Modify Password Length               : mysql> set global validate_password.length=6;
# MySQL 5.5.11 Password Modification                : mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY '@Binghe123456';

# ====================================================================================================

TARGET_SYSTEM="Linux" # Optional: FreeBSD / Linux

TARGET_C_COMPILER="GCC" # Optional: Clang / GCC

STORAGE=/home/goufeng

function deploy_cmake_2_8_5() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/cmake-2.8.5/bin/cmake /usr/local/bin/cmake2
    # ==================================================
    return 0
}

function compile_install_cmake_2_8_5() {

    if [[ ! -d "/usr/local/cmake-2.8.5" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( cmake-2.8.5 )? (y/n)"
        read Verify
        # ==================================================
        if [[ $Verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar zxvf $STORAGE/cmake-2.8.5.tar.gz        && \
        cd $STORAGE/cmake-2.8.5                     && \
        ./configure --prefix=/usr/local/cmake-2.8.5 && \
        make && make install                        && \
        deploy_cmake_2_8_5                          && \
        cd $STORAGE && rm -rf $STORAGE/cmake-2.8.5
        # ==================================================
        return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/cmake-2.8.5 ) Already Exists."
        # ==================================================
        return 0
    fi
}

function error_handle_mysql_5_5_11() {

    if [[ $TARGET_SYSTEM == "FreeBSD" && $TARGET_C_COMPILER == "Clang" ]]; then
        # ........................................................
        # Cerror: ISO C++11 does not allow access declarations; use using declarations instead
        sed -i ".bak" "351 s/MYSQL_LOG::generate_name;/using MYSQL_LOG::generate_name;/" $STORAGE/mysql-5.5.11/sql/log.h
        sed -i ".bak" "352 s/MYSQL_LOG::is_open;/using MYSQL_LOG::is_open;/" $STORAGE/mysql-5.5.11/sql/log.h
        # ........................................................
        # error: constant expression evaluates to -1 which cannot be narrowed to type 'unsigned long' [-Wc++11-narrowing]
        sed -i ".bak" "10980 s/NULL, NULL, 200, 100, ~0L, 0);/NULL, NULL, 200, 100, static_cast<unsigned long>(~0L), 0);/" $STORAGE/mysql-5.5.11/storage/innobase/handler/ha_innodb.cc
        sed -i ".bak" "11087 s/NULL, NULL, 0, 0, ~0L, 0);/NULL, NULL, 0, 0, static_cast<unsigned long>(~0L), 0);/" $STORAGE/mysql-5.5.11/storage/innobase/handler/ha_innodb.cc
        sed -i ".bak" "11149 s/NULL, NULL, 500L, 1L, ~0L, 0);/NULL, NULL, 500L, 1L, static_cast<unsigned long>(~0L), 0);/" $STORAGE/mysql-5.5.11/storage/innobase/handler/ha_innodb.cc
        sed -i ".bak" "11211 s/NULL, NULL, 30L, 0L, ~0L, 0);/NULL, NULL, 30L, 0L, static_cast<unsigned long>(~0L), 0);/" $STORAGE/mysql-5.5.11/storage/innobase/handler/ha_innodb.cc
        sed -i ".bak" "11216 s/NULL, NULL, 6L, 0L, ~0L, 0);/NULL, NULL, 6L, 0L, static_cast<unsigned long>(~0L), 0);/" $STORAGE/mysql-5.5.11/storage/innobase/handler/ha_innodb.cc
        sed -i ".bak" "11226 s/NULL, NULL, 10000L, 0L, ~0L, 0);/NULL, NULL, 10000L, 0L, static_cast<unsigned long>(~0L), 0);/" $STORAGE/mysql-5.5.11/storage/innobase/handler/ha_innodb.cc
        # ........................................................
        # error: constant expression evaluates to 18446744073709551615 which cannot be narrowed to type 'longlong' (aka 'long long') [-Wc++11-narrowing]
        sed -i ".bak" "5731 s#/\* def_value \*/ 1024, /\* min_value \*/  256, /\* max_value \*/ ULONG_MAX,#/\* def_value \*/ 1024, /\* min_value \*/  256, /\* max_value \*/ static_cast<longlong>(ULONG_MAX),#" $STORAGE/mysql-5.5.11/sql/mysqld.cc
        sed -i ".bak" "5859 s/REQUIRED_ARG, TC_LOG_MIN_SIZE, TC_LOG_MIN_SIZE, ULONG_MAX, 0,/REQUIRED_ARG, TC_LOG_MIN_SIZE, TC_LOG_MIN_SIZE, static_cast<longlong>(ULONG_MAX), 0,/" $STORAGE/mysql-5.5.11/sql/mysqld.cc
        # ........................................................
        # error: cannot initialize a parameter of type 'HA_CREATE_INFO *' (aka 'st_ha_create_information *') with an rvalue of type 'ulonglong' (aka 'unsigned long long')
        sed -i ".bak" "283 s/(ulonglong)0, (uint)0);/(HA_CREATE_INFO *)0, (uint)0);/" $STORAGE/mysql-5.5.11/sql/sql_partition.cc
        # ........................................................
        # error: non-constant-expression cannot be narrowed from type 'int' to 'size_t' (aka 'unsigned long') in initializer list [-Wc++11-narrowing]
        sed -i ".bak" "682 s/name, len };/name, static_cast<size_t>(len) };/" $STORAGE/mysql-5.5.11/sql/sql_plugin.cc
        # ........................................................
        # error: non-constant-expression cannot be narrowed from type 'size_t' (aka 'unsigned long') to 'int' in initializer list [-Wc++11-narrowing]
        sed -i ".bak" "193 s/my_offsetof(class Table_triggers_list, definitions_list),/static_cast<int>(my_offsetof(class Table_triggers_list, definitions_list)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        sed -i ".bak" "198 s/my_offsetof(class Table_triggers_list, definition_modes_list),/static_cast<int>(my_offsetof(class Table_triggers_list, definition_modes_list)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        sed -i ".bak" "203 s/my_offsetof(class Table_triggers_list, definers_list),/static_cast<int>(my_offsetof(class Table_triggers_list, definers_list)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        sed -i ".bak" "208 s/my_offsetof(class Table_triggers_list, client_cs_names),/static_cast<int>(my_offsetof(class Table_triggers_list, client_cs_names)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        sed -i ".bak" "213 s/my_offsetof(class Table_triggers_list, connection_cl_names),/static_cast<int>(my_offsetof(class Table_triggers_list, connection_cl_names)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        sed -i ".bak" "218 s/my_offsetof(class Table_triggers_list, db_cl_names),/static_cast<int>(my_offsetof(class Table_triggers_list, db_cl_names)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        sed -i ".bak" "227 s/my_offsetof(class Table_triggers_list, definition_modes_list),/static_cast<int>(my_offsetof(class Table_triggers_list, definition_modes_list)),/" $STORAGE/mysql-5.5.11/sql/sql_trigger.cc
        # ........................................................
        # error: non-constant-expression cannot be narrowed from type 'size_t' (aka 'unsigned long') to 'int' in initializer list [-Wc++11-narrowing]
        sed -i ".bak" "726 s/my_offsetof(TABLE_LIST, select_stmt),/static_cast<int>(my_offsetof(TABLE_LIST, select_stmt)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "729 s/my_offsetof(TABLE_LIST, md5),/static_cast<int>(my_offsetof(TABLE_LIST, md5)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "732 s/my_offsetof(TABLE_LIST, updatable_view),/static_cast<int>(my_offsetof(TABLE_LIST, updatable_view)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "735 s/my_offsetof(TABLE_LIST, algorithm),/static_cast<int>(my_offsetof(TABLE_LIST, algorithm)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "738 s/my_offsetof(TABLE_LIST, definer.user),/static_cast<int>(my_offsetof(TABLE_LIST, definer.user)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "741 s/my_offsetof(TABLE_LIST, definer.host),/static_cast<int>(my_offsetof(TABLE_LIST, definer.host)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "744 s/my_offsetof(TABLE_LIST, view_suid),/static_cast<int>(my_offsetof(TABLE_LIST, view_suid)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "747 s/my_offsetof(TABLE_LIST, with_check),/static_cast<int>(my_offsetof(TABLE_LIST, with_check)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "750 s/my_offsetof(TABLE_LIST, timestamp),/static_cast<int>(my_offsetof(TABLE_LIST, timestamp)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "753 s/my_offsetof(TABLE_LIST, file_version),/static_cast<int>(my_offsetof(TABLE_LIST, file_version)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "756 s/my_offsetof(TABLE_LIST, source),/static_cast<int>(my_offsetof(TABLE_LIST, source)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "759 s/my_offsetof(TABLE_LIST, view_client_cs_name),/static_cast<int>(my_offsetof(TABLE_LIST, view_client_cs_name)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "762 s/my_offsetof(TABLE_LIST, view_connection_cl_name),/static_cast<int>(my_offsetof(TABLE_LIST, view_connection_cl_name)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        sed -i ".bak" "765 s/my_offsetof(TABLE_LIST, view_body_utf8),/static_cast<int>(my_offsetof(TABLE_LIST, view_body_utf8)),/" $STORAGE/mysql-5.5.11/sql/sql_view.cc
        # ........................................................
        # error: non-constant-expression cannot be narrowed from type 'unsigned int' to 'int' in initializer list [-Wc++11-narrowing]
        sed -i ".bak" "92 s/profile_options & PROFILE_CPU,/static_cast<int>(profile_options \& PROFILE_CPU),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "93 s/profile_options & PROFILE_CPU,/static_cast<int>(profile_options \& PROFILE_CPU),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "94 s/profile_options & PROFILE_CONTEXT,/static_cast<int>(profile_options \& PROFILE_CONTEXT),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "95 s/profile_options & PROFILE_CONTEXT,/static_cast<int>(profile_options \& PROFILE_CONTEXT),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "96 s/profile_options & PROFILE_BLOCK_IO,/static_cast<int>(profile_options \& PROFILE_BLOCK_IO),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "97 s/profile_options & PROFILE_BLOCK_IO,/static_cast<int>(profile_options \& PROFILE_BLOCK_IO),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "98 s/profile_options & PROFILE_IPC,/static_cast<int>(profile_options \& PROFILE_IPC),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "99 s/profile_options & PROFILE_IPC,/static_cast<int>(profile_options \& PROFILE_IPC),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "100 s/profile_options & PROFILE_PAGE_FAULTS,/static_cast<int>(profile_options \& PROFILE_PAGE_FAULTS),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "101 s/profile_options & PROFILE_PAGE_FAULTS,/static_cast<int>(profile_options \& PROFILE_PAGE_FAULTS),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "102 s/profile_options & PROFILE_SWAPS,/static_cast<int>(profile_options \& PROFILE_SWAPS),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "103 s/profile_options & PROFILE_SOURCE,/static_cast<int>(profile_options \& PROFILE_SOURCE),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "104 s/profile_options & PROFILE_SOURCE,/static_cast<int>(profile_options \& PROFILE_SOURCE),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        sed -i ".bak" "105 s/profile_options & PROFILE_SOURCE,/static_cast<int>(profile_options \& PROFILE_SOURCE),/" $STORAGE/mysql-5.5.11/sql/sql_profile.cc
        # ........................................................
        # error: constant expression evaluates to 239 which cannot be narrowed to type 'char' [-Wc++11-narrowing]
        sed -i ".bak" "30 s/ReplSemiSyncBase::kPacketMagicNum/static_cast<char>(ReplSemiSyncBase::kPacketMagicNum)/" $STORAGE/mysql-5.5.11/plugin/semisync/semisync.cc
        # ........................................................
        # error: constant expression evaluates to -1 which cannot be narrowed to type 'unsigned long' [-Wc++11-narrowing]
        sed -i ".bak" "182 s/10000, 0, ~0L, 1);/10000, 0, static_cast<unsigned long>(~0L), 1);/" $STORAGE/mysql-5.5.11/plugin/semisync/semisync_master_plugin.cc
        sed -i ".bak" "196 s/32, 0, ~0L, 1);/32, 0, static_cast<unsigned long>(~0L), 1);/" $STORAGE/mysql-5.5.11/plugin/semisync/semisync_master_plugin.cc
        # ........................................................
        # error: constant expression evaluates to -1 which cannot be narrowed to type 'unsigned long' [-Wc++11-narrowing]
        sed -i ".bak" "164 s/32, 0, ~0L, 1);/32, 0, static_cast<unsigned long>(~0L), 1);/" $STORAGE/mysql-5.5.11/plugin/semisync/semisync_slave_plugin.cc
        # error: constant expression evaluates to 18446744073709551615 which cannot be narrowed to type 'longlong' (aka 'long long') [-Wc++11-narrowing]
        sed -i ".bak" "1553 s/1, ULONG_MAX, 0, 1, 0},/1, static_cast<longlong>(ULONG_MAX), 0, 1, 0},/" $STORAGE/mysql-5.5.11/client/mysql.cc
        sed -i ".bak" "1557 s/1, ULONG_MAX, 0, 1, 0},/1, static_cast<longlong>(ULONG_MAX), 0, 1, 0},/" $STORAGE/mysql-5.5.11/client/mysql.cc
        # ........................................................
        # error: incompatible integer to pointer conversion assigning to 'char *' from 'char'
        sed -i ".bak" "2627 s/'\\0'/0/" $STORAGE/mysql-5.5.11/client/mysql.cc
        # ........................................................
        # constant expression evaluates to 18446744073709551615 which cannot be narrowed to type 'longlong' (aka 'long long') [-Wc++11-narrowing]
        sed -i ".bak" "1141 s/REQUIRED_ARG, (ulonglong)(~(my_off_t)0), BIN_LOG_HEADER_SIZE,/REQUIRED_ARG, static_cast<longlong>((ulonglong)(~(my_off_t)0)), BIN_LOG_HEADER_SIZE,/" $STORAGE/mysql-5.5.11/client/mysqlbinlog.cc
        sed -i ".bak" "1142 s/(ulonglong)(~(my_off_t)0), 0, 0, 0},/static_cast<longlong>((ulonglong)(~(my_off_t)0)), 0, 0, 0},/" $STORAGE/mysql-5.5.11/client/mysqlbinlog.cc
    fi
    # ============================================================
    return 0
}

function prepare_mysql_5_5_11() {

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
    # ----------- Start: Create User / Group For MySQL -----------
    set MySQL_User = `cat /etc/passwd | grep -o "mysql"`
    # ............................................................
    if [[ "$MySQL_User" == "" && $TARGET_SYSTEM == "Linux" ]]; then    
        useradd mysql -s /sbin/nologin -u 3306 -M
        # ==================================================
        # The difference between "adduser" and "useradd":
        # "adduser" is not a standard Linux command, it is essentially a Perl script.
        # Calling the "useradd" command in the background makes this advanced utility more efficient when creating users in Linux.
        # "useradd" provides options for creating a home directory, setting passwords, and other parameters.
        # ==================================================
        # useradd Option Description:
        # -c: Add note text and save it in the note column of passwd.
        # -d: Specify the user's home directory when logging in, replace the system default value of /home/<username>.
        # -g: Specify the group to which the user belongs. The value can be either a group name or a GID. The user group must already exist, with a default value of 100, which is users.
        # -s: Specify the shell that the user will use after logging in. The default value is /bin/bash.
        # -u: Specify the user ID number. This value must be unique within the system. 0~499 is reserved for the system user account by default, so the value must be greater than 499.
        # -m: Automatically establish the user's login directory.
        # -M: Do not automatically establish a user's login directory
        # ==================================================
    fi
    # ------------------------------------------------------------
    # ------ Granting mysql-data Permissions To MySQL Users ------
    chown -R mysql:mysql /usr/local/mysql-data
    # ============================================================
    return 0
}

function deploy_mysql_5_5_11() {

    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/mysql-5.5.11/bin/*    /usr/local/bin/
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
    if [[ ! -d "/usr/local/include/mysql/psi" ]]; then
        mkdir /usr/local/include/mysql/psi
    fi
    # ..................................................
    ln -sf /usr/local/mysql-5.5.11/include/*.h    /usr/local/include/
    # ..................................................
    ln -sf /usr/local/mysql-5.5.11/include/mysql/*.h    /usr/local/include/mysql/
    # ..................................................
    ln -sf /usr/local/mysql-5.5.11/include/mysql/psi/*.h    /usr/local/include/mysql/psi/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
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
    ln -sf /usr/local/mysql-5.5.11/lib/*.a       /usr/local/lib/
    ln -sf /usr/local/mysql-5.5.11/lib/*.so      /usr/local/lib/
    ln -sf /usr/local/mysql-5.5.11/lib/*.so.*    /usr/local/lib/
    # ..................................................
    ln -sf /usr/local/mysql-5.5.11/lib/plugin/*.so    /usr/local/lib/plugin/
    # ============================================================
    return 0
}

function configure_mysql_5_5_11() {

    # ##################################################
    # ########### Copy MySQL Configure File ############
    #cp /usr/local/mysql-5.5.11/support-files/my-medium.cnf /usr/local/mysql-data/my.cnf
    # ##################################################
    # ############# Configure mysql-5.5.11 #############
    #if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
    #    cp /usr/local/mysql-5.5.11/support-files/mysql.server    /etc/rc.d/mysqld && \
    #    chmod 700 /etc/rc.d/mysqld
    #    # ..............................................
    #elif [[ $TARGET_SYSTEM == "Linux" ]]; then
    #    cp /usr/local/mysql-5.5.11/support-files/mysql.server    /etc/init.d/mysqld && \
    #    chmod 700 /etc/init.d/mysqld
    #fi
    # ============================================================
    return 0
}

function compile_install_mysql_5_5_11() {

    if [[ ! -d "/usr/local/mysql-5.5.11" ]]; then
        # ============================================================
        echo "[ SH Opt ] Compile and Install ( mysql-5.5.11 )? (y/n)"
        read Verify
        # ============================================================
        if [[ $Verify != "y" ]]; then
            exit 1
        fi
        # ============================================================
        tar -zxvf $STORAGE/mysql-5.5.11.tar.gz                        && \
        error_handle_mysql_5_5_11                                     && \
        prepare_mysql_5_5_11                                          && \
        cmake2 -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-5.5.11            \
               -DMYSQL_DATADIR=/usr/local/mysql-data/data                \
               -DMYSQL_UNIX_ADDR=/usr/local/mysql-data/run/mysql.sock    \
               -DSYSCONFDIR=/usr/local/mysql-data/conf                   \
               -DWITH_INNOBASE_STORAGE_ENGINE=1                          \
               -DWITH_ARCHIVE_STORAGE_ENGINE=1                           \
               -DWITH_BLACKHOLE_STORAGE_ENGINE=1                         \
               -DWITH_PERFSCHEMA_STORAGE_ENGINE=1                        \
               -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1                        \
               -DMYSQL_TCP_PORT=3306                                     \
               -DDEFAULT_CHARSET=utf8                                    \
               -DDEFAULT_COLLATION=utf8_general_ci                       \
               -DWITH_EXTRA_CHARSETS=ALL                              && \
        make && make install                                          && \
        deploy_mysql_5_5_11                                           && \
        chown -R mysql:mysql /usr/local/mysql-5.5.11                  && \
        configure_mysql_5_5_11                                        && \
        cd $STORAGE && rm -rf $STORAGE/mysql-5.5.11
        # ============================================================
        return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/mysql-5.5.11 ) Already Exists."
        # ============================================================
        return 0
    fi
}

function main() {

    compile_install_cmake_2_8_5
    compile_install_mysql_5_5_11
}

main
