#! /bin/tcsh
# Create By GF 2023-05-28 18:17

# Tested System: FreeBSD 13.1 / Clang 13.0.0

# Need File: m4-1.4.13.tar.gz
# Need File: make-4.3.tar.gz (GNU)
# Need File: perl-5.26.1.tar.gz
# Need File: autoconf-2.69.tar.gz
# Need File: automake-1.15.tar.gz
# Need File: libtool-2.4.6.tar.gz
# Need File: gettext-0.19.7.tar.gz
# Need File: flex-2.6.4.tar.gz

# ----------------------------------------------------------------------------------------------------

set STORAGE = /home/goufeng

# ##################################################
# ######## Start: Compile Install m4-1.4.13 ########
if ( ! -d "/usr/local/m4-1.4.13" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( m4-1.4.13 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/m4-1.4.13.tar.gz        && \
    cd $STORAGE/m4-1.4.13
    # ##################################################
    # ######### Start: Error Handle m4-1.4.13 ##########
    # --------------------------------------------------
    #Block# # Ubuntu Linux: error "Please port gnulib fseterr.c to your platform!
    #Block# # --------------------------------------------------
    #Block# sed -i ".bak" "s/IO_ftrylockfile/IO_EOF_SEEN/" $STORAGE/m4-1.4.13/lib/*.c
    #Block# echo "#define _IO_IN_BACKUP 0x100" >> $STORAGE/m4-1.4.13/lib/stdio-impl.h
    # ##################################################
    # ########## End: Error Handle m4-1.4.13 ###########
    cd $STORAGE/m4-1.4.13                     && \
    ./configure --prefix=/usr/local/m4-1.4.13 && \
    make                                      && \
    make install                              && \
    set Remove_m4_1_4_13 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ############ Start: Deploy m4-1.4.13 #############
        # --------------------------------------------------
        # ##################################################
        # ########## Backup Self-Contained Binary ##########
        if ( -f "/usr/bin/m4" && ! -f "/usr/bin/m4.self.contained" ) then
            mv /usr/bin/m4 /usr/bin/m4.self.contained
        endif
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/m4-1.4.13/bin/m4 /usr/local/bin/
        #Block# # ##################################################
        #Block# # ################## Library File ##################
        #Block# if ( ! -d "/usr/local/lib" ) then
        #Block#     mkdir /usr/local/lib
        #Block# endif
        #Block# # --------------------------------------------------
        #Block# ln -sf /usr/local/m4-1.4.13/lib/charset.alias /usr/local/lib/
        # ##################################################
        # ############# End: Deploy m4-1.4.13 ##############
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_m4_1_4_13 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/m4-1.4.13
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/m4-1.4.13 ) Already Exists."
endif
# ##################################################
# ######### End: Compile Install m4-1.4.13 #########

# ----------------------------------------------------------------------------------------------------

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

# ##################################################
# ####### Start: Compile Install perl-5.26.1 #######
if ( ! -d "/usr/local/perl-5.26.1" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( perl-5.26.1 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar zxvf $STORAGE/perl-5.26.1.tar.gz                          && \
    cd $STORAGE/perl-5.26.1                                       && \
    ./Configure -des -Dprefix=/usr/local/perl-5.26.1 -Duseshrplib && \
    make                                                          && \
    make install                                                  && \
    set Remove_perl_5_26_1 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########### Start: Deploy perl-5.26.1 ############
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/perl-5.26.1/bin/corelist   /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/cpan       /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/enc2xs     /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/encguess   /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/h2ph       /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/h2xs       /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/instmodsh  /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/json_pp    /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/libnetcfg  /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/perl       /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/perl5.26.1 /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/perlbug    /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/perldoc    /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/perlivp    /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/perlthanks /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/piconv     /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/pl2pm      /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/pod2html   /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/pod2man    /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/pod2text   /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/pod2usage  /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/podchecker /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/podselect  /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/prove      /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/ptar       /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/ptardiff   /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/ptargrep   /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/shasum     /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/splain     /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/xsubpp     /usr/local/bin/
        ln -sf /usr/local/perl-5.26.1/bin/zipdetails /usr/local/bin/
        # ##################################################
        # ################## Library File ##################
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # --------------------------------------------------
        ln -sf /usr/local/perl-5.26.1/lib/5.26.1/amd64-freebsd/CORE/libperl.so /usr/local/lib/
        #Block# ln -sf /usr/local/perl-5.26.1/lib/5.26.1/x86_64-linux/CORE/libperl.so /usr/local/lib/
        # ##################################################
        # ############ End: Deploy perl-5.26.1 #############
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_perl_5_26_1 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/perl-5.26.1
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/perl-5.26.1 ) Already Exists."
endif
# ##################################################
# ######## End: Compile Install perl-5.26.1 ########

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ###### Start: Compile Install autoconf-2.69 ######
if ( ! -d "/usr/local/autoconf-2.69" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( autoconf-2.69 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/autoconf-2.69.tar.gz       && \
    cd $STORAGE/autoconf-2.69                     && \
    ./configure --prefix=/usr/local/autoconf-2.69 && \
    make                                          && \
    make install                                  && \
    set Remove_autoconf_2_69 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########## Start: Deploy autoconf-2.69 ###########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/autoconf-2.69/bin/autoconf   /usr/local/bin/
        ln -sf /usr/local/autoconf-2.69/bin/autoheader /usr/local/bin/
        ln -sf /usr/local/autoconf-2.69/bin/autom4te   /usr/local/bin/
        ln -sf /usr/local/autoconf-2.69/bin/autoreconf /usr/local/bin/
        ln -sf /usr/local/autoconf-2.69/bin/autoscan   /usr/local/bin/
        ln -sf /usr/local/autoconf-2.69/bin/autoupdate /usr/local/bin/
        ln -sf /usr/local/autoconf-2.69/bin/ifnames    /usr/local/bin/
        # ##################################################
        # ########### End: Deploy autoconf-2.69 ############
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_autoconf_2_69 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/autoconf-2.69
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/autoconf-2.69 ) Already Exists."
endif
# ##################################################
# ####### End: Compile Install autoconf-2.69 #######

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ###### Start: Compile Install automake-1.15 ######
if ( ! -d "/usr/local/automake-1.15" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( automake-1.15 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/automake-1.15.tar.gz       && \
    cd $STORAGE/automake-1.15                     && \
    ./configure --prefix=/usr/local/automake-1.15 && \
    cd $STORAGE
    # ##################################################
    # ####### Start: Error Handle automake-1.15 ########
    # --------------------------------------------------
    # FreeBSD: Try `--no-discard-stderr' if option outputs to stderr
    # --------------------------------------------------
    set Word = `cat ./Makefile | grep "update.*automake.*"`
    sed -i ".bak" "s/$Word/$Word --no-discard-stderr/" $STORAGE/automake-1.15/Makefile
    # ##################################################
    # ######## End: Error Handle automake-1.15 #########
    cd $STORAGE/automake-1.15                     && \
    make                                          && \
    make install                                  && \
    set Remove_automake_1_15 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########## Start: Deploy automake-1.15 ###########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/automake-1.15/bin/aclocal       /usr/local/bin/
        ln -sf /usr/local/automake-1.15/bin/aclocal-1.15  /usr/local/bin/
        ln -sf /usr/local/automake-1.15/bin/automake      /usr/local/bin/
        ln -sf /usr/local/automake-1.15/bin/automake-1.15 /usr/local/bin/
        # ##################################################
        # ########### End: Deploy automake-1.15 ############
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_automake_1_15 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/automake-1.15
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/automake-1.15 ) Already Exists."
endif
# ##################################################
# ####### End: Compile Install automake-1.15 #######

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ###### Start: Compile Install libtool-2.4.6 ######
if ( ! -d "/usr/local/libtool-2.4.6" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( libtool-2.4.6 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/libtool-2.4.6.tar.gz       && \
    cd $STORAGE/libtool-2.4.6                     && \
    ./configure --prefix=/usr/local/libtool-2.4.6 && \
    make                                          && \
    make install                                  && \
    set Remove_libtool_2_4_6 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########## Start: Deploy libtool-2.4.6 ###########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/libtool-2.4.6/bin/libtool    /usr/local/bin/
        ln -sf /usr/local/libtool-2.4.6/bin/libtoolize /usr/local/bin/
        # ##################################################
        # ################## Headers File ##################
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # --------------------------------------------------
        if ( ! -d "/usr/local/include/libltdl" ) then
            mkdir /usr/local/include/libltdl
        endif
        # --------------------------------------------------
        ln -sf /usr/local/libtool-2.4.6/include/ltdl.h /usr/local/include/
        # --------------------------------------------------
        ln -sf /usr/local/libtool-2.4.6/include/libltdl/lt_dlloader.h /usr/local/include/libltdl/
        ln -sf /usr/local/libtool-2.4.6/include/libltdl/lt_error.h    /usr/local/include/libltdl/
        ln -sf /usr/local/libtool-2.4.6/include/libltdl/lt_system.h   /usr/local/include/libltdl/
        # ##################################################
        # ################## Library File ##################
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # --------------------------------------------------
        ln -sf /usr/local/libtool-2.4.6/lib/libltdl.a        /usr/local/lib/
        ln -sf /usr/local/libtool-2.4.6/lib/libltdl.la       /usr/local/lib/
        ln -sf /usr/local/libtool-2.4.6/lib/libltdl.so       /usr/local/lib/
        ln -sf /usr/local/libtool-2.4.6/lib/libltdl.so.7     /usr/local/lib/
        ln -sf /usr/local/libtool-2.4.6/lib/libltdl.so.7.3.1 /usr/local/lib/
        # ##################################################
        # ############ FreeBSD Reload ldconfig #############
        /etc/rc.d/ldconfig restart
        # ##################################################
        # ########### End: Deploy libtool-2.4.6 ############
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_libtool_2_4_6 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/libtool-2.4.6
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/libtool-2.4.6 ) Already Exists."
endif
# ##################################################
# ####### End: Compile Install libtool-2.4.6 #######

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ##### Start: Compile Install gettext-0.19.7 ######
if ( ! -d "/usr/local/gettext-0.19.7" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( gettext-0.19.7 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/gettext-0.19.7.tar.gz       && \
    cd $STORAGE/gettext-0.19.7                     && \
    ./configure --prefix=/usr/local/gettext-0.19.7 && \
    make                                           && \
    make install                                   && \
    set Remove_gettext_0_19_7 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########## Start: Deploy gettext-0.19.7 ##########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/gettext-0.19.7/bin/autopoint       /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/envsubst        /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/gettext         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/gettext.sh      /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/gettextize      /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgattrib       /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgcat          /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgcmp          /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgcomm         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgconv         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgen           /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgexec         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgfilter       /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgfmt          /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msggrep         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msginit         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgmerge        /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msgunfmt        /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/msguniq         /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/ngettext        /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/recode-sr-latin /usr/local/bin/
        ln -sf /usr/local/gettext-0.19.7/bin/xgettext        /usr/local/bin/
        # ##################################################
        # ################## Headers File ##################
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # --------------------------------------------------
        ln -sf /usr/local/gettext-0.19.7/include/autosprintf.h /usr/local/include/
        ln -sf /usr/local/gettext-0.19.7/include/gettext-po.h  /usr/local/include/
        ln -sf /usr/local/gettext-0.19.7/include/libintl.h     /usr/local/include/
        # ##################################################
        # ################## Library File ##################
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # --------------------------------------------------
        if ( ! -d "/usr/local/lib/gettext" ) then
            mkdir /usr/local/lib/gettext
        endif
        # --------------------------------------------------
        #Block# ln -sf /usr/local/gettext-0.19.7/lib/charset.alias           /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libasprintf.a           /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libasprintf.la          /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libasprintf.so          /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libasprintf.so.0        /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libasprintf.so.0.0.0    /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextlib-0.19.7.so /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextlib.la        /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextlib.so        /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextpo.a          /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextpo.la         /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextpo.so         /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextpo.so.0       /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextpo.so.0.5.3   /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextsrc-0.19.7.so /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextsrc.la        /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libgettextsrc.so        /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libintl.a               /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libintl.la              /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libintl.so              /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libintl.so.8            /usr/local/lib/
        ln -sf /usr/local/gettext-0.19.7/lib/libintl.so.8.1.4        /usr/local/lib/
        # --------------------------------------------------
        ln -sf /usr/local/gettext-0.19.7/lib/gettext/cldr-plurals /usr/local/lib/gettext/
        ln -sf /usr/local/gettext-0.19.7/lib/gettext/hostname     /usr/local/lib/gettext/
        ln -sf /usr/local/gettext-0.19.7/lib/gettext/project-id   /usr/local/lib/gettext/
        ln -sf /usr/local/gettext-0.19.7/lib/gettext/urlget       /usr/local/lib/gettext/
        ln -sf /usr/local/gettext-0.19.7/lib/gettext/user-email   /usr/local/lib/gettext/
        # ##################################################
        # ############ FreeBSD Reload ldconfig #############
        /etc/rc.d/ldconfig restart
        # ##################################################
        # ########### End: Deploy gettext-0.19.7 ###########
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_gettext_0_19_7 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/gettext-0.19.7
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/gettext-0.19.7 ) Already Exists."
endif
# ##################################################
# ###### End: Compile Install gettext-0.19.7 #######

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ####### Start: Compile Install flex-2.6.4 ########
if ( ! -d "/usr/local/flex-2.6.4" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install ( flex-2.6.4 )? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar -zxvf $STORAGE/flex-2.6.4.tar.gz       && \
    cd $STORAGE/flex-2.6.4                     && \
    ./configure --prefix=/usr/local/flex-2.6.4 && \
    gmake                                      && \
    gmake install                              && \
    set Remove_flex_2_6_4 = 1
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########## Start: Deploy gettext-0.19.7 ##########
        # --------------------------------------------------
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/flex-2.6.4/bin/flex   /usr/local/bin
        ln -sf /usr/local/flex-2.6.4/bin/flex++ /usr/local/bin
        # ##################################################
        # ################## Headers File ##################
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # --------------------------------------------------
        ln -sf /usr/local/flex-2.6.4/include/FlexLexer.h /usr/local/include/
        # ##################################################
        # ################## Library File ##################
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # --------------------------------------------------
        ln -sf /usr/local/flex-2.6.4/lib/libfl.a        /usr/local/lib/
        ln -sf /usr/local/flex-2.6.4/lib/libfl.la       /usr/local/lib/
        ln -sf /usr/local/flex-2.6.4/lib/libfl.so       /usr/local/lib/
        ln -sf /usr/local/flex-2.6.4/lib/libfl.so.2     /usr/local/lib/
        ln -sf /usr/local/flex-2.6.4/lib/libfl.so.2.0.0 /usr/local/lib/
        # ##################################################
        # ############ FreeBSD Reload ldconfig #############
        /etc/rc.d/ldconfig restart
        # ##################################################
        # ########### End: Deploy gettext-0.19.7 ###########
    endif
    # --------------------------------------------------
    if ( $? == 0 && $Remove_flex_2_6_4 == 1 ) then
        cd $STORAGE && rm -rf $STORAGE/flex-2.6.4
    endif
else
    echo "[ SH Note ] Path: ( /usr/local/flex-2.6.4 ) Already Exists."
endif
# ##################################################
# ######## End: Compile Install flex-2.6.4 #########

# ----------------------------------------------------------------------------------------------------
# EOF
