#! /bin/tcsh
# Create By GF 2023-05-28 11:18

# ################################################################################
# ############### Start: FreeBSD 13.1 Installing Software From CD ################
# --------------------------------------------------------------------------------
# ################################################################################
# ################### The DVD Mount Directory Must Be "/dist" ####################
set Step = 0
if ( ! -d "/dist" ) then
    mkdir -p /dist                                                              && \
    echo "[ SH Note ] Directory: Successfully Created The ( /dist ) Directory." && \
    set Step = 1
endif
# ################################################################################
# ############################# Mount CD To "/dist" ##############################
if ( $Step == 1 ) then
    mount -t cd9660 /dev/cd0 /dist                                  && \
    echo "[ SH Note ] Mount: CD Successfully Mounted To ( /dist )." && \
    set Step = 2
else
    exit 1
endif
# ################################################################################
# ############## Configure The Environment Variable For "REPOS-DIR" ##############
if ( $Step == 2 ) then
    setenv REPOS_DIR=/dist/packages/repos                                                    && \
    echo "[ SH Note ] environment: Successfully Set The ( REPOS-DIR ) Environment Variable." && \
else
    exit 1
endif
# --------------------------------------------------------------------------------
# Explanation:
# 1) Using REPOS_ DIR can specify the location of the pkg source;
# 2) By default, mount the DVD/CD to/dist, and/dist will be changed according to the actual mounting situation;
# 3) After setting this variable, not only can bsdconfig be used, but you can also directly pkg install the software package. pkg will first find it on the DVD.
# --------------------------------------------------------------------------------
# ################################################################################
# #### Example : Direct Installation Through Environment Variable "REPOS-DIR" ####
# --------------------------------------------------------------------------------
# Simply Execute The Following Command:
#
# env REPOS_DIR=/dist/packages/repos pkg install gcc10
#
# env REPOS_DIR=/dist/packages/repos pkg install xorg
#
# env REPOS_DIR=/dist/packages/repos pkg install gnome3
# --------------------------------------------------------------------------------
# ################################################################################
# ################ End: FreeBSD 13.1 Installing Software From CD #################

# ----------------------------------------------------------------------------------------------------
# EOF