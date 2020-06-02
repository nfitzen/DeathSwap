# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

SHELL = /bin/sh

VERSION := $(strip $(shell git describe --tags --abbrev=0))

BUILD_INFO := $(strip $(shell git rev-parse --short HEAD))

REV := $(VERSION)+$(BUILD_INFO)

ifneq (, $(strip $(shell git status --porcelain 2>/dev/null)))
	REV := $(REV)-dirty
endif

define newline


endef

define MCMETA
{
    "pack": {
        "pack_format": 2,
        "description": "DeathSwap $(REV) by nfitzen"
    }
}

endef

files := data/ pack.mcmeta pack.mcmeta.license README.md LICENSE

releases/DeathSwap-$(REV).zip: $(files)
	if [! -d 'build']; then mkdir build; fi
	if [! -d 'releases']; then mkdir releases; fi
	echo '$(subst $(newline),\n,$(MCMETA))'> pack.mcmeta
	zip -r releases/DeathSwap-$(REV).zip $(files)
