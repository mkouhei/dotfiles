(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(set-input-method "japanese-anthy")
;;(require 'anything-startup)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program
      (if (file-exists-p "/usr/bin/chromium")
	  "/usr/bin/chromium" "/usr/bin/google-chrome" "/usr/bin/iceweasel")o)

;; set cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil) ; disable cua keybind