;;; mazd-zig.el --- Zig -*- lexical-binding: t; -*-

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

(use-package zig-mode
  :ensure t
  :defer t
  )

(general-define-key
 :prefix "SPC k"
 :states '(normal visual motion)
 :keymaps '(zig-mode-map)
 "" '(:ignore t :which-key "Zig mode")
 "<escape>" '(keyboard-escape-quit :which-key t)
 "b" '(zig-compile :which-key "build")
 "r" '(zig-run :which-key "run")
 "t" '(zig-test :which-key "test")
 )



(provide 'mazd-zig)
;;; mazd-zig.el ends here
