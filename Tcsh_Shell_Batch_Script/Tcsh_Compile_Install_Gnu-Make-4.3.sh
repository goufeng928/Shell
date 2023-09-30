#! /bin/tcsh
# Create By GF 2023-05-27 23:16

# Need File: make-4.3.tar.gz (GNU)

# ----------------------------------------------------------------------------------------------------

set STORAGE = /home/goufeng

# ##################################################
# ###### Start: Compile Install GNU-Make-4.3 #######
if ( ! -d "/usr/local/gnu-make-4.3" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( gnu-make-4.3 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/make-4.3.tar.gz           && \
    cd $STORAGE/make-4.3                         && \
    ./configure --prefix=/usr/local/gnu-make-4.3 && \
    make                                         && \
    make install                                 && \
    set Remove_make_4_3 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########### Start: Deploy GNU-Make-4.3 ###########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/gnu-make-4.3/bin/make /usr/local/bin/gmake
        # ##################################################
        # ################## Headers File ##################
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # --------------------------------------------------
        ln -sf /usr/local/gnu-make-4.3/include/gnumake.h /usr/local/include/
        # ##################################################
        # ############ End: Deploy GNU-Make-4.3 ############
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_make_4_3 == 1) then
        cd $STORAGE && rm -rf $STORAGE/make-4.3
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/gnu-make-4.3 ) Already Exists."
endif
# ##################################################
# ####### End: Compile Install Gnu-Make-4.3 ########

# ----------------------------------------------------------------------------------------------------
# EOF
