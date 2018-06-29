################################################################################
#
# otbr - openthread border router
#
################################################################################

OTBR_VERSION = master
OTBR_SITE = https://github.com/openthread/borderrouter.git
OTBR_SITE_METHOD = git
OTBR_INSTALL_STAGING = NO
OTBR_INSTALL_TARGET = YES
OTBR_DEPENDENCIES = boost avahi mbedtls libcoap wpantund tayga
OTBR_AUTORECONF = YES
OTBR_CONF_OPTS = --enable-debug --disable-optimization --enable-static=no

define OTBR_BOOTSTRAP
	cd $(@D) &&  ./bootstrap
endef

OTBR_PRE_CONFIGURE_HOOKS += OTBR_BOOTSTRAP

$(eval $(autotools-package))
