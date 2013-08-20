;; load libs
(add-to-list 'load-path "~/emacs_cfg/ecb-2.40")
(load-file "~/emacs_cfg/cedet-1.1/common/cedet.el")
(add-to-list 'load-path "~/emacs_cfg/yasnippet-0.6.1c")
;----------------------------------------------------------;
;; cedet
(global-ede-mode 1)

(require 'semantic-gcc)
(require 'semantic-ia)
;(require 'semantic-clang)

;; semantic setup
;;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-gaudy-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)

;; debug helper
(semantic-load-enable-semantic-debugging-helpers)

;; clang
;(semantic-clang-activate)

;
;(defun proteas-c-mode-cedet-hook ()
;  (local-set-key "." 'semantic-complete-self-insert)
;  (local-set-key ">" 'semantic-complete-self-insert)
;)
;(add-hook 'c-mode-common-hook 'proteas-c-mode-cedet-hook)
;(add-hook 'c++-mode-common-hook 'proteas-c-mode-cedet-hook)

(global-set-key [f10] 'semantic-ia-fast-jump)
(global-set-key [S-f10]
				(lambda ()
				  (interactive)
				  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
					  (error "Semantic Bookmark ring is currently empty"))
				  (let* ((ring (oref semantic-mru-bookmark-ring ring))
						 (alist (semantic-mrub-ring-to-assoc-list ring))
						 (first (cdr (car alist))))
					(if (semantic-equivalent-tag-p (oref first tag)
												   (semantic-current-tag))
						(setq first (cdr (car (cdr alist)))))
					(semantic-mrub-switch-tags first))))

(require 'cc-mode)
(define-key c-mode-base-map [M-S-f10] 'semantic-analyze-proto-impl-toggle)
;(define-key c-mode-base-map (kbd "M-/") 'semantic-ia-complete-symbol-menu)

(require 'eassist nil 'noerror)
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

(defun proteas-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
      (hippie-expand nil)
      (indent-for-tab-command))
 )

(global-set-key [(control tab)] 'proteas-indent-or-complete)
(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list
      '(
        senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)
(define-key c-mode-base-map [(tab)] 'proteas-indent-or-complete)
;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;----------------------------------------------------------;

;; ecb
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)
(setq stack-trace-on-error t)
;----------------------------------------------------------;

;; disable stickyfunc-mode
(global-semantic-stickyfunc-mode nil)
;----------------------------------------------------------;

;; gdb mand windows
(setq gdb-many-windows t)
(load-library "multi-gud.el")
(load-library "multi-gdb-ui.el")
;----------------------------------------------------------;

;; header search path
(defcustom proteas-system-include-paths '("/usr/include/c++/4.2.1" "/usr/local/include" "/usr/include")
  "header search path"
  :type '(repeat directory))

;; auto complete
(add-to-list 'load-path "~/emacs_cfg/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/emacs_cfg/auto-complete-1.3.1/dict")
(ac-config-default)

;;config clang
(require 'auto-complete-clang)
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(setq clang-completion-suppress-error 't)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (append proteas-system-include-paths)))

(defun proteas-ac-clang-mode-common-hook()
  (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang))
 
(add-hook 'c-mode-common-hook 'proteas-ac-clang-mode-common-hook)
(add-hook 'c++-mode-common-hook 'proteas-ac-clang-mode-common-hook)
;----------------------------------------------------------;

;; yasippet template
(require 'yasnippet);;not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/emacs_cfg/yasnippet-0.6.1c/snippets")
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

;; golang
(add-to-list 'load-path "~/emacs_cfg/golang")
(require 'go-mode-load)
;----------------------------------------------------------;

;; slime sbcl config
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/emacs_cfg/slime")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
(add-hook 'slime-repl-mode-hook #'(lambda () (setq autopair-dont-activate t)))
;(slime-setup)
;----------------------------------------------------------;

;; sr-speedbar

(require 'sr-speedbar)
(setq sr-speedbar-right-side t)
(setq sr-speedbar-width 30)
(setq speedbar-show-unknown-files t)
(setq dframe-update-speed t) ; prevent the speedbar to update the current state, since it is always changing

