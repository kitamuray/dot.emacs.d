;;; init.el --- user configuration
;;; Commentary:
;;; Code:

(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize))

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

(use-package auto-package-update
  :ensure t)

(use-package ddskk
  :ensure t
  :config
  (global-set-key "\C-x\C-j" 'skk-mode)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (global-set-key "\C-xt" 'skk-tutorial)
  (setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
  (defvar skk-egg-like-newline t))

(use-package ivy
  :ensure t
  :init (ivy-mode 1))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package moody
  :ensure t
  :config
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package org)

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup)))

(use-package markdown-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode)))

(use-package yatex
  :ensure t
  :init
  (defvar YaTeX-inhibit-prefix-letter t)
  :mode (("\\.tex\\'" . yatex-mode)
         ("\\.sty\\'" . yatex-mode)
         ("\\.ltx\\'" . yatex-mode))
  :config
  (defvar YaTeX-kanji-code 4))

(use-package rainbow-mode
  :ensure t
  :hook (emacs-lisp-mode text-mode lisp-mode))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq column-number-mode t)

(setq-default display-fill-column-indicator-column 80)
(global-display-fill-column-indicator-mode 1)
(set-face-foreground 'fill-column-indicator "blue")

(if window-system
    (setq default-frame-alist
          (append (list '(width . 100) '(height . 40) default-frame-alist))))
(add-to-list 'default-frame-alist '(font . "HackGen-12"))

(provide 'init)

;;; init.el ends here
