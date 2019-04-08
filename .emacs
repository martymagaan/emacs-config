(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#fff" :background "#000000"))))
 '(escape-glyph ((t (:foreground "#0f0"))))
 '(font-lock-builtin-face ((t (:foreground "#ccc"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#686868"))))
 '(font-lock-comment-face ((t (:foreground "#686868"))))
 '(font-lock-constant-face ((t (:foreground "#98d"))))
 '(font-lock-doc-face ((t (:foreground "#888"))))
 '(font-lock-function-name-face ((t (:foreground "#7cf"))))
 '(font-lock-keyword-face ((t (:foreground "#27c"))))
 '(font-lock-preprocessor-face ((t (:foreground "#aaa"))))
 '(font-lock-string-face ((t (:foreground "#98d"))))
 '(font-lock-variable-name-face ((t (:foreground "#7cf"))))
 '(font-lock-warning-face ((t (:foreground "#f00"))))
 '(fringe ((t (:foreground "#000000" :background "#000000"))))
 '(homoglyph ((t (:foreground "#0f0"))))
 '(link ((t (:foreground "#0f0"))))
 '(link-visited ((t (:foreground "#0f0"))))
 '(minibuffer-prompt ((t (:foreground "#0f0"))))
 '(mode-line ((t (:foreground "#ddd" :background "#4a4a4a"))))
 '(mode-line-inactive ((t (:foreground "#777" :background "#282828"))))
 '(region ((t (:background "#333"))))
 '(tooltip ((t (:background "#333"))))
 '(vertical-border ((t (:foreground "#111")))))

; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; Neo Tree
(add-to-list 'load-path ".emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))

; Scrolling Speed
(defun scroll-up-slow () (interactive)(scroll-up 8))
(defun scroll-down-slow () (interactive)(scroll-down 8))

(global-set-key [?\M-v] 'scroll-down-slow)
(global-set-key [?\C-v] 'scroll-up-slow)

; Open Shell In Same Buffer
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

; Easy Window Switching
(windmove-default-keybindings)

; Window Layout
(defun win1 ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (split-window-below)
  (delete-window))

(defun win2 ()
  (interactive)
  (win1)
  (split-window-right)
  (other-window 2)
  (split-window-right)
  (other-window 2))

(defun win3 ()
  (interactive)
  (split-window-right)
  (split-window-right)
  (split-window-below)
  (other-window 3)
  (delete-window)
  (other-window 2)
  (split-window-right)
  (split-window-below)
  (other-window 2)
  (split-window-below)
  (other-window -2))

; AutoComplete
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu 0)
(setq ac-delay 0)

; Turn Off Auto Backup
(setq make-backup-files nil)

; Turn Off Auto Save
(setq auto-save-default nil)

; Undo Limit
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Turn Off Chime Noise
(setq ring-bell-function #'ignore)

; Spaces for Tabs
(setq-default indent-tabs-mode nil)

; Disable Auto-Indent
(when (fboundp 'electric-indent-mode ) (electric-indent-mode -1))

; Use Bash Shell
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

; Tab Length
(setq-default c-basic-offset 2)
(add-hook 'java-mode-hook (lambda ()
   (setq c-basic-offset 2)))

; Buffer On Same Window
(global-set-key "\C-x\C-b" 'buffer-menu)

; Hide Menu Bar
(menu-bar-mode -1)

; Hide Toolbar
(tool-bar-mode -1)

; Hide Scrollbars
(scroll-bar-mode -1)

; Line Number Margin
(setq linum-format "%d ")

; Show Line Numbers
(global-linum-mode t)

; Slower Mouse Scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
    (setq mouse-wheel-follow-mouse 't)
    (setq scroll-step 1)

; Horizontal mouse scroll
(defun h-scroll-right()
  (interactive)
  (scroll-left 5))
(defun h-scroll-left()
  (interactive)
  (scroll-right 5))
(global-set-key (kbd "M-p") 'h-scroll-right)
(global-set-key (kbd "M-n") 'h-scroll-left)

; Enable clipboard pasting
(setq x-select-enable-clipboard t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages (quote (free-keys web-mode)))
 '(put (quote scroll-left) t)
 '(safe-local-variable-values
   (quote
    ((eval when
           (require
            (quote rainbow-mode)
            nil t)
           (rainbow-mode 1)))))
 '(scroll-conservatively 100)
 '(truncate-lines t))
