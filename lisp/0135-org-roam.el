;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure org-roam mode                                                   ;;
;;                                                                           ;;
;; Author: Troy Fredriks  <troyemails@gmail.com>                             ;;
;; Date: 20240707                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make sure directory is created
;;(util/mkdir org-d)

;; Install it
(install-pkg 'org-roam)

;; Configure it
(if (file-exists-p org-roam-d)
    (setq org-roam-directory (file-truename org-roam-d))
  )

;; setup Org-roam to run functions on file changes to maintain cache consistency
(org-roam-db-autosync-mode)
