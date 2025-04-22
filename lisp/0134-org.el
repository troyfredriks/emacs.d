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
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
;; appends all org files that should be tracked by agenda to the agenda list:
(if (file-exists-p org-lyfe-d)
    (setq org-agenda-files (append (list
				    (concat org-lyfe-d "inbox.org")
				    (concat org-lyfe-d "todo.org")
				    (concat org-lyfe-d "someday.org"))
				   (nconc
				    (directory-files-recursively (concat org-lyfe-d "projects/") "\\(^\\|/\\)todo\\.org$" nil t))))
  )

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)" "|" "Cancelled(c)")))

(setq org-tag-alist '(("@errand" . ?e)
                      ("@office" . ?o)
                      ("@home"   . ?h)))

;; start with indent mode
(setq org-startup-indented t)

;; Configure clock-persist
(setq org-clock-persist 'history
      org-clock-persist-file org-clock-f)
(org-clock-persistence-insinuate)

(setq org-src-fontify-natively t)

;; set default capture buffer to inbox.org
(setq org-default-notes-file (concat org-lyfe-d "inbox.org"))

;; https://blog.jethro.dev/posts/capturing_inbox/
;; this capture template differs slightly from the default behavior of adding
;; entries as second level bullets under 'tasks'; instead creating level 1 bullets.
(setq org-capture-templates
      `(("i" "inbox" entry (file ,(concat org-lyfe-d "inbox.org"))
         "* TODO %?")
;;        ("e" "email" entry (file+headline ,(concat org-lyfe-d "emails.org") "Emails")
;;         "* TODO [#A] Reply: %a :@home:@school:" :immediate-finish t)
;;        ("l" "link" entry (file ,(concat org-lyfe-d "inbox.org"))
;;         "* TODO %(org-cliplink-capture)" :immediate-finish t)
        ("c" "org-protocol-capture" entry (file ,(concat org-lyfe-d "inbox.org"))
         "* TODO [[%:link][%:description]]\n\n %i" :immediate-finish t)))

;; Resize headings
(custom-set-faces
  '(org-document-title ((t (:height 2.0 :weight bold))))
  '(org-level-1 ((t (:inherit outline-1 :height 1.7 :spacing 2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.6 :spacing 2))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
  '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
  '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

;; Hide emphasis markers in *bold* or /italic/
(setq org-hide-emphasis-markers 't)

;; When a section is collapsed, this is display instead of '...'
(setq org-ellipsis " ▾ ")

;; Configure the custom org agenda view
(setq org-agenda-custom-commands
      '((" " "Agenda"
        ((agenda ""
                 ((org-agenda-span 1)
                  (org-agenda-start-on-weekday nil)
                  (org-agenda-start-day "+0d")
                  (org-deadline-warning-days 365)))

         (todo "TODO"
               ((org-agenda-overriding-header " To Refile")
                (org-agenda-files (list (concat org-lyfe-d "inbox.org")))))

         (todo "NEXT"
               ((org-agenda-overriding-header " In Progress")
                (org-agenda-files (cons
                                   (concat org-lyfe-d "todo.org")
                                   (directory-files-recursively (concat org-lyfe-d "projects/") "\\(^\\|/\\)todo\\.org$" nil t)
				   ))))

         (todo "TODO"
               ((org-agenda-overriding-header " Project Tasks")
                (org-agenda-files (directory-files-recursively (concat org-lyfe-d "projects/") "\\(^\\|/\\)todo\\.org$" nil t)
				  )))

         (todo "TODO"
               ((org-agenda-overriding-header " One Off Tasks")
                (org-agenda-files (list (concat org-lyfe-d "todo.org")))))

	 (todo "HOLD"
               ((org-agenda-overriding-header " Blocked Tasks")
                (org-agenda-files  (cons
				    (concat org-lyfe-d "todo.org")
                                    (directory-files-recursively (concat org-lyfe-d "projects/") "\\(^\\|/\\)todo\\.org$" nil t)
				    ))))
         nil))))

;; Configure refiling menu when refiling tasks
(setq org-refile-use-outline-path 'full-file-path
     org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)  ;; Allow creation of headings under which to group tasks, when refiling them
(setq org-refile-targets  `(
			   (,(concat org-lyfe-d "todo.org") :level . 0)
			   (,(concat org-lyfe-d "someday.org") :level . 0)
			   (,(directory-files-recursively (concat org-lyfe-d "projects/") "\\(^\\|/\\)todo\\.org$" nil t) :level . 0)
			   ))


;; keybinds
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)

;; Local hooks
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
