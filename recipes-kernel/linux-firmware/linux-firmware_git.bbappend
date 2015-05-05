BRCM_FWDIR = "/lib/firmware/brcm"

# This is kind of a hack, but I'm not quite sure how else to get these files
#  where they need to be, since linux-firmware's do_install() does a fairly
#  blunt "cp -r * ${D}/lib/firmware/".
SRC_URI += " \
  file://brcmfmac4329-sdio.txt;subdir=git/brcm \
  file://brcmfmac4330-sdio.txt;subdir=git/brcm \
"

FILES_${PN}-bcm4329 += " \
  ${BRCM_FWDIR}/brcmfmac4329-sdio.txt \
"

FILES_${PN}-bcm4330 += " \
  ${BRCM_FWDIR}/brcmfmac4330-sdio.txt \
"

FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
