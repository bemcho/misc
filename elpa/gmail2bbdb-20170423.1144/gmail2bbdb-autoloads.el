;;; gmail2bbdb-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "gmail2bbdb" "gmail2bbdb.el" (23613 53573 390459
;;;;;;  863000))
;;; Generated autoloads from gmail2bbdb.el

(autoload 'gmail2bbdb-import-file "gmail2bbdb" "\
Import vCards from VCARD-FILE into BBDB.
If VCARD-FILE is a wildcard, import each matching file.
Existing BBDB records will be *overrided*.

\(fn VCARD-FILE)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; gmail2bbdb-autoloads.el ends here
