(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(setq el-get-user-package-directory "~/.emacs.d/packages.conf")

(setq el-get-sources '())

(setq puszczyk-packages
      (append
       '(auto-complete
	 ac-nrepl
	 clojure-mode
	 color-theme-tomorrow
	 el-get
	 helm
	 iedit
	 magit
	 markdown-mode
	 nrepl
	 org-mode
	 paredit
	 pylookup
	 rainbow-delimiters
	 rst-mode
	 session
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync puszczyk-packages)
