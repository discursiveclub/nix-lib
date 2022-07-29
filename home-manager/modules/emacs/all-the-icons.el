(require 'use-package)
(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-completion
  :after (all-the-icons marginalia)
  :config (all-the-icons-completion-mode)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup))
(use-package all-the-icons-dired
  :after (all-the-icons)
  :hook (dired-mode . all-the-icons-dired-mode))
(use-package all-the-icons-ibuffer
  :after (all-the-icons)
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))
