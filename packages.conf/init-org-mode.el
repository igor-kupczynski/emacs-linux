(setq org-mode-hook
      '(lambda () "Defaults for ORG mode."
	 (flyspell-mode)
	 (auto-fill-mode)
	 (set-fill-column 78)))

(setq auto-mode-alist
      (append '(("\\.txt$" . org-mode)
                ("\\.org$" . org-mode)) auto-mode-alist))

(setq org-directory "~/Dropbox/org")
(defun in-org-dir (item) (concat org-directory "/" item))

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
;; Capture
;;----------------------------------------------------------------------
(setq org-default-notes-file (in-org-dir "main.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      (quote (("t" "todo" entry (file+headline org-default-notes-file "Inbox")
               "* TODO %?\n   Added: %U\n   %a\n")
              ("n" "note" entry (file+headline org-default-notes-file "Inbox")
               "* %?\n   Added %U\n   %a\n")
	      ("a" "appointment" entry (file+headline org-default-notes-file "Calendar")
               "* APPT %?\n   Added: %U\n   %a\n   Scheduled: %^{Scheduled}T\n")
;;              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
;;               "* %?\n%U\n" :clock-in t :clock-resume t)	      )
	      )))


;;----------------------------------------------------------------------
;; Workflow
;;----------------------------------------------------------------------
(setq org-log-done t)

(setq org-agenda-files
      (mapcar 'in-org-dir '("main.org"
			    "projects/maszprawo/main.org")))


(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:20 0:30 1:00 2:00 4:00 6:00 8:00"))))
(setq org-columns-default-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")
(setq org-tag-alist '(("@HOME" . ?h) ("@COMPUTER" . ?c) ("@OFFICE" . ?o) ("@LUNCH" . ?l)
		      ("PROJECT" . ?p) ("READING" . ?r) ))
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "APPT(a)" "|" "DONE(d!)" "CANCELED(c@)")))

(setq org-agenda-custom-commands
      (quote (("H" "Computer and Home Lists"
	       ((agenda)
		(tags-todo "INBOX")
		(tags-todo "@COMPUTER")
		(tags-todo "@HOME")
		(tags-todo "@OFFICE")
		(tags-todo "@LUNCH")
		(tags-todo "READING")))
	      ("D" "Daily Action List"
	       ((agenda "" ((org-agenda-ndays 1)
			    (org-agenda-sorting-strategy
			     (quote ((agenda time-up priority-down tag-up) )))
			    (org-deadline-warning-days 0)
			    )))))))

;;----------------------------------------------------------------------
;; Other
;;----------------------------------------------------------------------
(setq org-startup-indented nil)


;;----------------------------------------------------------------------
;; Mobile org
;;----------------------------------------------------------------------
(setq org-mobile-directory (in-org-dir "mobile"))
(setq org-mobile-inbox-for-pull (in-org-dir "main.org"))

;; http://kenmankoff.com/2012/08/17/emacs-org-mode-and-mobileorg-auto-sync
;; Fork the work (async) of pushing to mobile
;; https://gist.github.com/3111823 ASYNC org mobile push...
(require 'gnus-async) 
;; Define a timer variable
(defvar org-mobile-push-timer nil
  "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")
;; Push to mobile when the idle timer runs out
(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
    (cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
        (run-with-idle-timer
         (* 1 secs) nil 'org-mobile-push)))
;; After saving files, start an idle timer after which we are going to push 
(add-hook 'after-save-hook 
 (lambda () 
   (if (or (eq major-mode 'org-mode) (eq major-mode 'org-agenda-mode))
     (dolist (file (org-mobile-files-alist))
       (if (string= (expand-file-name (car file)) (buffer-file-name))
           (org-mobile-push-with-delay 10)))
     )))
;; Run after midnight each day (or each morning upon wakeup?).
(run-at-time "00:01" 86400 '(lambda () (org-mobile-push-with-delay 1)))
;; Run 1 minute after launch, and once a day after that.
(run-at-time "1 min" 86400 '(lambda () (org-mobile-push-with-delay 1)))

;; watch mobileorg.org for changes, and then call org-mobile-pull
;; http://stackoverflow.com/questions/3456782/emacs-lisp-how-to-monitor-changes-of-a-file-directory
;; (defun install-monitor (file secs)
;;   (run-with-timer
;;    0 secs
;;    (lambda (f p)
;;      (unless (< p (second (time-since (elt (file-attributes f) 5))))
;;        (org-mobile-pull)))
;;    file secs))
;; (defvar monitor-timer (install-monitor (concat org-mobile-directory "/mobileorg.org") 30)
;;   "Check if file changed every 30 s.")

