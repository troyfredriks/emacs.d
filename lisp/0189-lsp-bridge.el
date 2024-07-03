;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure lsp-bridge                                                      ;;
;;                                                                           ;;
;; Author: Troy Fredriks <troyemails@gmail.com>                              ;;
;; Date: 20240618                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; currently requires to be cloned to ~/.emacs.d/ root so it avoids getting
;; byte compiled.

;; git clone to ~/.emacs.d/lsp-bridge/
;; git clone https://github.com/manateelazycat/lsp-bridge.git


;(require 'yasnippet)
;(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)
