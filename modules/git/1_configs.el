;;; configs.el --- Git -*- lexical-binding: t; -*-

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

;;; magit
(with-eval-after-load 'magit
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
  (evil-magit-init))

;;; git-gutter
(with-eval-after-load 'git-gutter-fringe+
  (global-git-gutter+-mode t)
  (custom-set-variables '(git-gutter:update-interval 2))
  (set-face-foreground 'git-gutter-fr+-modified "purple")
  (set-face-foreground 'git-gutter-fr+-added "green")
  (set-face-foreground 'git-gutter-fr+-deleted "red")
  (setq git-gutter-fr+-side 'right-fringe)
  (setq-default left-fringe-width  20
		right-fringe-width 10)

  (fringe-helper-define 'git-gutter-fr+-added nil
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX....."
			".XX.....")
  
  (fringe-helper-define 'git-gutter-fr+-deleted nil
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX."
			".XXXXXX.")
  
  (fringe-helper-define 'git-gutter-fr+-modified nil
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."
			".XXXX..."))

;;; configs.el ends here
