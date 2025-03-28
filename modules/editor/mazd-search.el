;;; mazd//search.el --- Search -*- lexical-binding: t; -*-

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

(use-package engine-mode
  :disabled t
  :defer t
  :config
  (defengine amazon
    "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s")

  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s")

  (defengine google-images
    "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

  (defengine google-maps
    "http://maps.google.com/maps?q=%s"
    :docstring "Mappin' it up.")

  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s")

  (defengine youtube
    "http://www.youtube.com/results?aq=f&oq=&search_query=%s")

  (defengine wikipedia
    "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
    :docstring "Searchin' the wikis.")
  )

(use-package google-translate
  :defer t
  :commands (google-translate-at-point)
  :custom (google-translate-default-target-language "fa"))

(leader
  "s" '(:ignore t :which-key "Search")
  "st" 'google-translate-at-point
  "sA" 'engine/search-amazon
  "si" 'engine/search-google-images
  "sm" 'engine/search-google-maps
  "ss" 'engine/search-stack-overflow
  "sy" 'engine/search-youtube
  "sw" 'engine/search-wikipedia
  "sd" 'engine/search-duckduckgo
  "sh" 'engine/search-github)

(provide 'mazd-search)
;;; mazd//search.el ends here
