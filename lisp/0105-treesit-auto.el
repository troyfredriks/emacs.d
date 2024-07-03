;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure treesit-auto                                                    ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20230731                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (when (version< emacs-version "29.1")
;;   (error "treesit-auto requires v29.1 or higher"))

;; Install it
(install-pkg 'verilog-ts-mode)
;;(install-pkg 'treesit-auto)

;; Use it
;; treesit-auto doesn't have autoloads so have to require it
(require 'verilog-ts-mode)
;;(require 'treesit-auto)

;;(setq treesit-auto-install 'prompt)

;;language recipes:
;;  (setq verilog-tsauto-config
;; 	(make-treesit-auto-recipe
;; 	 :lang 'verilog
;; 	 :ts-mode 'verilog-ts-mode
;; 	 :remap 'verilog-mode
;; 	 :url "https://github.com/tree-sitter/tree-sitter-verilog"
;; 	 :revision "master"
;; 	 :source-dir "src"))

;; (add-to-list 'treesit-auto-recipe-list verilog-tsauto-config)

(add-to-list 'auto-mode-alist '("\\.s?vh?\\'" . verilog-ts-mode))
;; set indent level for verilog-ts-mode
(setq verilog-ts-indent-level 2)

;;(global-treesit-auto-mode)
