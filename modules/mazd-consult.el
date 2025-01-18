;;; mazd//consult.el --- Consult -*- lexical-binding: t; -*-

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

(when (string= mazd//completion "light")

  (use-package consult
    :ensure t
    :defer t
    :commands
    (consult-grep
     consult-find
     consult-outline
     consult-line
     consult-buffer
     ))

  (use-package consult-tramp
    :ensure nil
    :defer t
    :commands (consult-tramp))

  (use-package consult-flyspell
    :defer t
    :ensure t
    :bind ("M-g s" . consult-flyspell))

  (use-package consult-yasnippet
    :defer t
    :ensure t
    :bind ("M-g y" . consult-yasnippet))

;;; Files
  (leader
    "fK" 'consult-yank-kill-ring
    "fr" 'consult-recent-file
    "ft" 'consult-tramp
    "ff" 'find-file)
;;; Insert
  (leader
    "is" 'consult-yasnippet)

  (leader
    "lt" 'consult-flymake)
  )
(provide 'mazd-consult)
;;; mazd//consult.el ends here