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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(col-highlight-vline-face-flag nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "d818d364712b551c535b952b3aa089c5941ef284" "39327baac0e924fc06c561986ed6fff862df8e1d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "69546801bd9c98eeb7246a3d39497abeced1d11e" "3d1ce542866e3b41e55c661ec78baec04b3b6aee" default)))
 '(fci-rule-color "#efefef")
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-visual-line-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(linum-format "%d ")
 '(make-backup-files nil)
 '(org-export-backends (quote (ascii beamer html icalendar latex md odt)) t)
 '(org-list-allow-alphabetical t)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks nil))

;; VISUAL GOODIES

;; Auto activate modes.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
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

;; Set highlight line color
(set-face-background hl-line-face "gray13")

;; Set Chinese to a specific fontset
;; (set-fontset-font "fontset-standard"
;;                       (cons (decode-char 'ucs #x4E00)
;;                             (decode-char 'ucs #x9FFF))
;;                       "-*-SimHei-*-*-*-*-14-*-*-*-*-*-iso10646-1")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000000" :foreground "#eaeaea" :slant normal :weight normal :height 140 :width normal :family "Inconsolata"))))
 '(col-highlight ((t (:background "SlateGray3"))) t)
 '(font-lock-comment-face ((t (:foreground "#969896" :slant normal))))
 '(lazy-highlight ((t (:background "paleturquoise" :foreground "black"))))
 '(linum ((t (:background "#2a2a2a" :foreground "#9fc59f"))))
 '(org-hide ((t (:background "gray6" :foreground "#000000"))) t)
 '(widget-field ((t (:foreground "firebrick2" :box (:line-width 1 :color "#eaeaea"))))))

;; Turn off linum in certain contexts
(require 'linum-off)

;; ADDED FUNCTIONALITY CONFIGURATION

;; Key-bindings for Org mode.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

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
;; Turn off tool-bar
(tool-bar-mode -1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
