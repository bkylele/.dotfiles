(provide 'packages)

;; Undo tree
(require 'undo-tree)
(setq undo-tree-history-directory-alist '(("." . "~/.cache/emacs/undo")))
(global-undo-tree-mode)

;; Beacon
(require 'beacon)
(setq beacon-size 80)
(beacon-mode 1)


