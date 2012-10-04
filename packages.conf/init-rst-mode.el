(setq rst-mode-hook
      '(lambda () "Defaults for RST mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))

(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)) auto-mode-alist))
