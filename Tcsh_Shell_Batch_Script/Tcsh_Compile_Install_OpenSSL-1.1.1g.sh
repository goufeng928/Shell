#! /bin/tcsh
# Create By GF 2023-05-27 16:46

# Need File: perl-5.26.1.tar.gz 
# Need File: openssl-1.1.1g.tar.gz

set STORAGE = /home/goufeng

# ##################################################
# ########### Start: 编译安装perl-5.26.1 ###########
if ( ! -d "/usr/local/perl-5.26.1" ) then
    # --------------------------------------------------
    echo "[ SH Opt ] Compile and Install perl-5.26.1? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar zxvf $STORAGE/perl-5.26.1.tar.gz                          && \
    cd $STORAGE/perl-5.26.1                                       && \
    ./Configure -des -Dprefix=/usr/local/perl-5.26.1 -Duseshrplib && \
    make && make install
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
    if ( $? == 0 ) then
        cd $STORAGE && rm -rf $STORAGE/perl-5.26.1
    endif
else
    echo "[ SH Note ] Path: /usr/local/perl-5.26.1 Already Exists."
endif
# ##################################################
# ############ End: 编译安装perl-5.26.1 ############

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ########## Start: 编译安装openssl-1.1.1g #########
if ( ! -d "/usr/local/openssl-1.1.1g" ) then
    # --------------------------------------------------
    echo "[ SH Opt ]Compile and Install openssl-1.1.1g? (y/n)"
    set verify = $<
    # --------------------------------------------------
    if ( $verify != "y" ) then
        exit 1
    endif
    # --------------------------------------------------
    tar zxvf $STORAGE/openssl-1.1.1g.tar.gz         && \
    cd $STORAGE/openssl-1.1.1g                      && \
    ./config --prefix=/usr/local/openssl-1.1.1g        \
             --openssldir=/usr/local/openssl-1.1.1g    \
             --shared zlib                          && \
    make && make install
    # --------------------------------------------------
    if ( $? == 0 ) then
        # ##################################################
        # ########## Start: Deploy openssl-1.1.1g ##########
        # --------------------------------------------------
        # ##################################################
        # ########## Backup Self-Contained Binary ##########
        if ( -f "/usr/bin/openssl" && ! -f "/usr/bin/openssl.self.contained" ) then
            mv /usr/bin/openssl /usr/bin/openssl.self.contained
        endif
        # ##################################################
        # ################## Binary File ###################
        if ( ! -d "/usr/local/bin" ) then
            mkdir /usr/local/bin
        endif
        # --------------------------------------------------
        ln -sf /usr/local/openssl-1.1.1g/bin/openssl /usr/local/bin/
        # ##################################################
        # ################## Headers File ##################
        if ( ! -d "/usr/local/include" ) then
            mkdir /usr/local/include
        endif
        # --------------------------------------------------
        if ( ! -d "/usr/local/include/openssl" ) then
            mkdir /usr/local/include/openssl
        endif
        # --------------------------------------------------
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/aes.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1err.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1_mac.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/asn1t.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/asyncerr.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/async.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/bioerr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/bio.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/blowfish.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/bnerr.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/bn.h          /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/buffererr.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/buffer.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/camellia.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/cast.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/cmac.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/cmserr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/cms.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/comperr.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/comp.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/conf_api.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/conferr.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/conf.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/cryptoerr.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/crypto.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/cterr.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ct.h          /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/des.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/dherr.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/dh.h          /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/dsaerr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/dsa.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/dtls1.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ebcdic.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ecdh.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ecdsa.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ecerr.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ec.h          /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/engineerr.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/engine.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/e_os2.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/err.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/evperr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/evp.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/hmac.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/idea.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/kdferr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/kdf.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/lhash.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/md2.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/md4.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/md5.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/mdc2.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/modes.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/objectserr.h  /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/objects.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/obj_mac.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ocsperr.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ocsp.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/opensslconf.h /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/opensslv.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ossl_typ.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pem2.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pemerr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pem.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs12err.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs12.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs7err.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/pkcs7.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rand_drbg.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/randerr.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rand.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rc2.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rc4.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rc5.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ripemd.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rsaerr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/rsa.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/safestack.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/seed.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/sha.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/srp.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/srtp.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ssl2.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ssl3.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/sslerr.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ssl.h         /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/stack.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/storeerr.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/store.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/symhacks.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/tls1.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/tserr.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ts.h          /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/txt_db.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/uierr.h       /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/ui.h          /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/whrlpool.h    /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509err.h     /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509.h        /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509v3err.h   /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509v3.h      /usr/local/include/openssl/
        ln -sf /usr/local/openssl-1.1.1g/include/openssl/x509_vfy.h    /usr/local/include/openssl/
        # ##################################################
        # ################## Library File ##################
        if ( ! -d "/usr/local/lib" ) then
            mkdir /usr/local/lib
        endif
        # --------------------------------------------------
        if ( ! -d "/usr/local/lib/engines-1.1" ) then
            mkdir /usr/local/lib/engines-1.1
        endif
        # --------------------------------------------------
        ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/afalg.so   /usr/local/lib/engines-1.1/
        ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/capi.so    /usr/local/lib/engines-1.1/
        ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/padlock.so /usr/local/lib/engines-1.1/
        # --------------------------------------------------
        ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.a      /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so     /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/libssl.a         /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so        /usr/local/lib/
        ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /usr/local/lib/
        # ##################################################
        # ################## Pkg Config ####################
        if ( ! -d "/usr/local/lib/pkgconfig" ) then
            mkdir /usr/local/lib/pkgconfig
        endif
        # --------------------------------------------------
        ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/libcrypto.pc /usr/local/lib/pkgconfig/
        ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/libssl.pc    /usr/local/lib/pkgconfig/
        ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/openssl.pc   /usr/local/lib/pkgconfig/
        # ##################################################
        # ############ FreeBSD Reload ldconfig #############
        /etc/rc.d/ldconfig restart
        # ##################################################
        # ########### End: Deploy openssl-1.1.1g ###########
    endif
    # --------------------------------------------------
    if ( $? == 0 ) then
        cd $STORAGE && rm -rf $STORAGE/openssl-1.1.1g
    endif
else
    echo "[ SH Note ] Path: /usr/local/openssl-1.1.1g Already Exists."
endif
# ##################################################
# ########### End: 编译安装openssl-1.1.1g ##########

# ----------------------------------------------------------------------------------------------------
# EOF