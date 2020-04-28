;; This configuration file needs the corresponding 
;; .emacs.d directory to work properly.

;; TIPS, TRICKS, AND HINTS (OH MY!)

;; You can turn on line-wrapping without the stupid arrows 
;; by turning on visual line mode


;; RUN SERVER

(require 'server)
(unless (server-running-p)
    (server-start))

;; PICK UP INSTALLED PACKAGES

;; Any installed packages (via elpa, etc) need to be initialized 
;; otherwise this .emacs can't access them.
(package-initialize)

;; PERSONAL CUSTOMIZATION

;; The first command sets the default directory to <directory> if no
;; initial file is specified. The second sets the directory if a file
;; IS specified at startup.

;; Set window size for 1440x900 (Macbook Air '13 2011)
(if window-system (set-frame-size (selected-frame) 200 54))

;; SET PATHS

;; Pick up my private mods. For some reason, on Debian, emacs
;; generates a warning when you add .emacs.d to your load path. This
;; is an attempt to avoid that. First we change the current directory
;; via 'default-directory', then we add the said directroy via
;; normal-top-level-add-to-load-path '(".")). Finally, we add all the
;; sub-directories recursively via
;; (normal-top-level-add-subdirs-to-load-path). 'elpa' is for using
;; the package manager. 'meextensions' is for everything installed by
;; me manually.

(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory "~/.emacs.d/meextensions/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Default setup.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight-vline-face-flag nil)
 '(column-number-mode t)
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
 '(org-startup-indented t))

;; VISUAL GOODIES

;; Auto activate modes.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . display-ansi-colors))

;; SCSS-mode customizations
;; Don't auto-compile scss after saving.
(setq scss-compile-at-save nil)

;; Web-mode customizations
(setq web-mode-code-indent-offset 2)

;; Colorize regions with ANSI color codes
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

;; Activate Pretty Control ^L
(require 'pp-c-l)
;; Set the control line to 70 spaces.
(setq pp^L-^L-string "                                                                      ");
(pretty-control-l-mode 1)

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

;; Turn off linum in certain contexts
(require 'linum-off)

;; Use Solarized theme (this probably won't work if the theme's not installed)
(load-theme 'solarized-dark t)

;; ADDED FUNCTIONALITY CONFIGURATION

;; Multiple-cursors
(require 'multiple-cursors)
;;(global-set-key (kbd "M-C-c M-C-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

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

;; Don't create a new buffer when you go to a new directory in dired.
(put 'dired-find-alternate-file 'disabled nil)

;; Turn off tool-bar
(if window-system
    (tool-bar-mode -1))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
