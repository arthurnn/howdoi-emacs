;;; howdoi.el --- Emacs inlune stackoverflow`s search

;; Copyright © 2013 Arthur Nogueira Neves

;; Author: Arthur Neves
;; URL: https://github.com/arthurnn/howdoi-emacs
;; Version: 0.1

;; This file is NOT part of GNU Emacs.

;;; Code:

(defvar howdoi-program "howdoi")

(defun howdoi--exec-comand (command)
  (shell-command-on-region
   (region-beginning)
   (region-end)
   command
   t))


;;;###autoload
(defun howdoi ()
  "How do I? search on stackoverflow"
  (interactive)
  (let ((command (buffer-substring (region-beginning) (region-end))))
      (howdoi--exec-comand (format "%s %s" howdoi-program command))
      ))

(provide 'howdoi)
;;; howdoi.el ends here
