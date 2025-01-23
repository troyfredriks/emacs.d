;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure Copilot                                                         ;;
;;                                                                           ;;
;; Author: Troy Fredriks <troyemails@gmail.com>                              ;;
;; Date: 20240614                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git clone to site-lisp/copilot.el/
;; git clone https://github.com/zerolfx/copilot.el.git

;; Install copilot (TODO, currently manually. Check into quelpa or straight)
;;(install-pkg 'copilot)

;; Use it
;(add-hook 'prog-mode-hook 'copilot-mode)
;; workaround for annoying warning spam. TODO: fix this the proper way via:
;; copilot-indentation-alist
;(setq copilot-indent-offset-warning-disable t)
;; Configure keys
;(after-load 'copilot
;  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
;  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
;  )
