;; This configuration file needs the corresponding 
;; .emacs.d directory to work properly.


;; TIPS, TRICKS, AND HINTS (OH MY!)

;; You can turn on line-wrapping without the stupid arrows 
;; by turning on visual line mode.


;; PERSONAL CUSTOMIZATION

;; The first command sets the default directory to <directory> if no
;; initial file is specified. The second sets the directory if a file
;; IS specified at startup.

;; (setq command-line-default-directory "~/Dropbox/Out of the Box/")

;; Set window size for 1440x900 (Macbook Air '13 2011)
(if window-system (set-frame-size (selected-frame) 200 54))


;; Default setup.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-hl-line-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(linum-format "%d ")
 '(longlines-wrap-follows-window-size t)
 '(make-backup-files nil)
 '(nil nil t)
 '(org-startup-indented t))

;; Pick up my private mods.a
(add-to-list 'load-path "~/.emacs.d/")
;;(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-6.5.5")
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-20080305.834")
(add-to-list 'load-path "~/.emacs.d/elpa/multi-web-mode-20120925.942")
(add-to-list 'load-path "~/.emacs.d/elpa/framemove-20101013.2052")

;; Auto activate modes.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; Key-bindings for Org mode.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Activate Pretty Control ^L
(require 'pp-c-l)
;; Set the control line to 70 spaces.
(setq pp^L-^L-string "                                                                      ");
(pretty-control-l-mode 1)

;; Configure gnus for email; this info needs to be configured to your setup.
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "misteravery@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "Celestra.local")

;; Add Marmalade to package manager.
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Adding multi-web mode.
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		  (ruby-mode "<\\%" "\\%>")
		  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "erb"))
(multi-web-global-mode 1)

;; Activate tramp so we can do sudo all the time.
(require 'tramp)
(setq tramp-default-method "scp")

;; Adding color themes.
(require 'color-theme)
(setq color-theme-is-global t)

;; Adding windmove shortcuts.
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
;; 

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:underline "brightyellow")))))
