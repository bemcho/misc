(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default)))
 '(package-selected-packages
   (quote
    (function-args company-irony irony tabbar cuda-mode toggle-window srefactor stickyfunc-enhance company-ycm sr-speedbar cyberpunk-theme zenburn-theme solarized-theme rainbow-delimiters helm exec-path-from-shell auto-complete-clang)))
 '(vlf-application (quote dont-ask)))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)



;; function-args
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; rainbow delimiters
(setq rainbow-delimiters-mode t)

;; rainbow delimiters
(rainbow-delimiters-mode)

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
;;(require 'auto-complete-config)
;;(ac-config-default)
;;(define-key ac-completing-map "\M-/" 'ac-stop)



(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)



;; ac-nrepl
                                        ;(require 'ac-nrepl)
                                        ; (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
                                        ; (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
                                        ; (eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))

;; theme
(load-theme 'zenburn)

(desktop-save-mode t)
(ido-mode )
;;(clojure-mode)

                                        ;(put 'upcase-region 'disabled nil)
                                        ;
;;(defun nrepl-reset ()
                                        ; (interactive)
                                        ;(save-some-buffers)
                                        ;(set-buffer "*nrepl*")
                                        ;(goto-char (point-max))
                                        ;(insert "(user/reset)")
                                        ;(nrepl-return)
;;  )

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



;; ;; Use variable width font faces in current buffer
(defun my-buffer-face-mode-variable ()
  ;;   "Set font to a variable width (proportional) fonts in current buffer"
  (interactive)
  (setq buffer-face-mode-face '(:family "Menlo For Powerline" :height 100))
  (text-scale-adjust 1)
  (buffer-face-mode))

(setq system-uses-terminfo nil)
(add-hook 'term-mode-hook
          '(lambda ()
             (linum-mode 0)
             (term-set-escape-char ?\C-z)
             (term-set-escape-char ?\C-x)
             (define-key term-raw-map "\C-c" 'term-interrupt-subjob)
             (define-key term-raw-map (kbd "M-x") 'execute-extended-command)
             (setq autopair-dont-activate t)
             (setq ac-auto-start nil)
             (visual-line-mode -1)
             ;; (my-buffer-face-mode-variable)
             ))

(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

(defun my-term-pasteboard-paste ()
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (ns-get-pasteboard)))

(add-hook 'term-exec-hook '(lambda ()
                             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
                             (goto-address-mode)
                             (define-key term-raw-map (kbd "C-y") 'my-term-paste)
                             (define-key term-raw-map (kbd "s-v") 'my-term-pasteboard-paste)
                             (let ((base03 "#002b36")
                                   (base02 "#073642")
                                   (base01 "#586e75")
                                   (base00 "#657b83")
                                   (base0 "#839496")
                                   (base1 "#93a1a1")
                                   (base2 "#eee8d5")
                                   (base3 "#fdf6e3")
                                   (yellow "#b58900")
                                   (orange "#cb4b16")
                                   (red "#dc322f")
                                   (magenta "#d33682")
                                   (violet "#6c71c4")
                                   (blue "#268bd2")
                                   (cyan "#2aa198")
                                   (green "#859900"))
                               (setq ansi-term-color-vector
                                     (vconcat `(unspecified ,base02 ,red ,green ,yellow ,blue
                                                            ,magenta ,cyan ,base2))))))
(setq-default mode-line-buffer-identification
              '(:eval default-directory))

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(require 'speedbar)
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "C-c C-t") 'sr-speedbar-toggle)

(require 'irony)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers 'company-irony)
(add-to-list 'company-c-headers-path-system "/usr/local/include/llvm")
(add-to-list 'company-c-headers-path-system "/usr/local/include/armadillo")


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'text-mode-hook 'irony-mode)
(add-to-list 'auto-mode-alist '("\\.cling\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cling\\'" . semantic-mode))
(add-to-list 'auto-mode-alist '("\\.cling\\'" . company-mode))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-add-system-include "/usr/local/include/boost")
(semantic-add-system-include "/usr/local/include/armadillo")
(semantic-add-system-include "/usr/local/include/caf")
(semantic-add-system-include "/usr/local/include/caffe")
(semantic-add-system-include "/usr/local/include/opencv")
(semantic-add-system-include "/usr/local/include/opencv2")
(semantic-add-system-include "/usr/local/include/clang")
(semantic-add-system-include "/usr/local/include/cling")
(semantic-add-system-include "/usr/local/include/stan")
(semantic-add-system-include "/usr/local/include/eigen3")
(semantic-add-system-include "/usr/local/include/tesseract")
(global-semantic-idle-summary-mode 1)
(semantic-mode 1)

(require 'ede)
(global-ede-mode)
(require 'stickyfunc-enhance)

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(add-hook 'c-mode-common-hook   'hs-minor-mode)

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

(setq dtrt-indent-verbosity 0)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))


(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(add-to-list 'load-path "~/.emacs.d/vlfi")

(require 'vlf)
;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(global-set-key (kbd "C-x 5") 'window-toggle-split-direction)
(global-set-key (kbd "C-x 4") 'toggle-window-split)

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

(add-to-list 'load-path "~/.emacs.d/msearch/")
(require 'msearch)

(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook  'cua-mode)
(add-hook 'cua-mode-hook 'msearch-mode)

(line-number-mode t)

(defun close-and-kill-this-pane ()
  "If there are multiple windows, then close this pane and kill the buffer in it also."
  (interactive)
  (kill-this-buffer)
  (if (not (one-window-p))
      (delete-window)))

(global-set-key (kbd "C-w") ' close-and-kill-this-pane)

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "<delete>") 'delete-char)
(tabbar-mode)
