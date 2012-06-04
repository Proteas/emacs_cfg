;; load libs
(add-to-list 'load-path "/home/proteas/emacs_cfg/color-theme-6.6.0")
;----------------------------------------------------------;

;; color theme config
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)
;----------------------------------------------------------;

;; tabbar config
(require 'tabbar-extension)
(tabbar-mode t)
(global-set-key [(control tab)] 'tabbar-forward)
(global-set-key [(control shift tab)] 'tabbar-backward)
;----------------------------------------------------------;
