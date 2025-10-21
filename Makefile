reconfigure: home.scm
	guix home reconfigure $<

test: home.scm
	guix home container $<

.PHONY: reconfigure, test
