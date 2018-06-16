
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
                                        ;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("stablemelpa" . "http://stable.melpa.org/packages") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'load-path "~/.emacs.d/custom")
;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(require 'volatile-highlights)
(volatile-highlights-mode t)

(package-initialize)
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
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default)))
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(package-selected-packages
   (quote
    (swift3-mode dash-at-point rainbow-identifiers magithub common-lisp-snippets spacemacs-theme ada-mode multiple-cursors ac-slime paredit magit ggtags company-irony-c-headers function-args company-irony irony tabbar cuda-mode toggle-window srefactor stickyfunc-enhance company-ycm sr-speedbar cyberpunk-theme zenburn-theme solarized-theme rainbow-delimiters helm exec-path-from-shell auto-complete-clang)))
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(select-active-regions t)
 '(show-paren-mode t)
 '(tabbar-separator (quote (0.5)))
 '(tool-bar-mode nil))
'(tool-bar-mode nil)

'(vlf-application (quote dont-ask))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm))
                                        ;(require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
                                        ;(require 'setup-editing)



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
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight semi-bold :height 113 :width normal)))))

;; rainbow delimiters
(setq rainbow-delimiters-mode t)

;; rainbow delimiters
(rainbow-delimiters-mode)

;; turn off bell
(setq visible-bell t)
;; misc. settings
(global-font-lock-mode)
(show-paren-mode 1)
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
;; (defun my-buffer-face-mode-variable ()
;;   ;;   "Set font to a variable width (proportional) fonts in current buffer"
;;   (interactive)
;;   (setq buffer-face-mode-face '(:family "Menlo For Powerline" :height 100))
;;   (text-scale-adjust 1)
;;   (buffer-face-mode))

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

(require 'cc-mode)
(require 'irony)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(defvar company-c-headers-path-system (list nil))
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers 'company-irony)



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
(eval-after-load 'smartparens
  '(progn
     (sp-pair "(" nil :actions '(:rem insert))
     (sp-pair "[" nil :actions '(:rem insert))
     (sp-pair "'" nil :actions '(:rem insert))
     (sp-pair "\"" nil :actions '(:rem insert))
     (sp-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))
     )
  )
;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode erlang-mode))

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))


(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 )

(add-to-list 'load-path "~/.emacs.d/vlf")

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


                                        ;(cua-mode t)
                                        ;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
                                        ;(transient-mark-mode 1) ;; No region when it is not highlighted
                                        ;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

(add-to-list 'load-path "~/.emacs.d/msearch/")
(require 'msearch)

(setq-default major-mode 'text-mode)
                                        ;(add-hook 'text-mode-hook  'cua-mode)
                                        ;(add-hook 'cua-mode-hook 'msearch-mode)

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
  (forward-line arg))
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "<delete>") 'delete-char)
(tabbar-mode)

                                        ;(add-to-list 'company-c-headers-path-system "/usr/local/include/llvm")
                                        ;(add-to-list 'company-c-headers-path-system "/usr/local/include/armadillo")

(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.9.1/emacs"
                       load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.ex\\'" . erlang-mode))
(setq indent-tabs-mode nil)

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun close-and-kill-this-pane ()
  "If there are multiple windows, then close this pane and kill the buffer in it also."
  (interactive)
  (kill-this-buffer)
  (if (not (one-window-p))
      (delete-window)))



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

(defun my-hyperspec-setup ()
  (let ((dir (locate-dominating-file "/home/bemcho/.slime-sbcl/HyperSpecDoc/" "HyperSpec/")))
    (if dir
        (progn
          (setq common-lisp-hyperspec-root (expand-file-name "HyperSpec/" dir)))
      (warn "No HyperSpec directory found"))))

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

(defun user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (menu-bar-mode)
                                        ;(cua-mode t)

  (require 'paredit)

  (global-set-key (kbd "C-%") 'window-toggle-split-direction)
  (global-set-key (kbd "C-$") 'toggle-window-split)

  (add-to-list 'load-path "~/.emacs.d/msearch/")
  (require 'msearch)
  (msearch-mode)
  
  (my-hyperspec-setup)
  (require 'slime-autoloads)
  (setq inferior-lisp-program "/usr/bin/sbcl")
  ;;Also setup the slime-fancy contrib

                                        ;(require 'slime)
  (setq slime-lisp-implementations
        '((sbcl ("sbcl" "--core" "/home/bemcho/.slime-sbcl/sbcl.core-for-slime"))))
  (add-hook 'slime-load-hook
            #'(lambda ()
                (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)))

  
  (setq slime-complete-symbol*-fancy t
        slime-complete-symbol-function 'slime-fuzzy-complete-symbol
        slime-when-complete-filename-expand t
        slime-truncate-lines nil
        slime-autodoc-use-multiline-p t)
  (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))

  (add-to-list 'slime-contribs 'slime-repl) 
  (slime-setup '(slime-fancy))
                                        ;
  (eval-after-load 'slime-repl
    `(define-key slime-repl-mode-map (kbd "C-<tab>") 'slime-fuzzy-complete-symbol))
  
  (require 'ac-slime)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode))

  (defun add-ac-slime-fuzzy ()
    (setq ac-sources '(ac-source-slime-fuzzy)))

  (add-hook 'slime-repl-mode-hook 'auto-complete-mode)
  (add-hook 'slime-repl-mode-hook 'paredit-mode)
  (add-hook 'slime-repl-mode-hook 'add-ac-slime-fuzzy)
  (add-hook 'slime-mode-hook 'add-ac-slime-fuzzy 'slime-repl)

  (define-key ac-mode-map (kbd "M-/") 'auto-complete)
  (ac-set-trigger-key "M-/")
  (global-set-key (kbd "C-SPC") 'slime-complete-form)

  (setq ac-auto-start nil)

  ;; Specify where backup files are stored
  (setq backup-directory-alist (quote ((".*" . "~/.backups"))))


  (require 'multiple-cursors)
  (global-set-key (kbd "C-S-c") 'mc/mark-all-dwim)

  (require 'tabbar)
  ;; Tabbar settings
  (set-face-attribute
   'tabbar-default nil
   :background "gray20"
   :foreground "gray20"
   :box '(:line-width 1 :color "gray20" :style nil))
  (set-face-attribute
   'tabbar-unselected nil
   :background "gray30"
   :foreground "white"
   :box '(:line-width 5 :color "gray30" :style nil))
  (set-face-attribute
   'tabbar-selected nil
   :background "gray75"
   :foreground "black"
   :box '(:line-width 5 :color "gray75" :style nil))
  (set-face-attribute
   'tabbar-highlight nil
   :background "white"
   :foreground "black"
   :underline nil
   :box '(:line-width 5 :color "white" :style nil))
  (set-face-attribute
   'tabbar-button nil
   :box '(:line-width 1 :color "gray20" :style nil))
  (set-face-attribute
   'tabbar-separator nil
   :background "gray20"
   :height 0.6)

  ;; Change padding of the tabs
  ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
  (custom-set-variables
   '(tabbar-separator (quote (0.5))))
  
  (tabbar-mode 1)
  (global-set-key [M-left] 'tabbar-backward-tab)
  (global-set-key [M-right] 'tabbar-forward-tab)
  (global-set-key (kbd "C-;") 'other-window)
  (global-set-key (kbd "C-\\") 'redo)
  (require 'sr-speedbar)
  
  (setq speedbar-hide-button-brackets-flag nil
        speedbar-show-unknown-files t
        speedbar-smart-directory-expand-flag nil
        speedbar-directory-button-trim-method 'trim
        speedbar-use-images t
        speedbar-indentation-width 2
        sr-speedbar-width 40
        sr-speedbar-width-x 40
        sr-speedbar-auto-refresh nil
        sr-speedbar-skip-other-window-p t
        sr-speedbar-right-side nil)

  ;; More familiar keymap settings.
  (add-hook 'speedbar-reconfigure-keymaps-hook
            '(lambda ()
               (define-key speedbar-mode-map [S-up] 'speedbar-up-directory)
               (define-key speedbar-mode-map [right] 'speedbar-flush-expand-line)
               (define-key speedbar-mode-map [left] 'speedbar-contract-line)))

  ;; Always use the last selected window for loading files from speedbar.
  (defvar last-selected-window
    (if (not (eq (selected-window) sr-speedbar-window))
        (selected-window)
      (other-window)))

  (defadvice select-window (after remember-selected-window activate)
    "Remember the last selected window."
    (unless (or (eq (selected-window) sr-speedbar-window) (not (window-live-p (selected-window))))
      (setq last-selected-window (selected-window))))

  (defun sr-speedbar-before-visiting-file-hook ()
    "Function that hooks `speedbar-before-visiting-file-hook'."
    (select-window last-selected-window))

  (defun sr-speedbar-before-visiting-tag-hook ()
    "Function that hooks `speedbar-before-visiting-tag-hook'."
    (select-window last-selected-window))

  (defun sr-speedbar-visiting-file-hook ()
    "Function that hooks `speedbar-visiting-file-hook'."
    (select-window last-selected-window))

  (defun sr-speedbar-visiting-tag-hook ()
    "Function that hooks `speedbar-visiting-tag-hook'."
    (select-window last-selected-window))

  ;; Highlight the current line
  (add-hook 'speedbar-mode-hook '(lambda () (hl-line-mode 1)))

  (global-set-key [f8] 'sr-speedbar-toggle)
  
  (speedbar-add-supported-extension ".lisp")
  ;;speedbar end


  (linum-mode)
  (ac-config-default)
  (ido-mode)

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
  (desktop-save-mode t)
  (setq-default mode-line-buffer-identification
                '(:eval default-directory))

  (global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

  (global-set-key (kbd "C-S-W") ' close-and-kill-this-pane)
  
  );;end user-config

;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))

                                        ;__________________________________________________________________________
;;;;    System Customizations 

;; Set buffer behaviour
(setq next-line-add-newlines nil)
(setq scroll-step 1)
(setq scroll-conservatively 5)

;; Enable emacs functionality that is disabled by default
(put 'eval-expression 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq enable-recursive-minibuffers t)

;; Misc customizations
(fset 'yes-or-no-p 'y-or-n-p)           ;replace y-e-s by y
(setq inhibit-startup-message t)        ;no splash screen
(defconst use-backup-dir t)             ;use backup directory
(defconst query-replace-highlight t)    ;highlight during query
(defconst search-highlight t)           ;highlight incremental search
(setq ls-lisp-dirs-first t)             ;display dirs first in dired
(global-font-lock-mode t)               ;colorize all buffers
(setq ecb-tip-of-the-day nil)           ;turn off ECB tips
(recentf-mode 1)                        ;recently edited files in menu

;; Set the name of the host and current path/file in title bar:
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Conventional mouse/arrow movement & selection
(delete-selection-mode t)
;;__________________________________________________________________________
;;;;    Programming - Common Lisp
(defadvice hyperspec-lookup (around hyperspec-lookup-around)
  "I always want `hyperspec-lookup' to use 'w3m-browse-url."
  (let ((browse-url-browser-function 'w3m-browse-url))
    ad-do-it))

(ad-activate 'hyperspec-lookup)
;; Specify modes for Lisp file extensions
(setq auto-mode-alist
      (append '(
                ("\\.emacs$" . emacs-lisp-mode)
                ("\\.lisp$" . lisp-mode)
                ("\\.lsp$" . lisp-mode)
                ("\\.cl$" . lisp-mode)
                ("\\.system$" . lisp-mode)
                ("\\.scm$" . scheme-mode)
                ("\\.ss$" . scheme-mode)
                ("\\.sch$" . scheme-mode)
                )auto-mode-alist))
(put 'lisp-mode 'derived-mode-paren 'prog-mode)
(add-hook 'lisp-mode-hook 'rainbow-identifiers-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)

(defun slime-enable-concurrent-hints ()
  (interactive)
  (setf slime-inhibit-pipelining nil))

(user-config)









