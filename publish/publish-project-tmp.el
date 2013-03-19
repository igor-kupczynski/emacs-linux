(setq org-publish-project-alist
      '(("tmp-notes"
	 :base-directory "~/tmp/plain-pub/org/"
	 :base-extension "org"
	 :publishing-directory "~/tmp/plain-pub/html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :auto-preamble t)
	("tmp-static"
	 :base-directory "~/plain-pub/tmp/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/tmp/plain-pub/html/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("tmp" :components ("tmp-notes" "tmp-static"))



	;; Jekyll project
	
	("devigor-org"
	 ;; Path to your org files.
	 :base-directory "~/tmp/devigor/_org/"
	 :base-extension "org"

	 ;; Path to your Jekyll project.
	 :publishing-directory "~/tmp/devigor/_posts/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )


	("devigor-static"
	 :base-directory "~/tmp/devigor/_org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/tmp/devigor/static/"
	 :recursive t
	 :publishing-function org-publish-attachment)

	("devigor" :components ("devigor-org" "devigor-static"))

	))










