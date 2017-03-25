(require 'comint)

;;; Code:
(defvar cling-buffer-name "*inferior-cling*")
(defvar cling-process-name "inferior-cling")
(defvar cling-cxx-flags "-std=c++14")

(defun cling-display-buffer-hook ()
  (display-buffer-at-bottom (get-buffer cling-buffer-name) '(inhibit-switch-frame t)))

(defun cling-get-or-create-process ()
  (or (get-process cling-process-name)  (cling)))

(defun cling (&optional flags)
  "Move to the buffer containing Cling, or create one if it does not exist. Defaults to C++11"
  (interactive)
  (let ((flags (or flags cling-cxx-flags)))
    (cling-display-buffer-hook)
    (make-comint cling-process-name "cling" nil flags)
    (setq scroll-margin 1
	  scroll-conservatively 0
	  scroll-up-aggressively 0.01
	  scroll-down-aggressively 0.01)
    
    (get-process cling-process-name)))


(defun cling-send-string (string &optional process)
  "Send a string terminated with a newline to the inferior-cling buffer. Has the effect of executing a command"
  (let ((process (or process (cling-get-or-create-process))))
    (cling-display-buffer-hook)
    (comint-send-string process string)
    (comint-send-string process "\n")
    ))

(defun cling-send-region (start end)
  "Sends the region in the current buffer between `start` and `end` to the inferior-cling buffer. Sends the currently selected region when called interactively."
  (interactive "r")
  (cling-display-buffer-hook)
  (cling-send-string  (buffer-substring start end)))

(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
	(end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end)))))


(defun cling-send-line ()
  "Sends the current line to the inferior-cling buffer."
  (interactive)
  (cling-send-string  (quick-copy-line)))


(defun cling-send-buffer ()
  "Sends the current buffer to the inferior-cling buffer."
  (interactive)
  (cling-send-region (point-min) (point-max))) ;;do i want to wrap-raw this? 

(defun cling-wrap-raw (string)
  "Wraps `string` in \".rawInput\", which tells Cling to accept function definitions"
  (format ".rawInput\n%s\n.rawInput" string))

(defun cling-wrap-region-and-send (start end)
  "Sends the region between start and end (currently selected when called interactively) to cling in raw input mode "
  (interactive "r")
  (cling-send-string (cling-wrap-raw (buffer-substring start end))))

(defun flatten-function-def ()
  "Flattens a function definition into a single line. This makes it easier to send to the inferior-cling buffer"
  (interactive)
  (replace-regexp "
" "" nil (mark) (point))) ;;;Why did I do this again? 

(defun select-defun ()
  "Selects the defun containing the point. Currently only works when point is on the line where the function's name is declared."
  (interactive)
  (move-beginning-of-line nil)
  (push-mark (point))
  (re-search-forward "{")
  (save-excursion
    (flatten-function-def))
  (backward-char)
  (forward-sexp))

(defun cling-wrap-defun-and-send ()
  "Sends the current defun to cling in raw input mode. Currently only works when point is on the first line of function definition."
  (interactive)
  (save-excursion
    (select-defun)
    (cling-wrap-region-and-send (mark) (point))
    (undo)
    (undo)));;;this is a rather leaky way of doing temporary changes. there should be some way to save buffer contents or something
;;;probably uses with-temp-buffer

(add-hook 'tex-mode-hook
	  (lambda ()
	    (local-set-key (quote [f1]) (quote help-for-help))))

(defvar inferior-cling-keymap
  (let ((map (current-global-map)))
    (define-key map (kbd "C-c l") 'cling-send-line)
    (define-key map (kbd "C-c e") 'cling-send-region)
    (define-key map (kbd "C-c d") 'cling-wrap-defun-and-send)
    (define-key map (kbd "C-c b") 'cling-send-buffer)
    ;; let's bind the new command to a keycombo
    (define-key map (kbd "C-c c") 'cling-clear-buffer)

    map))

(defun cling-clear-buffer ()
  (interactive)
  (save-current-buffer 
    (save-excursion
      (set-buffer  cling-buffer-name)
      (comint-clear-buffer))))

(define-minor-mode inferior-cling-mode
  "Toggle inferior-cling-mode. Interactively w/o arguments, this command toggles the mode. A positive prefix argument enables it, and any other prefix argument disables it. 

When inferior-cling-mode is enabled, we rebind keys to facilitate working with cling."
  :keymap inferior-cling-keymap)
(add-hook 'inferior-cling-mode-hook
	  (function (lambda ()
		      (setq comint-output-filter-functions 'comint-truncate-buffer
			    comint-process-echoes t
			    comint-buffer-maximum-size 5000
			    comint-scroll-show-maximum-output t
			    comint-input-ring-size 500))))



(provide 'cling)



;;; cling.el ends here
