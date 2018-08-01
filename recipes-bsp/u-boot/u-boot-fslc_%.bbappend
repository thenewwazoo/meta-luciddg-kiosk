# Place example/template config files on the FAT partition.
#
# WARNING: Fuckery rating: 9/10
#
# For this to work, we must add wifi.conf and browser.conf to the BOOT_SCRIPTS
#  variable defined in meta-fsl-arm-extra/conf/machine/cubox-i.conf and used
#  in meta-fsl-arm/classes/image_types_fsl.bbclass. We cannot do that from 
#  within the layer, so it's done in local.conf, in a totally different repo. 
#  Bitbake is not ready for prime time, obviously.

SRC_URI += " \
  file://wifi.conf \
  file://browser.conf \
  "

do_deploy_append () {
    install ${WORKDIR}/wifi.conf ${DEPLOYDIR}/wifi.conf
    install ${WORKDIR}/browser.conf ${DEPLOYDIR}/browser.conf
}

FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
