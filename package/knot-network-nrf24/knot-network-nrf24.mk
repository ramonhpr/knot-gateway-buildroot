################################################################################
#
# knot-network-nrf24
#
################################################################################

KNOT_NETWORK_NRF24_VERSION = test
KNOT_NETWORK_NRF24_SITE = https://github.com/ramonhpr/knot-network-nrf24.git
KNOT_NETWORK_NRF24_SITE_METHOD = git
KNOT_NETWORK_NRF24_INSTALL_STAGING = NO
KNOT_NETWORK_NRF24_INSTALL_TARGET = YES
KNOT_NETWORK_NRF24_DEPENDENCIES = json-c knot-protocol-lib knot-hal-driver libell
KNOT_NETWORK_NRF24_AUTORECONF = YES
# KNOT_NETWORK_NRF24_MAKE = $(MAKE1)

KNOT_NETWORK_NRF24_CONF_OPTS = --prefix=/usr/local --exec-prefix=/usr --enable-debug --enable-static=knotprotocol --disable-optimization
KNOT_NETWORK_NRF24_CONF_ENV = CFLAGS="-I$(@D)/../knot-hal-driver-master" \
			LIBS="	$(@D)/../knot-hal-driver-master/libs/libhallog.a		\
				$(@D)/../knot-hal-driver-master/libs/libhalcommnrf24.a		\
				$(@D)/../knot-hal-driver-master/libs/libhaltime.a		\
				$(@D)/../knot-hal-driver-master/libs/libphy_driver.a		\
				$(@D)/../knot-hal-driver-master/libs/libnrf24l01.a		\
				$(@D)/../knot-hal-driver-master/libs/libspi.a			\
				$(@D)/../knot-hal-driver-master/libs/libhalgpio.a"


define KNOT_NETWORK_NRF24_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(KNOT_NETWORK_NRF24_PKGDIR)/S75nrfd-daemon $(TARGET_DIR)/etc/init.d/
	$(INSTALL) -D -m 0755 $(@D)/src/nrf24.conf $(TARGET_DIR)/etc/dbus-1/system.d/
endef

KNOT_NETWORK_NRF24_POST_INSTALL_TARGET_HOOKS += KNOT_NETWORK_NRF24_INSTALL_INIT_SCRIPT

$(eval $(autotools-package))
