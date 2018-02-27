################################################################################
#
# knot-protocol-lib
#
################################################################################

KNOT_PROTOCOL_LIB_VERSION = test
KNOT_PROTOCOL_LIB_SITE = https://github.com/ramonhpr/knot-protocol-source.git
KNOT_PROTOCOL_LIB_SITE_METHOD = git
KNOT_PROTOCOL_LIB_INSTALL_STAGING = YES
KNOT_PROTOCOL_LIB_INSTALL_TARGET = YES
KNOT_SERVICE_APP_AUTORECONF = YES
KNOT_SERVICE_APP_CONF_OPTS = --enable-maintainer-mode --enable-debug --sysconfdir=/etc

define KNOT_PROTOCOL_LIB_BOOTSTRAP
	cd $(@D) &&  ./bootstrap 
endef

KNOT_PROTOCOL_LIB_POST_PATCH_HOOKS += KNOT_PROTOCOL_LIB_BOOTSTRAP

$(eval $(autotools-package))
