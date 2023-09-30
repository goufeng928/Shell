#! /bin/tcsh
# Create By GF 2023-05-22 20:33

# 2023-05-23 19:21:57

# ----------------------------------------------------------------------------------------------------

# Valid For All Users: In "/etc/profile" Add The Following Categories.
# Valid For Current Users: In "/home/.cshrc" or "/home/.csh_profile" Add The Following Categories.
# Direct Running: Need "source ./script.sh"

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ################## Setting PATH ##################
set Verify_PATH = `printenv PATH`
# --------------------------------------------------
if ( "$Verify_PATH" == "" ) then
    # ##################################################
    # ############# Executable Binary Path #############
    setenv PATH /usr/local/bin
else
    # ##################################################
    # ############# Executable Binary Path #############
    setenv PATH {$PATH}:/usr/local/bin
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ############# Setting C_INCLUDE_PATH #############
set Verify_C_INCLUDE_PATH = `printenv C_INCLUDE_PATH`
# --------------------------------------------------
if ( "$Verify_C_INCLUDE_PATH" == "" ) then
    # ##################################################
    # ################ GCC Include Path ################
    setenv C_INCLUDE_PATH /usr/local/include
else
    # ##################################################
    # ################ GCC Include Path ################
    setenv C_INCLUDE_PATH {$C_INCLUDE_PATH}:/usr/local/include
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ########### Setting CPLUS_INCLUDE_PATH ###########
set Verify_CPLUS_INCLUDE_PATH = `printenv CPLUS_INCLUDE_PATH`
# --------------------------------------------------
if ( "$Verify_CPLUS_INCLUDE_PATH" == "" ) then
    # ##################################################
    # ################ G++ Include Path ################
    setenv CPLUS_INCLUDE_PATH /usr/local/include
else
    # ##################################################
    # ################ G++ Include Path ################
    setenv CPLUS_INCLUDE_PATH {$CPLUS_INCLUDE_PATH}:/usr/local/include
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ############ Setting LD_LIBRARY_PATH #############
set Verify_LD_LIBRARY_PATH = `printenv LD_LIBRARY_PATH`
# --------------------------------------------------
if ( "$Verify_LD_LIBRARY_PATH" == "" ) then
    # ##################################################
    # ########### Link Dynamic Library Path ############
    setenv LD_LIBRARY_PATH /usr/local/lib
else
    # ##################################################
    # ########### Link Dynamic Library Path ############
    setenv LD_LIBRARY_PATH {$LD_LIBRARY_PATH}:/usr/local/lib
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ############## Setting LIBRARY_PATH ##############
set Verify_LIBRARY_PATH = `printenv LIBRARY_PATH`
# --------------------------------------------------
if ( "$Verify_LIBRARY_PATH" == "" ) then
    # ##################################################
    # ############ Link Static Library Path ############
    setenv LIBRARY_PATH /usr/local/lib
else
    # ##################################################
    # ############ Link Static Library Path ############
    setenv LIBRARY_PATH {$LIBRARY_PATH}:/usr/local/lib
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ############ Setting PKG_CONFIG_PATH #############
set Verify_PKG_CONFIG_PATH = `printenv PKG_CONFIG_PATH`
# --------------------------------------------------
if ( "$Verify_PKG_CONFIG_PATH" == "" ) then
    # ##################################################
    # ################ Pkg Config Path #################
    setenv PKG_CONFIG_PATH /usr/local/lib/pkgconfig
else
    # ##################################################
    # ################ Pkg Config Path #################
    setenv PKG_CONFIG_PATH {$PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig
endif

# ----------------------------------------------------------------------------------------------------

# ##################################################
# ############ FreeBSD Reload ldconfig #############
/etc/rc.d/ldconfig restart

# ----------------------------------------------------------------------------------------------------
# EOF