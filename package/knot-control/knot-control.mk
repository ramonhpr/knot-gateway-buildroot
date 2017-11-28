################################################################################
#
# knot-control
#
################################################################################

KNOT_CONTROL_VERSION = master
KNOT_CONTROL_SITE_METHOD = git
KNOT_CONTROL_SITE = https://github.com/CESARBR/knot-control-source.git
KNOT_CONTROL_DEPENDENCIES = nodejs

define KNOT_CONTROL_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/knot-control-source
	mkdir -p $(TARGET_DIR)/usr/local/
	mkdir -p $(TARGET_DIR)/usr/local/bin/
	mkdir -p $(TARGET_DIR)/usr/local/bin/knot-control-source
	cd $(@D) && $(NPM) install && $(NPM) run build && $(NPM) prune --production
	cp -R $(@D)/. $(TARGET_DIR)/usr/local/bin/knot-control-source
endef

define KNOT_CONTROL_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0755 $(KNOT_CONTROL_PKGDIR)/S55knot-control-daemon $(TARGET_DIR)/etc/init.d/
	$(INSTALL) -D -m 0755 $(KNOT_CONTROL_PKGDIR)/knot-control $(TARGET_DIR)/usr/local/bin/
endef

KNOT_CONTROL_POST_INSTALL_TARGET_HOOKS += KNOT_CONTROL_INSTALL_INIT_SCRIPT

$(eval $(generic-package))
