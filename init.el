;; Look and feel
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(set-default-font "DejaVu Sans Mono-10")
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-10"))
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t) (ispell-dictionary . "polish") (encoding . utf-8) (ispell-local-dictionary . en_GB) (ispell-local-directory . "polish") (ispell-local-dictionary . polish) (dictionary . polish)))))


;; Load path
(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d/modules.local")
       (normal-top-level-add-subdirs-to-load-path))

;; Init packages
(load-library "packages.el")


;; Text
;;(load-library "puszczyk-org.el")
;;(load-library "puszczyk-rst.el")


;; Misc
;;(load-library "puszczyk-misc.el")
