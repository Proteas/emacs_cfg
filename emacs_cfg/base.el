;; user info config
(setq user-full-name "Proteas")
(setq user-mail-address "proteas.wang@gmail.com")
;----------------------------------------------------------;

;; start without message
(setq inhibit-startup-message t)
;----------------------------------------------------------;

;; enter text mode
(setq default-major-mode 'text-mode)
;----------------------------------------------------------;

;; bar config
(tool-bar-mode -1)
(scroll-bar-mode nil)
;----------------------------------------------------------;

;; disable bell ring
(setq visible-bell t)
;----------------------------------------------------------;

;; highlight current line
(global-hl-line-mode 1)
;----------------------------------------------------------;

;; indent size
(setq standard-indent 2)
(setq-default indent-tabs-mode nil) 
(setq-default tab-width 2)
;----------------------------------------------------------;

;; scroll config
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)
;----------------------------------------------------------;

;; enable wheel-mouse scroll
(mouse-wheel-mode t)
;----------------------------------------------------------;

;; display line and column number
(global-linum-mode 1)
(column-number-mode 1)
;----------------------------------------------------------;

;; cursor
(setq-default cursor-type 'bar)
;----------------------------------------------------------;

;; copy & paste config
(setq x-select-enable-clipboard t)
;----------------------------------------------------------;

;; mouse avoid cursor
(mouse-avoidance-mode 'animate)
;----------------------------------------------------------;

;; set kill ring max
(setq kill-ring-max 200)
;----------------------------------------------------------;

;; parenthese config
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;----------------------------------------------------------;

;; rest yes to y and no to n
(fset 'yes-or-no-p 'y-or-n-p)
;----------------------------------------------------------;

;; without auto backup
(setq make-backup-files nil) 
;----------------------------------------------------------;

;; disable auto save
(setq auto-save-mode nil)
(setq auto-save-default nil)
;----------------------------------------------------------;

;; c-k
(setq-default kill-whole-line t)
;----------------------------------------------------------;

;; auto add end line
(setq require-final-newline t)
;----------------------------------------------------------;

;; set cursor behavior
(setq track-eol t)
;----------------------------------------------------------;

;; man page and buffer config
(setq Man-notify-method 'pushy)
;----------------------------------------------------------;

;; shortcut for command
(setq suggest-key-bindings 1)
;----------------------------------------------------------;

;; time and format
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t)
;----------------------------------------------------------;

;; set default working directory
(setq default-directory "~/")
;----------------------------------------------------------;

;; recursive use minibuffer
(setq enable-recursive-minibuffers t)
;----------------------------------------------------------;

;; display image
(auto-image-file-mode) 
;----------------------------------------------------------;

;; highlight search and replace
(setq search-highlight t)
(setq query-replace-highlight t)
;----------------------------------------------------------;

;; chinese sentence end
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;----------------------------------------------------------;

;; enable ido
(ido-mode t)
;----------------------------------------------------------;

;; default window size and position
(setq default-frame-alist '((top . 5) (left . 145) (width . 138) (height . 55)))

;; other way
;(defun arrange-frame (w h x y)
;  "Set the width, height, and x/y position of the current frame"
;  (let ((frame (selected-frame)))
;    (delete-other-windows)
;    (set-frame-position frame x y)
;    (set-frame-size frame w h)))
;(arrange-frame 150 60 700 80)
;----------------------------------------------------------;

;; font size
(set-face-attribute 'default nil :height 180)
;----------------------------------------------------------;

;; set fill column
(setq-default fill-column 80)
;----------------------------------------------------------;

;; timestamp
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S Proteas")
;----------------------------------------------------------;

;; autoload changed file
(global-auto-revert-mode 1)
;----------------------------------------------------------;
