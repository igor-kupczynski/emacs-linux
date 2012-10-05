;; General
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'projectile-on)

;; Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; Elisp
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)



