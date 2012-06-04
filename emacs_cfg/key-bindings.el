;; show and hide ecb
(defun proteas-ecb-active-or-deactive ()
    (interactive)
    (if ecb-minor-mode
      (ecb-deactivate)
      (ecb-activate)))

(global-set-key (kbd "<f12>") 'proteas-ecb-active-or-deactive)
;----------------------------------------------------------;
