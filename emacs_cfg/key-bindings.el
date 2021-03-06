;; show and hide ecb
(defun proteas-ecb-active-or-deactive ()
    (interactive)
    (if ecb-minor-mode
      (ecb-deactivate)
      (ecb-activate)))

(global-set-key (kbd "<C-f12>") 'proteas-ecb-active-or-deactive)
;----------------------------------------------------------;

;; show speedbar
(global-set-key (kbd "<C-f11>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))
;----------------------------------------------------------;

