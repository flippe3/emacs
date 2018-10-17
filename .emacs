;;Elisp made by Filip
;;M is for Alt
;;C is for Ctrl
;;;Code:
;;So you can undo very very many times
(setq undo-limit 200000000)
(setq undo-strong-limit 40000000)

;;The blue line thing
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "midnight blue")

;;4 space tabs in C
(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
(defvaralias 'c-basic-offset 'tab-width)
(global-visual-line-mode t)
;;Clock 24 hours
(setq display-time-format "%H:%M");change H to I for 12 hours
(display-time-mode 1)
(column-number-mode)
;;Turn off the toolbar
;;(tool-bar-mode 0)
;;(scroll-bar-mode -1)

;;Cua mode enabled which is c-c c-v
(cua-mode 1)

;;Smooth scroll
(setq scroll-step 3)

;;Theme stuff
(menu-bar-mode -1)

(define-key global-map "\ew" 'other-window); Changes frame with alt-w
(define-key global-map "\ef" 'find-file); find file with alt f
(define-key global-map "\eF" 'find-file-other-window)
(define-key global-map "\eu" 'undo); Alt-U to undo
(define-key global-map "\eq" 'copy-region-as-kill); Copy block with Alt-Q
(define-key global-map "\e^" 'captilize-word); Alt-^ to capitilize word
(define-key global-map "\e6" 'upcase-word);M-6 to upcase word
(define-key global-map "\e^" 'captilize-word);M-^ to capitilize word
(define-key global-map "\es" 'save-buffer); M-S to
(define-key global-map "\e+" 'save-buffers-kill-terminal); Exit emacs
(define-key global-map "\e1" 'buildfile)
(define-key global-map "\e2" 'runfile)
(define-key global-map "\eq" 'indent-buffer); Changes frame with alt-w

;;Enables flycheck to always be on
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;Tab thingy
;;(define-key global-map [S-tab] 'indent-for-tab-command)
;;(define-key global-map [backtab] 'indent-for-tab-command)
(define-key global-map "\C-y" 'indent-for-tab-command)
(define-key global-map [C-tab] 'indent-region)

;; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
;;(split-window-horizontally)

;;Melpa
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.org/packages/") t)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
(load-theme 'klere t)
  ;; set theme
;;(set-foreground-color "red")
;;(set-background-color "#000000")
;;(set-face-attribute 'region nil :background "#0000FF" :foreground "#FFFFFF")
;;(set-face-foreground 'font-lock-comment-face "#505050")
;;(set-cursor-color 'red)
;;(set-face-attribute 'region nil :background "#666")


;;Indentation
(defun indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (point-to-register 'o)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  (jump-to-register 'o))

;;(set-face-foreground 'font-lock-comment-face "green")
(set-default-font "Terminus (TTF) 12")

;;Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(add-hook 'latex-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)

;; Make things
(defun buildfile ()
  (interactive)
  (compile '"ninja"))

;;Run ./run file
(defun runfile ()
  (interactive)
  (shell-command '"./run"))

;;indent the whole file
(global-set-key "\C-x\\" 'indent-buffer)

(require 'cedet)
(require 'eieio)
(require 'eieio-speedbar)
(require 'eieio-opt)
(require 'eieio-base)
(require 'ede/source)
(require 'ede/base)
(require 'ede/auto)
(require 'ede/proj)
(require 'ede/proj-archive)
(require 'ede/proj-aux)
(require 'ede/proj-comp)
(require 'ede/proj-elisp)
(require 'ede/proj-info)
(require 'ede/proj-misc)
(require 'ede/proj-obj)
(require 'ede/proj-prog)
(require 'ede/proj-scheme)
(require 'ede/proj-shared)

;;ORG MODE
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;Arduino
(require 'cl)
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
(add-to-list 'auto-mode-alist '("\.ino$" . arduino-mode))
                                        ;CEDET Things
;;(setq package-enable-at-startup nil)
;;(package-initialize)
;;(semantic-mode 1)

;; Semantic
;;(global-semantic-idle-scheduler-mode)
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(global-semantic-idle-completions-mode)
;;(global-semantic-decoration-mode)
;;(global-semantic-highlight-func-mode)
;;(global-semantic-show-unmatched-syntax-mode)
;;Fullscreen Windows
;;(w32-send-sys-command 61488)
;;Fullscreen Ubuntu
;;(toggle-frame-fullscreen)
;;Escape fullscreen
;;(global-set-key [f11] 'toggle-frame-fullscreen)

;;;END OF FILE
;;(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (org use-package flycheck-color-mode-line company-irony auto-complete))))
;;(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;;)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("565aa482e486e2bdb9c3cf5bfb14d1a07c4a42cfc0dc9d6a14069e53b6435b56" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "0846e3b976425f142137352e87dd6ac1c0a1980bb70f81bfcf4a54177f1ab495" "7666b079fc1493b74c1f0c5e6857f3cf0389696f2d9b8791c892c696ab4a9b64" "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615" "3edbdd0ad45cb8f7c2575c0ad8f6625540283c6e928713c328b0bacf4cfbb60f" "2a1b4531f353ec68f2afd51b396375ac2547c078d035f51242ba907ad8ca19da" "2af26301bded15f5f9111d3a161b6bfb3f4b93ec34ffa95e42815396da9cb560" default)))
 '(package-selected-packages
   (quote
	(klere-theme elpy smart-tabs-mode speed-type flatui-dark-theme exotica-theme dracula-theme magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
