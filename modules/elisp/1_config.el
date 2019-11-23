;;; config.el --- Elisp -*- lexical-binding: t; -*-

;; Copyright (C) 2019  M.R. Siavash Katebzadeh

;; Author: M.R.Siavash Katebzadeh <mr.katebzadeh@gmail.com>
;; Keywords: lisp
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; byte-compile
(defun mk-byte-compile-init-dir ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory mk-emacs-dir 0))

(defun mk-remove-elc-on-save ()
  "If you're saving an Emacs Lisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(add-hook 'emacs-lisp-mode-hook 'mk-remove-elc-on-save)
(defun head (string)
  (substring string 0 1))

(defun tail (string)
  (substring string 1))

(defun string-distance
    (string1 string2)
  (cond ((= 0 (length string1)) (length string2))
	((= 0 (length string2)) (length string1))
	(t (min (+ (string-distance (tail string1) string2) 1)
		(+ (string-distance string1 (tail string2)) 1)
		(+ (string-distance (tail string1) (tail string2))
		   (if (string-equal (head string1)
				     (head string2))
		       0
		     1))))))
;;; config.el ends here
