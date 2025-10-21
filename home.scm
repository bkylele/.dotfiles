(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (guix packages)
             (gnu packages shells)
             (gnu home services)


	     (gnu home services niri)
	     (gnu home services dotfiles)
             (gnu home services shells))

(define bash-service
  (service home-bash-service-type
           (home-bash-configuration
            (bashrc (list (local-file "files/.bashrc" "bashrc")))
            (bash-profile (list (local-file "files/.bash_profile" "bash_profile"))))))

(define dotfiles-service
  (service home-dotfiles-service-type
	   (home-dotfiles-configuration
	    (excluded '(".bashrc" ".bash_profile")) ;; handled by separate service
	    (directories '("files")))))

(define core
  (specifications->packages
   (list  "glibc-locales"
	  "nss-certs"

	  "grep"
	  "git"
	  "bash-completion"
	  "htop"
	  "tmux"
	  "vim"
	  "ripgrep"
	  "fd"
	  "fzf"
	  "zoxide"
	  "bc"
	  "swi-prolog"
	  "fastfetch"

	  "fuzzel"
	  )))

(define emacs-custom
  (specifications->packages
   (list "emacs"
	 "emacs-evil"
	 "emacs-evil-collection"
	 "emacs-evil-commentary"
	 "emacs-evil-numbers"
	 "emacs-evil-surround"
	 "emacs-magit"
	 "emacs-undo-tree"
	 "emacs-dashboard"
	 "emacs-rainbow-delimiters"
	 "emacs-doom-modeline"
	 "emacs-vterm")))

(home-environment
 (packages `(,@core
	     ,@emacs-custom))

 (services
  (append (list bash-service
		dotfiles-service
		(service home-niri-service-type))
	  %base-home-services)))
