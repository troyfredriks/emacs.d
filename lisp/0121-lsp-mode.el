;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure company                                                         ;;
;;                                                                           ;;
;; Author: troy fredriks                                                     ;;
;; Date: 20231106                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install company
(install-pkg 'lsp-mode)

;; Configure keys
(after-load 'company
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "M-/") 'company-select-next)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq-default company-dabbrev-other-buffers 'all
		company-tooltip-align-annotations t
		company-idle-delay 0
		company-begin-commands '(self-insert-command)
		)
  )
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
	       '(verilog-ts-mode . "verilog")))

;; Use it
(add-hook 'verilog-mode-hook 'lsp)
