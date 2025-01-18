;;; mazd//eshell.el --- Eshell  -*- lexical-binding: t; -*-

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

;;; Commentary:

;;

;;; Code:

(eval-when-compile
  (require 'mazd-vars)
  (require 'mazd-key)
  (require 'mazd-core))

(use-package sh-script
  :ensure t
  :defer t
  :hook (after-save . executable-make-buffer-file-executable-if-script-p))

(use-package aweshell
  :ensure nil
  :defer t
  :load-path (lambda () (concat mazd//lisp-dir "/aweshell/"))
  :commands (aweshell-toggle aweshell-dedicated-toggle)
  :bind
  (("C-\\" . aweshell-dedicated-toggle)))


(defun mazd//update-ticket()
  (interactive)
  (let ((command (format
		  "echo %s | kinit %s@%s && cd %s && pssh -h %s -l %s 'echo %s | kinit; aklog -force'"
		  staff-password
		  "s1691546"
		  staff-realm
		  staff-phd
		  staff-hosts
		  "s1691546"
		  staff-password)))
    (shell-command command)))

(defun mazd//scp-project ()
  (interactive)
  (let*
      ((dir
	(file-name-nondirectory
	 (directory-file-name
	  (file-name-directory
	   (projectile-project-root)))))

       (command
	(format
	 "rsync -rav -e ssh   --exclude=build --exclude='.git*' %s %s%s"
	 (projectile-project-root)
	 staff-project
	 dir)))
    (shell-command command)))

;;; bindings
(general-define-key
 :prefix "SPC"
 :states '(normal visual motion)
 :keymaps 'override
 "S" '(:ignore t :which-key "Shell")
 )
(general-define-key
 :prefix "SPC S"
 :states '(normal visual motion)
 :keymaps 'override
 "s" 'aweshell-toggle
 "n" 'aweshell-new
 "a" 'aweshell-dedicated-toggle
 "t" 'eshell-toggle
 "u" 'mazd//update-ticket
 "c" 'mazd//scp-project)



(provide 'mazd-eshell)
;;; mazd//eshell.el ends here