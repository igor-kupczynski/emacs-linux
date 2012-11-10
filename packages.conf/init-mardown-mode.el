(setq markdown-mode-hook
      '(lambda () "Defaults for markdown mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))
