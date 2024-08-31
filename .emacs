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
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("3d21eda97ce916fda054b0d2e1381e3fb3118cee79749e4b282b55fc461fb13e" "a0f44dd00ce24985ee69df0579a22a0903881fd6d7b12c9f3a19e3d638a77590" default))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(arduino-mode ample-theme spice-mode treemacs-projectile treemacs company counsel ivy projectile lsp-mode helm good-scroll dashboard auctex))
 '(preview-TeX-style-dir "/home/infertil/.emacs.d/elpa/auctex-14.0.5/latex" t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; END custom

(setq default-input-method "portuguese-prefix")
(setq inhibit-startup-screen t)

;; melpa ----------------------------------------------
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; built in --------------------------------------------------
;; (set-frame-font "IBM Plex Mono 14" nil t)
 (set-frame-font "Iosevka Aile 11" nil t)
;(global-display-line-numbers-mode 1)

;;activity-watch
;;(global-activity-watch-mode 1)

;; swiper

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

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

; adjust scale for 
(add-hook 'org-mode-hook (lambda () (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))))


;; lsp ---------------------------------------------------------
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'sh-mode-hook #'lsp)

(require 'dashboard)
(dashboard-setup-startup-hook)

;; LaTeX --------------------------------------------------------
(setq TeX-auto-save t)
(setq TeX-parse-self t)
