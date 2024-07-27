;; START custom -----------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-amsmath-label "eq:")
 '(TeX-auto-save t t)
 '(TeX-parse-self t t)
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open")))
 '(c-basic-offset 4)
 '(c-default-style
   '((java-mode . "java")
     (awk-mode . "awk")
     (csharp-mode . "csharp")
     (other . "gnu")))
 '(custom-enabled-themes '(leuven-dark))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(treemacs-projectile treemacs company counsel ivy projectile lsp-mode helm good-scroll dashboard auctex))
 '(preview-TeX-style-dir "/home/infertil/.emacs.d/elpa/auctex-14.0.5/latex" t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; END custom

;; melpa ----------------------------------------------
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; built in --------------------------------------------------
;; (set-frame-font "IBM Plex Mono 14" nil t)
;(global-display-line-numbers-mode 1)

;;activity-watch
;;(global-activity-watch-mode 1)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; projectile ------------------------------------------------
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/data/sdata/repos"))
(setq projectile-auto-discover nil)
(setq projectile-indexing-method 'alien)
(projectile-mode +1)

;; org mode  --------------------------------------------------
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
;; for refile tasks to other files
;; use with C-c C-w file.org/parent
(setq org-agenda-files (list "~/Documents/org/")
      org-log-done 'time
      org-refile-targets '((org-agenda-files :maxlevel . 5))
      org-refile-use-outline-path 'file
)
(setq org-default-notes-file "~/Documents/org/notes.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Documents/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

;; lsp ---------------------------------------------------------
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'sh-mode-hook #'lsp)

(require 'dashboard)
(dashboard-setup-startup-hook)


;; LaTeX --------------------------------------------------------
(setq TeX-auto-save t)
(setq TeX-parse-self t)
