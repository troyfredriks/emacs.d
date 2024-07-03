;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure verilog-ext                                                     ;;
;;                                                                           ;;
;; Author: Troy Fredriks <troyemails@gmail.com>                              ;;
;; Date: 20240618                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; this file may not compile for reasons I cant quite understand that has to do
;; with the way a newer version of verilog-mode is required than ships with emacs.
;; compile this buffer in place with `M-x byte-compile-file RET <this-file> RET`

;; Install it
;;(install-pkg 'verilog-ext)
;; Function to load the latest version of verilog-mode from MELPA
(defun load-latest-verilog-mode ()
  (let* ((verilog-files (file-expand-wildcards (concat user-emacs-directory "pkgs*/verilog-mode-*/verilog-mode.elc")))
         (latest-verilog-file (car (sort verilog-files #'string>))))
    (when (and latest-verilog-file (file-exists-p latest-verilog-file))
      (message "Loading verilog-mode from: %s" latest-verilog-file)
      (load latest-verilog-file))))

;; Load the latest version of verilog-mode
(load-latest-verilog-mode)

(require 'verilog-mode)


;; Configure it

;; Can also be set through `M-x RET customize-group RET verilog-ext':
;; Comment out/remove the ones you do not need
(require 'verilog-ext)
(setq verilog-ext-feature-list
      '(font-lock
        xref
        capf
        hierarchy
        eglot
        lsp
        lsp-bridge
        ;;lspce
        flycheck
        beautify
        navigation
        template
        formatter
        compilation
        imenu
        which-func
        hideshow
        typedefs
        time-stamp
        block-end-comments
        ports))

;; explicitly set hierarchy frontend to `hierarchy'
(setq verilog-ext-hierarchy-frontend 'hierarchy)

;; use svlint as linter
(setq verilog-ext-flycheck-linter 'verilog-svlint)

(verilog-ext-mode-setup)

;; For `lsp-bridge:
(verilog-ext-lsp-bridge-set-server 've-svlangserver)
;; For `lsp-mode':
(verilog-ext-lsp-set-server 've-svlangserver)

(add-hook 'verilog-mode-hook #'verilog-ext-mode)
