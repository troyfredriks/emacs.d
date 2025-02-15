;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure org mode                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make sure directory is created
(util/mkdir org-d)

;; Remove from built-in list
(delete (package-installed-p 'org) package--builtins)

;; Install it
(install-pkg 'org)
(install-pkg 'org-bullets)

;; Use it

;; Configure it
;; Set agenda directory to org-lyfe if it exists
(if (file-exists-p org-lyfe-d)
    ;; Not recursive
    (setq org-agenda-files `(,org-lyfe-d))
  )
;; start with indent mode
(setq org-startup-indented t)

;; Configure clock-persist
(setq org-clock-persist 'history
      org-clock-persist-file org-clock-f)
(org-clock-persistence-insinuate)

(setq org-src-fontify-natively t)

;; set default capture buffer to inbox.org
(setq org-default-notes-file (concat org-lyfe-d "/inbox.org"))

;; Local hooks
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
