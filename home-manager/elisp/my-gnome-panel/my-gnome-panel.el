;;; my-gnome-panel.el --- Start Gnome panel with EXWM -*- lexical-binding: t; -*-

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

;; Start Gnome panel with EXWM

;;; Code:
(require 'exwm)

;;;###autoload
(defun my-gnome-panel ()
  "Start Gnome panel with EXWM"
  (start-process-shell-command "my-gnome-panel" nil "my-gnome-panel"))

(add-hook 'exwm-init-hook 'my-gnome-panel)

(provide 'my-gnome-panel)
