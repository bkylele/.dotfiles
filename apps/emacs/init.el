;; Allow higher threshold before garbage collection (100MB)
(setq gc-cons-threshold (* 100 1024 1024))

;;; ==================================
;;;             General
;;; ==================================

(setq inhibit-startup-message t)
(setq visible-bell nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 't)
(blink-cursor-mode -1)
(set-face-attribute 'default nil :font "Noto Sans Mono-12")
(load-theme 'modus-vivendi-tinted :no-confirm)

;; 'y' or 'n' answers
(setq use-short-answers t)

(setq history-length 25)
(savehist-mode 1)

;; Reload buffers when the underlying file has changed
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Tidy up
(let ((emacs-data-dir "~/.local/state/emacs/"))
  (setq savehist-file (expand-file-name "history" emacs-data-dir))
  (setq bookmark-default-file (expand-file-name "bookmarks" emacs-data-dir))
  (setq recentf-save-file (expand-file-name "recentf" emacs-data-dir))
  (setq tramp-backup-directory-alist '(("." . emacs-data-dir))))

(setq make-backup-files nil)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;;; ==================================
;;;             Packages
;;; ==================================

(guix-emacs-autoload-packages)

;;;
;;; Evil mode
;;;

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode)

  (evil-define-key '(visual) 'global (kbd "SPC y") (kbd "\" + y"))

  (evil-define-key '(normal visual) 'global (kbd "SPC u") 'undo-tree-visualize)

  (evil-define-key '(normal visual) 'global (kbd "SPC p p") 'dashboard-open)
  (evil-define-key '(normal visual) 'global (kbd "SPC p f") 'find-file)
  (evil-define-key '(normal visual) 'global (kbd "SPC p v") (kbd "SPC p f RET"))
  (evil-define-key '(normal visual) 'global (kbd "SPC b") 'switch-to-buffer)

  (evil-define-key '(normal visual) 'global (kbd "SPC t") 'vterm)

  (evil-define-key '(normal visual) 'global (kbd "SPC SPC") 'execute-extended-command))

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-numbers
  :config
  (evil-define-key '(normal visual) 'global (kbd "C-+") 'evil-numbers/inc-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "C--") 'evil-numbers/dec-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
  (evil-define-key '(normal visual) 'global (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental))

;;;
;;; Look and Feel
;;;

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-context t)
  (setq dashboard-vertically-center-content t))

(use-package rainbow-delimiters)

;;;
;;; Misc
;;;

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-history-directory-alist '(("." . "~/.local/emacs/state/undo/"))))

(use-package vterm)


;;;
;;; Projects and IDE features
;;;


;; (use-package lsp-mode
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; (XXX-mode . lsp)  ;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (c++-mode . "clangd"))
;;   :commands lsp)

;; (use-package lsp-ui
;;   :commands lsp-ui-mode)

;; ;; if you are helm user
;; (use-package helm-lsp
;;   :ensure t
;;   :commands helm-lsp-workspace-symbol)

;; ;; if you are ivy user
;; (use-package lsp-ivy
;;   :ensure t
;;   :commands lsp-ivy-workspace-symbol)

;; (use-package lsp-treemacs
;;   :ensure t
;;   :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; ;; optional if you want which-key integration
;; (use-package which-key
;;     :config
;;     (which-key-mode))

