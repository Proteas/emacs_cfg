;; load libs
(add-to-list 'load-path "/home/proteas/emacs_cfg/ecb-2.40")
(load-file "/home/proteas/emacs_cfg/cedet-1.0.1/common/cedet.el")
(add-to-list 'load-path "/home/proteas/emacs_cfg/yasnippet-0.6.1c")
;----------------------------------------------------------;

;; cedet
(global-ede-mode 1)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;----------------------------------------------------------;

;; ecb
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)
;----------------------------------------------------------;

;; gdb mand windows
(setq gdb-many-windows t)
(load-library "multi-gud.el")
(load-library "multi-gdb-ui.el")
;----------------------------------------------------------;

;; auto complete
(add-to-list 'load-path "/home/proteas/emacs_cfg/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/proteas/emacs_cfg/auto-complete-1.3.1/dict")
(ac-config-default)
;----------------------------------------------------------;

;; yasippet template
(require 'yasnippet);;not yasnippet-bundle
(yas/initialize)
(yas/load-directory "/home/proteas/emacs_cfg/yasnippet-0.6.1c/snippets")
;----------------------------------------------------------;

;; auto pair
(require 'autopair)
(autopair-global-mode)
;----------------------------------------------------------;

;; lua syntax highlighting
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;----------------------------------------------------------;

;; slime sbcl config
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/common-lisp/source/slime")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
;(slime-setup)
;----------------------------------------------------------;

;; sr-speedbar

(require 'sr-speedbar)
(setq sr-speedbar-right-side t)
(setq sr-speedbar-width 30)
(setq speedbar-show-unknown-files t)
(setq dframe-update-speed t) ; prevent the speedbar to update the current state, since it is always changing

(global-set-key (kbd "<f11>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))


