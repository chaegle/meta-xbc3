OpenEmbedded/Yocto Digi Embedded XBC3 Layer
===========================================

This layers enables support for the Digi XBee3 Cellular LTE-M and NB-IoT (XBC3) modems, 
for use with ModemManager, when configured for 'USB Direct' mode.

This layers does the following. 

1. Autoloads the g_cdc kernel module.
2. Creates a rule that enables the enumeration of the XBC3's tty devices.
3. Removes the, unnecessary, 78-mm-digi-xbee-cellular.rules (needed in support 
of serial operation) file. 

These files are only necessary if/when using the modem in 'USB Direct' mode.

NOTE: This meta is not required when working with DEY-2.6 (Thud).

SUPPORTED EMBEDDED PLATFORMS
----------------------------

  * Digi ConnectCore 6UL SBC Pro
    * [Digi P/N CC-WMX6UL-KIT](https://www.digi.com/products/embedded-systems/single-board-computers/connectcore-for-i-mx6ul-sbc-pro)
  * Digi ConnectCore 6 SBC
    * [Digi P/N CC-WMX6-KIT](https://www.digi.com/products/embedded-systems/single-board-computers/connectcore-6-sbc)
  * Digi ConnectCore 6 Quad Plus SBC

SUPPORTED CELLULAR MODEMS
-------------------------

  * Digi XBee3 Cellular LTE-M modem
    * [Digi P/N XK3-C-A2-UT-U](https://www.digi.com/products/xbee-rf-solutions/embedded-cellular-modems/xbee3-cellular-lte-m)
  * Digi XBee3 Cellular NB-IOT modem
    * [Digi P/N XK3-C-N1-UT-E](https://www.digi.com/products/xbee-rf-solutions/embedded-cellular-modems/xbee3-cellular-nb-iot)

HARDWARE CONFIGURATION
----------------------

By default, the XBC3 modem is configured for transparent, serial, operation. In order for
ModemManager to able to utilize this device it must be configured for '[USB Direct](https://www.digi.com/resources/documentation/Digidocs/90002258/#Concepts/c_mode_usb_direct_lte-m.htm?Highlight=usb%20direct)' mode. 


INSTALLATION
------------

1. Install Digi Embedded Yocto (DEY) distribution (dey-2.4-r1).

    https://github.com/digi-embedded/dey-manifest#installing-digi-embedded-yocto

2. Clone *meta-xbc3* Yocto layer under the Digi Embedded Yocto source
   directory.

        #> cd <DEY-INSTALLDIR>/sources
        #> git clone https://github.com/chaegle/meta-xbc3.git -b rocko

CREATE AND BUILD A PROJECT
--------------------------

1. Create a project for ConnectCore 6UL SBC Pro.

        #> mkdir <project-dir>
        #> cd <project-dir>
        #> . <DEY-INSTALLDIR>/mkproject.sh -p <target_platform>

2. Add the *meta-xbc3* layer to the project's *bblayers.conf*
  configuration file.

        #> bitbake-layers add-layer <DEY-INSTALLDIR>/sources/meta-xbc3

3. Build the images.

        #> bitbake dey-image-qt

4. Deploy the images.

