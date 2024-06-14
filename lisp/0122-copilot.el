;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure Copilot                                                         ;;
;;                                                                           ;;
;; Author: Troy Fredriks <troyemails@gmail.com>                              ;;
;; Date: 20240614                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install copilot (TODO, currently manually. Check into quelpa or straight)
;;(install-pkg 'copilot)

;; Use it
(add-hook 'prog-mode-hook 'copilot-mode)

;; Configure keys
(after-load 'copilot
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  )
