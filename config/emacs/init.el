;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 50 1000 1000))

;;; ==================================
;;;             General
;;; ==================================
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setq inhibit-startup-message t)
(setq visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 't)

(set-face-attribute 'default nil :font "Jetbrains Mono NL-10")


;;; ==================================
;;;             Packages
;;; ==================================

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; (package-initialize)
;; (package-refresh-contents)

(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))


;;;
;;; Theme and appearance
;;;
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-context t)
  (setq dashboard-vertically-center-content t)
  )


;;;
;;; Projects and IDE features
;;;
(use-package helm
  :ensure t
  :config
  (setq helm-M-x-fuzzy-match t)
  (helm-mode))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2))

(use-package flymake
  :ensure t
  :config
  (setq flymake-fringe-indicator-position 'right-fringe
        flymake-suppress-zero-counters t
        flymake-show-diagnostics-at-point 'except-flymake)
  (set-face-attribute 'flymake-error nil :underline '(:color "red" :style wave))
  (set-face-attribute 'flymake-warning nil :underline '(:color "yellow" :style wave))
  (set-face-attribute 'flymake-note nil :underline '(:color "blue" :style wave)))

(use-package eldoc-box
  :ensure t)

(use-package eglot
  :defer t
  :hook
  ((eglot-managed-mode . company-mode)
   (eglot-managed-mode . fly-make-mode)
   (eglot-managed-mode . eldoc-box-hover-mode))
  :config
  (add-to-list 'eglot-server-programs
	       '(java-mode . ("jdtls"))
	       '(rust-mode . ("rust-analyzer")))

  (setq eglot-autoshutdown t
	eglot-send-changes-idle-time 0.2
	eglot-ignored-server-capabilities '(:documentFormattingProvider)))

;; Add hooks for each programming language
(add-hook 'java-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)


;;;
;;; Misc
;;;

(use-package vterm
  :ensure t)

(use-package undo-fu
  :ensure t)

(use-package undo-fu-session
  :ensure t
  :config
  (setq undo-fu-session-directory "~/.cache/emacs/undo-fu-session/")
  (setq undo-fu-session-incompatible-files '("\\.gpg$" "/COMMIT_EDITMSG$"))
  (global-undo-fu-session-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2))


;;;
;;; Evil mode and keybinds
;;;
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode)

  (define-key evil-normal-state-map (kbd "u") 'undo-fu-only-undo)
  (define-key evil-normal-state-map (kbd "C-r") 'undo-fu-only-redo)

  (evil-set-leader nil (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'helm-M-x)
  
  (evil-define-key 'normal 'global (kbd "<leader>fed") (lambda () (interactive) (find-file user-init-file)))

  (evil-define-key 'normal 'global (kbd "<leader>ff") 'helm-find-files)
  (evil-define-key 'normal 'global (kbd "<leader>pf") 'helm-projectile-find-file)
  (evil-define-key 'normal 'global (kbd "<leader>ps") 'helm-projectile-grep)
  (evil-define-key 'normal 'global (kbd "<leader>pp") 'helm-projectile-switch-project)
  
  (evil-define-key 'normal 'global (kbd "<leader>bb") 'helm-buffers-list)
  )

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "jk"))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;; Reset gc to default threshold
(setq gc-cons-threshold (* 2 1000 1000))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c46651ab216eb31e699be1bd5e6df8229b08005b534194c1ea92519b09661d71"
     default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
