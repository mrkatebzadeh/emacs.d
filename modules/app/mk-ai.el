;;; mk-ai.el --- AI -*- lexical-binding: t; -*-

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

(use-package gptel
  :ensure t
  :defer t
  :commands gptel
  :init
  (defun get-key ()
    (mk-lookup-password :host "gemini")
    )
  (setq
   gptel-default-mode 'org-mode
   gptel-model "gemini-pro"
   gptel-backend (gptel-make-gemini "Gemini"
		   :key 'get-key
                   :stream t)))

(leader
  "ag" 'gptel)

(provide 'mk-ai)
;;; mk-ai.el ends here