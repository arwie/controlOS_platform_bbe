# -*-makefile-*-
#
# Copyright (C) 2021 by Artur Wiebe <artur@4wiebe.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_RTL8723BU) += rtl8723bu

#
# Paths and names and versions
#
RTL8723BU_VERSION	:= 49cb04d796d44debe965c1597f397f34ae277dbc
RTL8723BU_MD5		:= 401c8bfe8b079fc35ed97140e57b21c9
RTL8723BU			:= rtl8723bu-$(RTL8723BU_VERSION)
RTL8723BU_SUFFIX	:= zip
RTL8723BU_URL		:= https://github.com/lwfinger/rtl8723bu/archive/$(RTL8723BU_VERSION).$(RTL8723BU_SUFFIX)
RTL8723BU_SOURCE	:= $(SRCDIR)/$(RTL8723BU).$(RTL8723BU_SUFFIX)
RTL8723BU_DIR		:= $(BUILDDIR)/$(RTL8723BU)
RTL8723BU_LICENSE	:= unknown
RTL8723BU_LICENSE_FILES	:=

ifneq ($(filter $(if $(PTX_COLLECTION),y,y m),$(PTXCONF_RTL8723BU)),)
$(STATEDIR)/kernel.targetinstall.post: $(STATEDIR)/rtl8723bu.targetinstall
endif

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

RTL8723BU_WRAPPER_BLACKLIST = $(KERNEL_WRAPPER_BLACKLIST)

RTL8723BU_CONF_TOOL := NO

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

RTL8723BU_MAKE_OPT = \
	$(KERNEL_MODULE_OPT) \
	-C $(KERNEL_DIR) \
	M=$(RTL8723BU_DIR) \
	modules

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/rtl8723bu.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/rtl8723bu.targetinstall:
	@$(call targetinfo)
	@$(call compile, RTL8723BU, $(RTL8723BU_MAKE_OPT)_install)
	@$(call touch)

# vim: syntax=make
