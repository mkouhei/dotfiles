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
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
;; emacs-mozc
;;(require 'mozc)
(load-file "/usr/share/emacs/site-lisp/emacs-mozc/mozc.el")
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
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

(load-file "~/.emacs.d/gjslint.el")
;;(require 'gjslint)
(add-hook 'js2-mode-hook
		  (lambda () (flymake-mode t)))
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(put 'set-goal-column 'disabled nil)
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)

(add-to-list 'exec-path (expand-file-name "~/devel/gocode/bin"))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))

(add-hook 'before-save-hook 'gofmt-before-save)

(add-to-list 'load-path "~/devel/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
(require 'auto-complete-config)
(ac-config-default)
(require 'go-autocomplete)
