(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(server-start)

(keyboard-translate ?\C-u ?\C-x)
  (keyboard-translate ?\C-x ?\C-u)

  (define-key key-translation-map [?\M-x] [?\M-u])
  (define-key key-translation-map [?\M-u] [?\M-x])

  (setenv "PATH" (concat (getenv "PATH") ";C:\\Program Files\\Git\\mingw64\\bin"))

(require 'helm-config)
(helm-mode 1)

(add-to-list 'load-path "~/.emacs.d/scripts")
(let ((default-directory  "~/.emacs.d/scripts/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'better-defaults)
(require 'auto-indent-mode)

(auto-indent-global-mode)

(global-linum-mode)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)))

(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.clj\\'" . lisp-mode))

(global-set-key (kbd "M-m") 'delete-indentation)
(global-set-key (kbd "C-S-z") 'revert-buffer)

(global-set-key (kbd "C-.") 'avy-goto-word-1)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
