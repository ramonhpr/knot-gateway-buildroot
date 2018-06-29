################################################################################
#
# tayga
#
################################################################################

TAYGA_VERSION = 0.9.2
TAYGA_SITE = http://www.litech.org/tayga/
TAYGA_SOURCE = tayga-$(TAYGA_VERSION).tar.bz2
TAYGA_INSTALL_STAGING = NO
TAYGA_INSTALL_TARGET = YES
TAYGA_AUTORECONF = YES

$(eval $(autotools-package))
