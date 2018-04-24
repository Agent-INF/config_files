;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; -------------------------------


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync)

;; Standard Jedi.el setting
(eval-when-compile (require 'jedi nil t))
(setq jedi:setup-keys t)
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; ------------------------------

(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq py-autopep8-options '("--indent-size=2"))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'elpy-mode-hook (lambda ()
			    (setq flycheck-checker 'python-pylint)))

(add-hook 'elpy-mode-hook 'jedi:setup)
