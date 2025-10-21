install: home.scm channels.scm
	guix time-machine --channels=channels.scm -- guix home reconfigure $<

test: home.scm channels.scm
	guix time-machine --channels=channels.scm -- guix home container $<

update:
	guix pull

.PHONY: reconfigure, update, test

channels.scm:
	guix describe --format=channels > channels.scm
