(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#7cf"))))
 '(escape-glyph ((t (:foreground "#0f0"))))
 '(font-lock-builtin-face ((t (:foreground "#7fc"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#8ac"))))
 '(font-lock-comment-face ((t (:foreground "#8ac"))))
 '(font-lock-constant-face ((t (:foreground "#98d"))))
 '(font-lock-doc-face ((t (:foreground "#bac"))))
 '(font-lock-function-name-face ((t (:foreground "#7fc"))))
 '(font-lock-keyword-face ((t (:foreground "#27c"))))
 '(font-lock-preprocessor-face ((t (:foreground "#aaa"))))
 '(font-lock-string-face ((t (:foreground "#edc"))))
 '(font-lock-variable-name-face ((t (:foreground "#7fc"))))
 '(font-lock-warning-face ((t (:foreground "#f00"))))
 '(fringe ((t (:foreground "#000000" :background "#000000"))))
 '(linum ((t (:foreground "#444"))))
 '(homoglyph ((t (:foreground "#0f0"))))
 '(link ((t (:foreground "#0f0"))))
 '(link-visited ((t (:foreground "#0f0"))))
 '(minibuffer-prompt ((t (:foreground "#0f0"))))
 '(mode-line ((t (:foreground "#ddd" :background "#2b2b2b"))))
 '(mode-line-inactive ((t (:foreground "#777" :background "#222"))))
 '(region ((t (:background "#181818"))))
 '(tooltip ((t (:background "#333"))))
 '(vertical-border ((t (:foreground "#333"))))
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "#7fc"))))
 '(neo-file-link-face ((t (:foreground "#fff")))))

; Set symbol for the border
(set-display-table-slot standard-display-table
  'vertical-border (make-glyph-code ?│))

; Scrolling Speed
(defun scroll-up-slow () (interactive)(scroll-up 8))
(defun scroll-down-slow () (interactive)(scroll-down 8))

(global-set-key [?\M-v] 'scroll-down-slow)
(global-set-key [?\C-v] 'scroll-up-slow)

; Open Shell In Same Buffer
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

; Easy Window Switching
(windmove-default-keybindings)
(setq windmove-wrap-around t)

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

; Neo Tree
(add-to-list 'load-path "~/.emacs.d/lib/neotree")
(require 'neotree)
(setq neo-theme 'ascii)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(neotree-toggle)
(neotree-hidden-file-toggle)
(other-window -1)

; AutoComplete
(add-to-list 'load-path "~/.emacs.d/lib/popup")
(add-to-list 'load-path "~/.emacs.d/lib/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu 0)
(setq ac-delay 0)

; General package path
(add-to-list 'load-path "~/.emacs.d/lib")

; Free Keys
(require 'free-keys)

; Indent Hint
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(set-face-foreground 'highlight-indent-guides-character-face "#333")

; PHP Mode
(add-to-list 'load-path "~/.emacs.d/lib/php-mode")
(require 'php-mode)
