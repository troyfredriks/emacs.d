;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Verilog Mode                                                              ;;
;;                                                                           ;;
;; Author: Troy Fredriks <troyemails@gmail.com>                              ;;
;; Date: 20240617                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Function to load the latest version of verilog-mode from MELPA
(defun load-latest-verilog-mode ()
  (let* ((verilog-files (file-expand-wildcards (concat user-emacs-directory "pkgs*/verilog-mode-*/verilog-mode.el")))
         (latest-verilog-file (car (sort verilog-files #'string>))))
    (when (and latest-verilog-file (file-exists-p latest-verilog-file))
      (message "Loading verilog-mode from: %s" latest-verilog-file)
      (load latest-verilog-file))))

;; Load the latest version of verilog-mode
(load-latest-verilog-mode)

(require 'verilog-mode)

;; Use it
;; (util/hook-ext-to-mode "v" 'verilog-mode)
;; (util/hook-ext-to-mode "vh" 'verilog-mode)
;; (util/hook-ext-to-mode "sv" 'verilog-mode)f
;; (util/hook-ext-to-mode "svh" 'verilog-mode)

 (setq verilog-indent-level             2
       verilog-indent-level-module      2
       verilog-indent-level-declaration 2
       verilog-indent-level-behavioral  2
       verilog-indent-level-directive   2
       verilog-case-indent              2
       verilog-auto-newline             nil
       verilog-auto-indent-on-newline   nil
       verilog-tab-always-indent        t
       verilog-auto-endcomments         nil
       verilog-minimum-comment-distance 40
       verilog-indent-begin-after-if    nil
       verilog-auto-lineup              '(nil)
       )
;; (add-hook 'verilog-mode-hook
;;           (lambda ()
;;             (setq indent-tabs-mode nil)
;;             (setq tab-width 2)))

;;(add-to-list 'major-mode-remap-alist '(verilog-mode . verilog-ts-mode))
