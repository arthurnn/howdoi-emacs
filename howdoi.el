;;; howdoi.el --- Use howdoi program to search Stackoverflow for the selected text

;; Copyright (C) 2013  Arthur Nogueira Neves

;; Author: Arthur Neves
;; URL: https://github.com/arthurnn/howdoi-emacs
;; Version: 0.1
;; Keywords: tools

;; This file is NOT part of GNU Emacs.

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

;; Use the howdoi command-line program to search Stackoverflow for
;; the text in the current region.

;; See https://github.com/gleitz/howdoi

;;; Code:

(defgroup howdoi nil
  "Integration with the \"howdoi\" command-line program."
  :group 'tools)

(defcustom howdoi-program "howdoi"
  "The path to the \"howdoi\" executable."
  :type 'file
  :group 'howdoi)

;;;###autoload
(defun howdoi (beg end)
  "Replace the region from BEG to END with the howdoi search results for that text."
  (interactive "r")
  (let ((terms (buffer-substring beg end)))
    (shell-command-on-region
     beg
     end
     (format "%s %s" howdoi-program (shell-quote-argument terms))
     t)))


(provide 'howdoi)
;;; howdoi.el ends here
