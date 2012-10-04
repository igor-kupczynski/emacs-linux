;; Wordcount function - uber usefull
(defun count-words (&optional begin end)
  "count words between BEGIN and END (region); if no region
defined, count words in buffer"
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
      (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))


;; turn on paren match highlighting
(show-paren-mode 1)

;; show column numbers
(setq column-number-mode t)

;; RET -> new line and indent
(defun set-newline-and-indent ()
      (local-set-key (kbd "RET") 'newline-and-indent))

;; yes-no -> y-n
(fset 'yes-or-no-p 'y-or-n-p)

;; Start-server
(server-start)

;; narrow to region
(put 'narrow-to-region 'disabled nil)

;; newline and indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; open compressed files
(auto-compression-mode t)

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; ido
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))


;; Backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Paths
(setq exec-path (append exec-path (list "~/bin" )))
(setenv "PATH" (concat "~/bin:" (getenv "PATH")))


;; Ispell dict
(setq ispell-dictionary "english")
