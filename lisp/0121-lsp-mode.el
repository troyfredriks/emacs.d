;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure lsp-mode                                                        ;;
;;                                                                           ;;
;; Author: troy fredriks                                                     ;;
;; Date: 20231106                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install lsp-mode
(install-pkg 'lsp-mode)

;; Configure it
(setq lsp-enable-symbol-highlighting   nil
      lsp-lens-enable                  nil
      lsp-headerline-breadcrumb-enable nil
      lsp-ui-sideline-enable           nil
      lsp-diagnostics-provider        :none
      lsp-completion-provider         :none
      )

;; Use it
(add-hook 'verilog-mode-hook 'lsp)
