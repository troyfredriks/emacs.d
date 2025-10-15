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

(require 'org-roam)
(require 'citar)

;; Configure it
(if (file-exists-p org-roam-d)
    (setq org-roam-directory (file-truename org-roam-d))
  )

;; setup Org-roam to run functions on file changes to maintain cache consistency
(org-roam-db-autosync-mode)

(setq org-roam-capture-templates
      '(("m" "main" plain
         "%?"
         :if-new (file+head "${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" "reference" plain "%?"
         :if-new
         (file+head "reference/${title}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)))

;; adapted from: https://jethrokuan.github.io/org-roam-guide/
  (defun troyaf/org-roam-node-from-cite (citekey)
    (interactive (list (citar-select-ref)))
    (let* ((entry (citar-get-entry citekey))
           (title (citar-format--entry "${author editor} :: ${title}" entry ))
           (filename (concat "reference/" citekey ".org"))
           (head (concat ":PROPERTIES:\n:ROAM_REFS: [cite:@" citekey "]\n:END:\n#+title: " title "\n")))
      (org-roam-capture-
       :templates
       `((
          "r" "reference" plain "%?"
          :if-new (file+head ,filename ,head)
          :immediate-finish t
          :unnarrowed t))
       :info `((citekey . ,citekey)
               (title . ,title))
       :node (org-roam-node-create :title title)
       :props '(:finalize find-file))))
