(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (guix packages)
             (guix git-download)
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
  (append
  (specifications->packages
    (list  "glibc-locales"
           "nss-certs"

           "grep"
           "git"
           "bash-completion"
           "htop"
           "tmux"
           "ripgrep"
           "fd"
           "fzf"
           "zoxide"
           "bc"
           "direnv"
           "fastfetch"
           "starship"
           "neovim-nightly"

           "fuzzel"
           "zathura-pdf-mupdf"
           "zathura"
           "ungoogled-chromium"))))

(home-environment
  (packages `(,@core))

  (services
    (append (list bash-service
                  dotfiles-service
                  (service home-niri-service-type))
            %base-home-services)))
