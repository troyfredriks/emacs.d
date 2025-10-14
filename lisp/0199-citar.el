;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure org-roam mode                                                   ;;
;;                                                                           ;;
;; Author: Troy Fredriks  <troyemails@gmail.com>                             ;;
;; Date: 20250916                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make sure directory is created
;;(util/mkdir org-d)

;; Install it
(install-pkg 'citar)

;;(require 'citar)

;; Configure it
(if (file-exists-p biblio-f)
    (setq citar-bibliography (file-truename biblio-f))
  )
