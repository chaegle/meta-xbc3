# Insert some copyright statement here

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://99-g_cdc.rules \
"

do_install_append() {
        # Install udev rules for g_cdc module 
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${WORKDIR}/99-g_cdc.rules ${D}${sysconfdir}/udev/rules.d/

        # Remove no longer needed XBee serial rule 
        rm -f ${D}${base_libdir}/udev/rules.d/78-mm-digi-xbee-cellular.rules 
}

# autoload g_cdc module, if installed
KERNEL_MODULE_AUTOLOAD += "g_cdc"

