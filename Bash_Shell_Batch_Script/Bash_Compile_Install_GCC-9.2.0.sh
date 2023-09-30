#! /bin/bash
# Create By GF 2023-03-21 17:23

# ====================================================================================================

# Need Install First: make-4.3.tar.gz (GNU)

# ====================================================================================================

# Need File: m4-1.4.13.tar.gz
# Need File: gmp-6.1.0.tar.bz2
# Need File: mpfr-3.1.4.tar.bz2
# Need File: mpc-1.0.3.tar.gz
# Need File: isl-0.1.8.tar.bz2
# Need File: gcc-9.2.0.tar.xz

# ====================================================================================================

# GCC Requires Manual "make install" at The End.

# ====================================================================================================

TARGET_SYSTEM="Linux" # Optional: FreeBSD / Linux

TARGET_C_COMPILER="GCC7" # Optional: Clang13 / GCC7 / GCC10

STORAGE=/home/goufeng

function error_handle_m4_1_4_13(){

    # ##################################################
    # ############# Error Handle m4-1.4.13 #############
    if [[ $TARGET_SYSTEM == "Linux" && $TARGET_C_COMPILER == *"GCC10"* ]]; then
        # error "Please port gnulib fseterr.c to your platform!
        # ..................................................
        sed -i ".bak" "s/IO_ftrylockfile/IO_EOF_SEEN/" $STORAGE/m4-1.4.13/lib/*.c
        echo "#define _IO_IN_BACKUP 0x100" >> $STORAGE/m4-1.4.13/lib/stdio-impl.h
    fi
	# ==================================================
	return 0
}

function backup_self_contained_m4(){

    # ##################################################
    # ########## Backup Self-Contained Binary ##########
    if [[ -f "/usr/bin/m4" && ! -f "/usr/bin/m4.self.contained" ]]; then
        mv /usr/bin/m4 /usr/bin/m4.self.contained
    fi
	# ==================================================
	return 0
}

function deploy_m4_1_4_13(){

    backup_self_contained_m4
	
    # ##################################################
    # ################ Deploy m4-1.4.13 ################
    # --------------------------------------------------
    # ------------------ Binary File -------------------
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # ..................................................
    ln -sf /usr/local/m4-1.4.13/bin/m4 /usr/local/bin/
	# ==================================================
	return 0
}

function compile_install_m4_1_4_13(){

    if [[ ! -d "/usr/local/m4-1.4.13" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( m4-1.4.13 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar -zxvf $STORAGE/m4-1.4.13.tar.gz       && \
        cd $STORAGE/m4-1.4.13                     && \
        error_handle_m4_1_4_13                    && \
        ./configure --prefix=/usr/local/m4-1.4.13 && \
        make && make install                      && \
        deploy_m4_1_4_13                          && \
        cd $STORAGE && rm -rf $STORAGE/m4-1.4.13
        # ==================================================
		return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/m4-1.4.13 ) Already Exists."
		# ==================================================
		return 0
    fi
}

function deploy_gmp_6_1_0(){
	
    # ##################################################
    # ################ Deploy gmp-6.1.0 ################
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    ln -sf /usr/local/gmp-6.1.0/include/gmp.h /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/gmp-6.1.0/lib/libgmp.a         /usr/local/lib/
    ln -sf /usr/local/gmp-6.1.0/lib/libgmp.la        /usr/local/lib/
    ln -sf /usr/local/gmp-6.1.0/lib/libgmp.so        /usr/local/lib/
    ln -sf /usr/local/gmp-6.1.0/lib/libgmp.so.10     /usr/local/lib/
    ln -sf /usr/local/gmp-6.1.0/lib/libgmp.so.10.3.0 /usr/local/lib/
	# ==================================================
	return 0
}

function compile_install_gmp_6_1_0(){

    if [[ ! -d "/usr/local/gmp-6.1.0" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( gmp-6.1.0 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar -jxvf $STORAGE/gmp-6.1.0.tar.bz2      && \
        cd $STORAGE/gmp-6.1.0                     && \
        ./configure --prefix=/usr/local/gmp-6.1.0 && \
        make && make check && make install        && \
        deploy_gmp_6_1_0                          && \
        cd $STORAGE && rm -rf $STORAGE/gmp-6.1.0
        # ==================================================
		return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/gmp-6.1.0 ) Already Exists."
		# ==================================================
		return 0
    fi
}

function deploy_mpfr_3_1_4(){
	
    # ##################################################
    # ############### Deploy mpfr-3.1.4 ################
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    ln -sf /usr/local/mpfr-3.1.4/include/mpf2mpfr.h /usr/local/include/
    ln -sf /usr/local/mpfr-3.1.4/include/mpfr.h     /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/mpfr-3.1.4/lib/libmpfr.a        /usr/local/lib/
    ln -sf /usr/local/mpfr-3.1.4/lib/libmpfr.la       /usr/local/lib/
    ln -sf /usr/local/mpfr-3.1.4/lib/libmpfr.so       /usr/local/lib/
    ln -sf /usr/local/mpfr-3.1.4/lib/libmpfr.so.4     /usr/local/lib/
    ln -sf /usr/local/mpfr-3.1.4/lib/libmpfr.so.4.1.4 /usr/local/lib/
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

function compile_install_mpfr_3_1_4(){

    if [[ ! -d "/usr/local/mpfr-3.1.4" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( mpfr-3.1.4 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar -jxvf $STORAGE/mpfr-3.1.4.tar.bz2       && \
        cd $STORAGE/mpfr-3.1.4                      && \
        ./configure --prefix=/usr/local/mpfr-3.1.4     \
                    --with-gmp=/usr/local/gmp-6.1.0 && \
        make && make check && make install          && \
        deploy_mpfr_3_1_4                           && \
        cd $STORAGE && rm -rf $STORAGE/mpfr-3.1.4
        # ==================================================
		return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/mpfr-3.1.4 ) Already Exists."
		# ==================================================
		return 0
    fi
}

function deploy_mpc_1_0_3(){
	
    # ##################################################
    # ################ Deploy mpc-1.0.3 ################
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    ln -sf /usr/local/mpc-1.0.3/include/mpc.h /usr/local/include/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/mpc-1.0.3/lib/libmpc.a        /usr/local/lib/
    ln -sf /usr/local/mpc-1.0.3/lib/libmpc.la       /usr/local/lib/
    ln -sf /usr/local/mpc-1.0.3/lib/libmpc.so       /usr/local/lib/
    ln -sf /usr/local/mpc-1.0.3/lib/libmpc.so.3     /usr/local/lib/
    ln -sf /usr/local/mpc-1.0.3/lib/libmpc.so.3.0.0 /usr/local/lib/
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

function compile_install_mpc_1_0_3(){

    if [[ ! -d "/usr/local/mpc-1.0.3" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( mpc-1.0.3 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar -zxvf $STORAGE/mpc-1.0.3.tar.gz           && \
        cd $STORAGE/mpc-1.0.3                         && \
        ./configure --prefix=/usr/local/mpc-1.0.3        \
                    --with-gmp=/usr/local/gmp-6.1.0      \
                    --with-mpfr=/usr/local/mpfr-3.1.4 && \
        make && make check && make install            && \
        deploy_mpc_1_0_3                              && \
        cd $STORAGE && rm -rf $STORAGE/mpc-1.0.3
        # ==================================================
		return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/mpc-1.0.3 ) Already Exists."
		# ==================================================
		return 0
    fi
}

function deploy_isl_0_18(){
	
    # ##################################################
    # ################ Deploy isl-0.18 #################
    # --------------------------------------------------
    # ------------------ Headers File ------------------
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # ..................................................
    if [[ ! -d "/usr/local/include/isl" ]]; then
        mkdir /usr/local/include/isl
    fi
    # ..................................................
    ln -sf /usr/local/isl-0.18/include/isl/aff.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/aff_type.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/arg.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/ast.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/ast_build.h        /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/ast_type.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/band.h             /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/constraint.h       /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/ctx.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/deprecated         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/flow.h             /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/hash.h             /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/hmap.h             /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/hmap_templ.c       /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/id.h               /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/id_to_ast_expr.h   /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/id_to_id.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/id_to_pw_aff.h     /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/ilp.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/list.h             /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/local_space.h      /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/lp.h               /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/map.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/map_to_basic_set.h /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/map_type.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/mat.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/maybe.h            /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/maybe_ast_expr.h   /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/maybe_basic_set.h  /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/maybe_id.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/maybe_pw_aff.h     /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/maybe_templ.h      /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/multi.h            /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/obj.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/options.h          /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/point.h            /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/polynomial.h       /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/polynomial_type.h  /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/printer.h          /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/printer_type.h     /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/schedule.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/schedule_node.h    /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/schedule_type.h    /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/set.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/set_type.h         /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/space.h            /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/stdint.h           /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/stream.h           /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/union_map.h        /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/union_map_type.h   /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/union_set.h        /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/union_set_type.h   /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/val.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/val_gmp.h          /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/vec.h              /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/version.h          /usr/local/include/isl/
    ln -sf /usr/local/isl-0.18/include/isl/vertices.h         /usr/local/include/isl/
    # --------------------------------------------------
    # ------------------ Library File ------------------
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # ..................................................
    ln -sf /usr/local/isl-0.18/lib/libisl.a                /usr/local/lib/
    ln -sf /usr/local/isl-0.18/lib/libisl.la               /usr/local/lib/
    ln -sf /usr/local/isl-0.18/lib/libisl.so               /usr/local/lib/
    ln -sf /usr/local/isl-0.18/lib/libisl.so.15            /usr/local/lib/
    ln -sf /usr/local/isl-0.18/lib/libisl.so.15.3.0        /usr/local/lib/
    ln -sf /usr/local/isl-0.18/lib/libisl.so.15.3.0-gdb.py /usr/local/lib/
    # --------------------------------------------------
    # ------------------ Pkg Config --------------------
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # ..................................................
    ln -sf /usr/local/isl-0.18/lib/pkgconfig/isl.pc /usr/local/lib/pkgconfig/
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

function compile_install_isl_0_18(){

    if [[ ! -d "/usr/local/isl-0.18" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( isl-0.18 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar -jxvf $STORAGE/isl-0.18.tar.bz2         && \
        cd $STORAGE/isl-0.18                        && \
        ./configure --prefix=/usr/local/isl-0.18    && \
        make && make check && make install          && \
        deploy_isl_0_18                             && \
        cd $STORAGE && rm -rf $STORAGE/isl-0.18
        # ==================================================
		return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/isl-0.18 ) Already Exists."
		# ==================================================
		return 0
    fi
}

function compile_install_gcc_9_2_0(){

    if [[ ! -d "/usr/local/gcc-9.2.0" ]]; then
        # ==================================================
        echo "[ SH Opt ] Compile and Install ( gcc-9.2.0 )? (y/n)"
        read verify
        # ==================================================
        if [[ $verify != "y" ]]; then
            exit 1
        fi
        # ==================================================
        tar -xvJf $STORAGE/gcc-9.2.0.tar.xz           && \
        cd $STORAGE/gcc-9.2.0                         && \
        ./configure --prefix=/usr/local/gcc-9.2.0        \
                    --enable-bootstrap                   \
                    --disable-multilib                   \
                    --with-gmp=/usr/local/gmp-6.1.0      \
                    --with-mpfr=/usr/local/mpfr-3.1.4    \
                    --with-mpc=/usr/local/mpc-1.0.3      \
                    --with-isl=/usr/local/isl-0.18    && \
        gmake && gmake install                        && \
    	cd $STORAGE && rm -rf $STORAGE/gcc-9.2.0
        # ==================================================
		return 0
    else
        "[ SH Note ] Path: ( /usr/local/gcc-9.2.0 ) Already Exists."
		# ==================================================
		return 0
    fi
}

function main() {

    compile_install_m4_1_4_13
	compile_install_gmp_6_1_0
	compile_install_mpfr_3_1_4
	compile_install_mpc_1_0_3
	compile_install_isl_0_18
	compile_install_gcc_9_2_0
}

main

# ====================================================================================================
# EOF
