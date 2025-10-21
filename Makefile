GUIX_FLAGS := --max-jobs=8 --cores=4

install: home.scm channels.scm
	guix time-machine $(GUIX_FLAGS) --channels=channels.scm -- home reconfigure $<

test: home.scm channels.scm
	guix time-machine $(GUIX_FLAGS) --channels=channels.scm -- home container $<

update:
	guix pull $(GUIX_FLAGS)
	rm channels.scm

.PHONY: reconfigure, update, test

channels.scm:
	guix describe --format=channels > channels.scm
