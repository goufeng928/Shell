#! /bin/tcsh
# Create By GF 2023-05-27 09:21

# Need File: pkg-config-0.29.2.tar.gz

set STORAGE = /home/goufeng

# ##################################################
# #### Start: Compile Install pkg-config-0.29.2 ####
if ( ! -d "/usr/local/pkg-config-0.29.2" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( pkg-config-0.29.2 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar zxvf $STORAGE/pkg-config-0.29.2.tar.gz        && \
    cd $STORAGE/pkg-config-0.29.2                     && \
    ./configure --prefix=/usr/local/pkg-config-0.29.2    \
                --with-internal-glib                  && \
    make && make install
    #block# # --------------------------------------------------
    #block# # ##################################################
    #block# # ##### ./configure Case 2: Presence of "GCC" ######
    #block# ./configure --prefix=/usr/local/pkg-config-0.29.2 \
    #block#             --with-internal-glib                  \
    #block#             --enable-iconv=no                     \
    #block#             --with-libiconv=gnu
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ######## Start: Deploy pkg-config-0.29.2 #########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/pkg-config-0.29.2/bin/pkg-config /usr/local/bin/
        # ##################################################
        # ######### End: Deploy pkg-config-0.29.2 ##########
    endif
    # --------------------------------------------------
    if ( $? == 0 ) then
        cd $STORAGE && rm -rf $STORAGE/pkg-config-0.29.2
    endif
else
    echo "[ SH Note ] Path: ( pkg-config-0.29.2 ) Already Exists."
endif
# ##################################################
# ##### End: Compile Install pkg-config-0.29.2 #####

# ----------------------------------------------------------------------------------------------------
# EOF