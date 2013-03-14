(setq org-mode-hook
      '(lambda () "Defaults for ORG mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))

(setq auto-mode-alist
      (append '(("\\.txt$" . org-mode)
                ("\\.org$" . org-mode)) auto-mode-alist))

;;----------------------------------------------------------------------
;; Emacs as a task paper
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(setq org-startup-folded nil)

;; Workflow
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(p)" "|" "DONE(d)")
	(sequence "WAIT(w)" "|" "CANCELED(c)")))


;; Set the agenda
(ignore-errors
  (load-file "~/.emacs.d/custom/org-agenda.el"))


;; Clock
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


