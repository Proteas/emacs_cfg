;; emacs parameters                                        ;;
;; -nw or  -no-window use emacs without gui                ;;
;; -q  not load config file                                ;;
;; --debug-init                                            ;;
;;---------------------------------------------------------;;

;; search paths
(add-to-list 'load-path "/home/proteas/emacs_cfg")
(add-to-list 'load-path "/home/proteas/emacs_cfg/plugins")
;----------------------------------------------------------;

(load "base.el")
(load "plugin.el")
(load "development.el")
(load "key-bindings.el")
;----------------------------------------------------------;

;; slime sbcl config
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/common-lisp/source/slime")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
;(slime-setup)

; solve the hang problem
(add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
;----------------------------------------------------------;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
