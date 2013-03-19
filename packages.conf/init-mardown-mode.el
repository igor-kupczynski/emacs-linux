(setq markdown-mode-hook
      '(lambda () "Defaults for markdown mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))

(setq auto-mode-alist
      (append '(("\\.md$" . markdown-mode)) auto-mode-alist))

