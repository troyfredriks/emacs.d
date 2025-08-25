;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure Copilot                                                         ;;
;;                                                                           ;;
;; Author: Troy Fredriks <troyemails@gmail.com>                              ;;
;; Date: 20250421                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(install-pkg 'copilot)
;; requires emacs 30.1 or later
(use-package copilot
 :vc (:url "https://github.com/copilot-emacs/copilot.el"
           :rev :newest
           :branch "main"))

;; Use it

;; workaround for annoying warning spam. TODO: fix this the proper way via:
;; copilot-indentation-alist

;; Configure keys
(after-load 'copilot
  (add-hook 'prog-mode-hook 'copilot-mode)
  (setq copilot-indent-offset-warning-disable t)
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  )
