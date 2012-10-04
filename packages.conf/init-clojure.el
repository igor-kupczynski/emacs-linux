(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(setq auto-mode-alist (cons '("\\.cljs" . clojure-mode) auto-mode-alist))
