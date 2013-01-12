(setq jedi:setup-keys t)

(setq jedi:server-args
      '("--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/django_extensions-1.0.1-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/ipython-0.13.1-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/Markdown-2.2.1-py2.7.egg"
	"--sys-path" "/usr/lib/python2.7/dist-packages/PIL"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/psycopg2-2.4.5-py2.7-linux-x86_64.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/pygraphviz-1.1-py2.7-linux-x86_64.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/pylibmc-1.2.3-py2.7-linux-x86_64.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/sorl_thumbnail-11.12-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/djangorecipe-1.3-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/Django-1.4.2-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/zc.recipe.egg-2.0.0a3-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/zc.buildout-1.6.3-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site/eggs/setuptools-0.6c12dev_r88846-py2.7.egg"
	"--sys-path" "/home/igor/wks/django/masz-prawo/apps/site"))

(add-hook 'python-mode-hook 'jedi:setup)
