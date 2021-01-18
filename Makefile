PKG_DIRS := $(shell find script-pkg -maxdepth 1 -mindepth 1 -type d)
GARBAGE_DIRS := $(foreach DIR,$(PKG_DIRS),$(addprefix $(DIR)/,node_modules)) node_modules
GARBAGE_FILES := package-lock.json

.PHONY : rebuild all clean run clean_run install_pkgs

PKGS := $(find script-pkg -maxdepth 1 -mindepth 1 -type d)
clean_run: rebuild run

run :
	bin/hubot



rebuild: clean all

install_pkgs :
	npm install $(PKG_DIRS) --only=prod --force


all :
	npm install --only=prod

clean :
	@echo rm -rf $(GARBAGE_DIRS) $(GARBAGE_FILES)
