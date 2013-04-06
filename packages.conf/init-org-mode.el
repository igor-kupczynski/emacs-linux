(setq org-mode-hook
      '(lambda () "Defaults for ORG mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))

(setq auto-mode-alist
      (append '(("\\.txt$" . org-mode)
                ("\\.org$" . org-mode)) auto-mode-alist))

;;----------------------------------------------------------------------
;; Global keys
;;----------------------------------------------------------------------

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)


;;----------------------------------------------------------------------
;; Publish facilities
;;----------------------------------------------------------------------

(require 'ox-md)

;; projects are set up there
(add-to-list 'load-path "~/.emacs.d/publish/")
(load "publish-project-tmp.el")


;;----------------------------------------------------------------------
;; Workflow
;;----------------------------------------------------------------------
(setq org-log-done t)

