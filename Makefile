VERSION_MAJOR := 2
VERSION_MINOR := 4

define newline


endef

define MCMETA
{
    "pack": {
        "pack_format": $(VERSION_MAJOR),
        "description": "DeathSwap $(VERSION_MAJOR).$(VERSION_MINOR) by nfitzen"
    }
}

endef

files := data/ pack.mcmeta pack.mcmeta.license README.md LICENSE

releases/DeathSwap-v$(VERSION_MAJOR).$(VERSION_MINOR).zip: $(files)
	mkdir releases
	echo -e '$(subst $(newline),\n,$(MCMETA))'> pack.mcmeta
	zip -r releases/DeathSwap-v$(VERSION_MAJOR).$(VERSION_MINOR).zip $(files)
