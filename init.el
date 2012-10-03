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
 '(safe-local-variable-values (quote ((ispell-dictionary . "polish") (encoding . utf-8) (ispell-local-dictionary . en_GB) (ispell-local-directory . "polish") (ispell-local-dictionary . polish) (dictionary . polish)))))


;; Load path
(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/packages")
(progn (cd "~/.emacs.d/packages")
       (normal-top-level-add-subdirs-to-load-path))

;; Init packages
;;(load-library "puszczyk-packages.el")

;; Theme
;;(load-library "puszczyk-theme.el")

;; Text
;;(load-library "puszczyk-org.el")
;;(load-library "puszczyk-rst.el")

;; Programming
;;(load-library "puszczyk-clojure.el")

;; Misc
;;(load-library "puszczyk-misc.el")
