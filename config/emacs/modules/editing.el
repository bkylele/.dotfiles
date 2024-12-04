(provide 'editing)

;; Relative line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Set min scroll margin to 8 lines
(setq scroll-margin 8)

;; Highlight parenthesis
(show-paren-mode 1)

;; Remove suspend bind
(global-unset-key (kbd "C-z"))

;; C programming
(setq-default c-basic-offset 4)

;; No backup files
(setq make-backup-files nil)


;; Turn off line numbers for image viewing modes
(defun bugfix-display-line-numbers--turn-on (fun &rest args)
  "Avoid 'display-line-numbers-mode' in 'image-mode' and related. Around advice for FUN with ARGS."
  (unless (derived-mode-p 'image-mode 'doc-view-mode 'pdf-view-mode)
    (apply fun args)))

(advice-add 'display-line-numbers--turn-on :around #'bugfix-display-line-numbers--turn-on)
