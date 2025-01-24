;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Nix Mode                                                                  ;;
;;                                                                           ;;
;; Author: troy fredriks <troyemails@gmail.com>                              ;;
;; Date: 20250123                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'nix-mode)

;; Use it
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
