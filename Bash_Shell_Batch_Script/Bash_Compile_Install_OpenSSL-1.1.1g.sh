#! /bin/bash
# Create By GF 2023-05-08 14:18

STORAGE=/home/goufeng

function deploy_zlib_1_2_13() {

    # ##################################################
    # ################## Headers File ##################
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
	fi
    # --------------------------------------------------
    ln -sf /usr/local/zlib-1.2.13/include/zconf.h /usr/local/include/
    ln -sf /usr/local/zlib-1.2.13/include/zlib.h  /usr/local/include/
    # ##################################################
    # ################## Library File ##################
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # --------------------------------------------------
    ln -sf /usr/local/zlib-1.2.13/lib/libz.a         /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/libz.so        /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/libz.so.1      /usr/local/lib/
    ln -sf /usr/local/zlib-1.2.13/lib/libz.so.1.2.13 /usr/local/lib/
    # ##################################################
    # ################## Pkg Config ####################
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # --------------------------------------------------
    ln -sf /usr/local/zlib-1.2.13/lib/pkgconfig/zlib.pc /usr/local/lib/pkgconfig/
	# ##################################################
    # ################ Reload ldconfig #################
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        /etc/rc.d/ldconfig restart
        # ----------------------------------------------
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        ldconfig
    fi
    # --------------------------------------------------
    return 0
}

function compile_install_zlib_1_2_13() {

    if [[ ! -d "/usr/local/zlib-1.2.13" ]]; then
	    # --------------------------------------------------
        echo "Compile and Install ( zlib-1.2.13 )? (y/n)"
        read verify
        # --------------------------------------------------
        if [[ "$verify" != "y" ]]; then exit 1; fi
        # --------------------------------------------------
        tar zxvf $STORAGE/zlib-1.2.13.tar.gz        && \
        cd $STORAGE/zlib-1.2.13                     && \
        ./configure --prefix=/usr/local/zlib-1.2.13 && \
        make && make install                        && \
        deploy_zlib_1_2_13                          && \
        cd $STORAGE && rm -rf $STORAGE/zlib-1.2.13
		# --------------------------------------------------
        return 0
    else
        echo "[ SH Note ] Path: ( /usr/local/zlib-1.2.13 ) Already Exists."
        # --------------------------------------------------
        return 0        
    fi
}

function backup_self_contained_openssl() {

    if [[ -f "/usr/bin/openssl" && ! -f "/usr/bin/openssl.self.contained" ]]; then
        mv /usr/bin/openssl /usr/bin/openssl.self.contained; fi
    # --------------------------------------------------
    return 0
}

function deploy_openssl_1_1_1g() {

    backup_self_contained_openssl

    # ##################################################
    # ################## Binary File ###################
    if [[ ! -d "/usr/local/bin" ]]; then
        mkdir /usr/local/bin
    fi
    # --------------------------------------------------
    ln -sf /usr/local/openssl-1.1.1g/bin/openssl /usr/local/bin/
    # ##################################################
    # ################## Headers File ##################
    if [[ ! -d "/usr/local/include" ]]; then
        mkdir /usr/local/include
    fi
    # --------------------------------------------------
    if [[ ! -d "/usr/local/include/openssl" ]]; then
        mkdir /usr/local/include/openssl; fi
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
    if [[ ! -d "/usr/local/lib" ]]; then
        mkdir /usr/local/lib
    fi
    # --------------------------------------------------
	if [[ ! -d "/usr/local/lib/engines-1.1" ]]; then
        mkdir /usr/local/lib/engines-1.1
    fi
    # --------------------------------------------------
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.a      /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so     /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libcrypto.so.1.1 /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.a         /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so        /usr/local/lib/
    ln -sf /usr/local/openssl-1.1.1g/lib/libssl.so.1.1    /usr/local/lib/
	# --------------------------------------------------
	ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/afalg.so   /usr/local/lib/engines-1.1/
    ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/capi.so    /usr/local/lib/engines-1.1/
    ln -sf /usr/local/openssl-1.1.1g/lib/engines-1.1/padlock.so /usr/local/lib/engines-1.1/   
    # ##################################################
    # ################## Pkg Config ####################
    if [[ ! -d "/usr/local/lib/pkgconfig" ]]; then
        mkdir /usr/local/lib/pkgconfig
    fi
    # --------------------------------------------------
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/libcrypto.pc /usr/local/lib/pkgconfig/
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/libssl.pc    /usr/local/lib/pkgconfig/
    ln -sf /usr/local/openssl-1.1.1g/lib/pkgconfig/openssl.pc   /usr/local/lib/pkgconfig/
	# ##################################################
    # ############ Compatible Library File #############
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
    # ##################################################
    # ################ Reload ldconfig #################
    if [[ $TARGET_SYSTEM == "FreeBSD" ]]; then
        /etc/rc.d/ldconfig restart
        # ----------------------------------------------
    elif [[ $TARGET_SYSTEM == "Linux" ]]; then
        ldconfig
    fi
    # --------------------------------------------------
    return 0
}

function compile_install_openssl_1_1_1g() {

    if [[ ! -d "/usr/local/openssl-1.1.1g" ]]; then
        # --------------------------------------------------
        echo "[ SH Opt ]Compile and Install ( openssl-1.1.1g )? (y/n)"
		read verify
        # --------------------------------------------------
        if [[ "$verify" != "y" ]]; then exit 1; fi

        tar zxvf $STORAGE/openssl-1.1.1g.tar.gz         && \
        cd $STORAGE/openssl-1.1.1g                      && \
        ./config --prefix=/usr/local/openssl-1.1.1g        \
                 --openssldir=/usr/local/openssl-1.1.1g    \
                 --shared zlib                          && \
        make && make install                            && \
        deploy_openssl_1_1_1g                           && \
        cd $STORAGE && rm -rf $STORAGE/openssl-1.1.1g   && \
        # --------------------------------------------------
        return 0
    else
    
        echo "[ SH Note ] Path: ( /usr/local/openssl-1.1.1g ) Already Exists."
        # --------------------------------------------------
        return 0        
    fi
}

function main() {

    compile_install_zlib_1_2_13
    compile_install_openssl_1_1_1g
    
    exit 0
}

main
