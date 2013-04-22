(setq org-mode-hook
      '(lambda () "Defaults for ORG mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))

(setq auto-mode-alist
      (append '(("\\.txt$" . org-mode)
                ("\\.org$" . org-mode)) auto-mode-alist))

(setq org-directory "~/Documents/git/org")
(defun in-org-dir (item) (concat org-directory "/" item))

(setq masz-prawo-dir (in-org-dir "projects/maszprawo"))
(defun in-masz-prawo-dir (item) (concat masz-prawo-dir "/" item))


;;----------------------------------------------------------------------
;; Files
;;----------------------------------------------------------------------
(setq org-default-notes-file (in-org-dir "main.org"))
(setq org-default-journal-file (in-org-dir "journal.org"))
(setq org-default-someday-file (in-org-dir "someday.org"))

(setq org-agenda-files
      (mapcar 'in-org-dir '("main.org"
			    "journal.org"
			    "someday.org"
			    "projects/maszprawo/maszprawo.org")))


;;----------------------------------------------------------------------
;; Global keys
;;----------------------------------------------------------------------

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)


;;----------------------------------------------------------------------
;; Publish facilities
;;----------------------------------------------------------------------

(defun igor/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))
(add-hook 'org-babel-after-execute-hook 'igor/display-inline-images 'append)

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

(setq org-confirm-babel-evaluate nil)
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))


(require 'ox-md)
(setq org-publish-project-alist
      '(("masz-prawo-org"
	 :base-directory "~/Documents/git/org/projects/maszprawo/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/git/org/projects/maszprawo_html"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :auto-preamble t
	 )
	("masz-prawo-static"
	 :base-directory "~/Documents/git/org/projects/maszprawo/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Documents/git/org/projects/maszprawo_html"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("masz-prawo" :components ("masz-prawo-org"
				   "masz-prawo-static"))
      ))



;;----------------------------------------------------------------------
;; Capture - refill
;;----------------------------------------------------------------------
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      (quote (("t" "Todo" entry (file+headline org-default-notes-file "Inbox")
               "* TODO %?\n   Added: %U\n   %a\n")
              ("n" "Note" entry (file+headline org-default-notes-file "Inbox")
               "* NOTE %?\n   Added %U\n   %a\n")
	      ("a" "Appointment" entry (file+headline org-default-notes-file "Calendar")
               "* APPT %?\n   Added: %U\n   %a\n   Scheduled: %^{Scheduled}T\n")
	      ("j" "Journal" entry (file+datetree org-default-journal-file)
               "* %?\nAdded: %U\n")
	      ("s" "Somday/Maybe" entry (file+headline org-default-someday-file "Inbox")
               "* SOMEDAY %?\n   Added %U\n   %a\n")
	      )))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

; Exclude DONE state tasks from refile targets
(defun igor/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'igor/verify-refile-target)


;;----------------------------------------------------------------------
;; Workflow
;;----------------------------------------------------------------------
(add-to-list 'org-modules "org-habit")
(require 'org-habit)

(setq org-log-done t)

(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:20 0:30 1:00 2:00 4:00 6:00 8:00"))))
(setq org-columns-default-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")
(setq org-tag-alist '(("@HOME" . ?h) ("@COMPUTER" . ?c) ("@OFFICE" . ?o) ("@ERRAND" . ?e)
		      ("PROJECT" . ?p)
		      ("READING" . ?r) ("PLACE" . ?v)))
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence  "TODO(t)" "SOMEDAY(s/!)" "WAIT(w@/!)" "APPT(a)" "|" "DEFERRED(x@/!)" "DONE(d!)" "CANCELED(c@)")))


(setq org-agenda-tags-todo-honor-ignore-options t)

(setq org-agenda-custom-commands
      (quote (("W" "Current Week"
	       ((agenda)
		(tags-todo "INBOX")
		(tags-todo "@COMPUTER")
		(tags-todo "@HOME")
		(tags-todo "@OFFICE")
		(tags-todo "@LUNCH")
		(tags-todo "READING"))
	       nil
	       ("~/Dropbox/org/mobile/week.html"))
	      ("D" "Daily Action List"
	       ((agenda "" ((org-agenda-ndays 1)
			    (org-agenda-sorting-strategy
			     (quote ((agenda time-up priority-down tag-up) )))
			    (org-deadline-warning-days 0)
			    )))
	       nil
	       ("~/Dropbox/org/mobile/day.html")))))

;;----------------------------------------------------------------------
;; Other
;;----------------------------------------------------------------------
(setq org-startup-indented nil)


;;----------------------------------------------------------------------
;; Sync
;;----------------------------------------------------------------------
(run-at-time "00:59" 3600 'org-save-all-org-buffers)
;; CRON: 0 * * * * ~/bin/org-git-sync.sh >/dev/null


;; ;;----------------------------------------------------------------------
;; ;; Mobile org
;; ;;----------------------------------------------------------------------
;; http://kenmankoff.com/2012/08/17/emacs-org-mode-and-mobileorg-auto-sync
