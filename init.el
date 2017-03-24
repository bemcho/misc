(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

    
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(cursor-type (quote bar))
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t))))
     
    ;; Package.el customization
    (package-initialize)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.milkbox.net/packages/") t)
     
    ;; rainbow delimiters
    (setq rainbow-delimiters-mode t)

;; turn off bell
 (setq visible-bell t)

    ;; paredit
   ;; (add-hook 'clojure-mode-hook 'paredit-mode)
    ;;(add-hook 'nrepl-mode-hook 'paredit-mode)
    ;;(global-set-key [f7] 'paredit-mode)
     
    ;; clojure-mode
    ;;(global-set-key [f9] 'nrepl-jack-in)
     
    ;; nrepl
    ;;(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
    ;(setq nrepl-popup-stacktraces nil)
    ;(add-to-list 'same-window-buffer-names "*nrepl*")
    ;(add-hook 'nrepl-mode-hook 'paredit-mode)
     
    ;; Auto complete
    (require 'auto-complete-config)
    (ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop)



(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)



;; ac-nrepl
					;(require 'ac-nrepl)
					; (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
					; (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
					; (eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))

;; theme
(load-theme 'solarized-dark t)
(desktop-save-mode t)
(ido-mode )
;;(clojure-mode)

;(put 'upcase-region 'disabled nil)
;
(defun nrepl-reset ()
 ; (interactive)
  ;(save-some-buffers)
  ;(set-buffer "*nrepl*")
  ;(goto-char (point-max))
  ;(insert "(user/reset)")
  ;(nrepl-return)
  )

;;(add-to-list 'load-path "/Users/bemcho/Projects/slime-master")
;;(require 'slime)
;;(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;;(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
;;(setq inferior-lisp-program "/usr/local/bin/sbcl")

(exec-path-from-shell-initialize)

;;;;Clang Cling REPL
(add-to-list 'load-path "~/.emacs.d/cling/")
(require 'cling)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
