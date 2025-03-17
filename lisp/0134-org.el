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
(require 'org-protocol)

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

;; https://blog.jethro.dev/posts/capturing_inbox/
;; this capture template differs slightly from the default behavior of adding
;; entries as second level bullets under 'tasks'; instead creating level 1 bullets.
(setq org-capture-templates
      `(("i" "inbox" entry (file ,(concat org-lyfe-d "/inbox.org"))
         "* TODO %?")
;;        ("e" "email" entry (file+headline ,(concat org-lyfe-d "emails.org") "Emails")
;;         "* TODO [#A] Reply: %a :@home:@school:" :immediate-finish t)
;;        ("l" "link" entry (file ,(concat org-lyfe-d "inbox.org"))
;;         "* TODO %(org-cliplink-capture)" :immediate-finish t)
        ("c" "org-protocol-capture" entry (file ,(concat org-lyfe-d "/inbox.org"))
         "* TODO [[%:link][%:description]]\n\n %i" :immediate-finish t)))



;; keybinds
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)

;; Local hooks
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
