;; This configuration file needs the corresponding 
;; .emacs.d directory to work properly.
;; TIPS, TRICKS, AND HINTS (OH MY!)

;; You can turn on line-wrapping without the stupid arrows 
;; by turning on visual line mode

;; PICK UP INSTALLED PACKAGES

;; Any installed packages (via elpa, etc) need to be initialized 
;; otherwise this .emacs can't access them.
(package-initialize)

;; PERSONAL CUSTOMIZATION

;; The first command sets the default directory to <directory> if no
;; initial file is specified. The second sets the directory if a file
;; IS specified at startup.

;; (setq command-line-default-directory "~/Dropbox/Out of the Box/")

;; Set window size for 1440x900 (Macbook Air '13 2011)
(if window-system (set-frame-size (selected-frame) 200 54))
;; SET PATHS
;; Pick up my private mods.
(add-to-list 'load-path "~/.emacs.d/")

;; Default setup.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight-vline-face-flag nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes (quote ("69546801bd9c98eeb7246a3d39497abeced1d11e" "3d1ce542866e3b41e55c661ec78baec04b3b6aee" default)))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-visual-line-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(linum-format "%d ")
 '(make-backup-files nil)
 '(org-startup-indented t))

;; VISUAL GOODIES

;; Auto activate modes.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

;; Activate Pretty Control ^L
(require 'pp-c-l)
;; Set the control line to 70 spaces.
(setq pp^L-^L-string "                                                                      ");
(pretty-control-l-mode 1)

;; Adding color themes.
(require 'color-theme)
(setq color-theme-is-global t)

;; Adding windmove shortcuts.
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Adding multi-web mode.
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		  (ruby-mode "<\\%" "\\%>")
		  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "erb"))
(multi-web-global-mode 1)

;; Set highlight line color
(set-face-background hl-line-face "gray13")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "SlateGray3"))))
 '(lazy-highlight ((t (:background "paleturquoise" :foreground "black"))))
 '(linum ((t (:foreground "#9fc59f"))))
 '(org-hide ((t (:foreground "color-235"))) t))

;; ADDED FUNCTIONALITY CONFIGURATION

;; Key-bindings for Org mode.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

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

;; Activate tramp so we can do sudo all the time.
(require 'tramp)
(setq tramp-default-method "scp")

;; 
(put 'dired-find-alternate-file 'disabled nil)

