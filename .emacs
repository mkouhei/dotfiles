(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
;; emacs-mozc
;;(require 'mozc)
(load-file "/usr/share/emacs/site-lisp/emacs-mozc/mozc.el")
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq default-terminal-coding-system 'utf-8)
(setq default-keyboard-coding-system 'utf-8)

(require 'anything-startup)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program
      (if (file-exists-p "/usr/bin/iceweasel")
	  "/usr/bin/iceweasel" "/usr/bin/gchromiu"))

(global-auto-revert-mode t)

;; set cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil) ; disable cua keybind

(setq frame-background-mode (frame-parameter nil 'background-mode))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;(load-file "~/.emacs.d/gjslint.el")
;;(require 'gjslint)
(add-hook 'js2-mode-hook
		  (lambda () (flymake-mode t)))
(setq-default c-basic-offset 4)
(setq-default js-indent-level 2)
(setq-default indent-tabs-mode nil)
(put 'set-goal-column 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/vendor/go-mode.el")
(require 'go-mode-autoloads)

(add-hook 'before-save-hook 'gofmt-before-save)

;(add-to-list 'load-path "~/devel/gocode/src/github.com/dougm/goflymake")
;(require 'go-flymake)
;(require 'go-flycheck)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
(require 'auto-complete-config)
(ac-config-default)
(require 'go-autocomplete)
;(add-to-list 'load-path (concat (getenv "GOPATH") "~/devel/gocode/src/github.com/golang/lint/misc/emacs"))
;(require 'golint)

;(add-to-list 'load-path "~/.emacs.d/vendor/ac-python.el")
;(require 'ac-python)
;(add-to-list 'ac-modes 'python-mode-hook)

;(add-to-list 'load-path "~/.emacs.d/vendor/ipython.el")
;(require 'ipython)
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)


(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))

(load-file "~/.emacs.d/vendor/nyan-mode/nyan-mode.el")
(nyan-mode)
(nyan-start-animation)

(setq plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
(load-file "~/.emacs.d/vendor/plantuml-mode/plantuml-mode.el")

(add-hook 'html-mode-hook
		  (lambda ()
			;; Default indentation is usually 2 spaces, changing to 4.
			(set (make-local-variable 'sgml-basic-offset) 2)))

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2)
 (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(add-to-list 'load-path "~/.emacs.d/vendor/scss-mode")

(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
