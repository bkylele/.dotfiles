(provide 'ui)

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Don't open a new window for certain actions
(setq use-dialog-box nil)   

;; Disable menu bar
(menu-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Disable tool bar
(tool-bar-mode -1)

;; Set font
(set-frame-font "-JB-JetBrainsMono Nerd Font-medium-normal-normal-*-27-*-*-*-m-0-iso10646-1" nil t)
