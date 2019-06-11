;;; init.el --- init file -*- lexical-binding: t; -*-

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

;; A bare-boned config template. Use "outshine-cycle-buffer" (<Tab> and <S-Tab>
;; in org style) to navigate through sections, and "imenu" to locate individual
;; use-package definition.

(message "Starting MK")

;;; Speed up startup
(eval-when-compile (require 'cl))

(lexical-let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))

(let ((gc-cons-threshold (* 256 1024 1024))
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil)))

;;; Basic configs
; stop creating backup~ files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(let ((backup-dir "~/.emacs.d/backups")
      (auto-saves-dir "~/.emacs.d/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))
(setq backup-by-copying t
      delete-old-versions t
      version-control t
      kept-new-versions 5
      kept-old-versions 2)
(setq custom-file "~/.emacs.d/backups/custom.el")
(load custom-file 'noerror)

;;; Path vars
(setq user-emacs-directory (file-name-directory load-file-name))
(defvar mk-emacs-dir
  (eval-when-compile (file-truename user-emacs-directory))
  "The path to the currently loaded .emacs.d directory. Must end with a slash.")

(defvar mk-core-dir (concat mk-emacs-dir "core/")
  "The root directory of MK's core files. Must end with a slash.")

(defvar mk-modules-dir (concat mk-emacs-dir "modules/")
"The root directory for MK's modules. Must end with a slash.")

(defvar mk-lisp-dir (concat mk-emacs-dir "site-lisp/")
  "The root directory of MK's external files. Must end with a slash.")

(defvar mk-ui-dir (concat mk-emacs-dir "ui/")
  "The root directory of MK's UI files. Must end with a slash.")

;;; Load directory function
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(defun load-modules (dir)
  (mapcar 'load (directory-files-recursively dir "")))

;;; Load core
(add-to-list 'load-path mk-core-dir)
(add-to-list 'load-path mk-lisp-dir)
(require 'core)
(message "Core has been loaded.")
;;; Load Theme 
(load-modules mk-ui-dir)
;;; Load modules
(load-modules mk-modules-dir)
(provide 'init)

;;; init.el ends here
