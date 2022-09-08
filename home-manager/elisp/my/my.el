;;; my.el --- General Emacs configuration and utilities -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Sophist

;; Author: sophist <sophist@discursive.club>

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

;; General Emacs configuration and utilities.

;;; Code:
(defun my-buffer-compare (b1 b2)
  (string-collate-lessp (buffer-name b1) (buffer-name b2) nil t))

;;;###autoload
(defun my-switch-buffer (&optional prefix)
  (interactive "p")
  (if (eq prefix 4)
      (ibuffer)
    (ido-switch-buffer)))

;;; Configuration theme:
(deftheme my)
(custom-theme-set-variables
 'my
 '(auto-save-visited-mode t)
 '(backup-directory-alist '(("." . "~/.config/emacs/backups")))
 '(custom-file "~/.config/emacs/custom.el")
 '(desktop-restore-frames nil)
 '(display-line-numbers-minor-tick 10)
 '(display-line-numbers-width-start t)
 '(emacs-lisp-docstring-fill-column t)
 '(emacs-lisp-mode-hook
   '(eldoc-mode imenu-add-menubar-index checkdoc-minor-mode paredit-mode))
 '(fill-column 80)
 '(fringe-mode 1)
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 `(inhibit-startup-echo-area-message ,(getenv "USER"))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(prog-mode-hook '(flyspell-prog-mode flymake-mode display-line-numbers-mode))
 '(save-interprogram-paste-before-kill t)
 '(save-place-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(sh-basic-offset 2)
 '(show-paren-delay 0.25)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(whitespace-action '(auto-cleanup))
 '(whitespace-global-modes '(prog-mode))
 '(whitespace-line-column nil)
 '(whitespace-style
   '(face trailing lines-tail missing-newline-at-eof empty indentation
          space-after-tab space-before-tab)))
(provide-theme 'my)

(provide 'my)
