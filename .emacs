;; START custom -----------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(custom-enabled-themes '(ef-duo-dark))
 '(custom-safe-themes
   '("b41d0a9413fb0034cea34eb8c9f89f6e243bdd76bccecf8292eb1fefa42eaf0a" "541282f66e5cc83918994002667d2268f0a563205117860e71b7cb823c1a11e9" "3d9938bbef24ecee9f2632cb25339bf2312d062b398f0dfb99b918f8f11e11b1" "cee5c56dc8b95b345bfe1c88d82d48f89e0f23008b0c2154ef452b2ce348da37" "90185f1d8362727f2aeac7a3d67d3aec789f55c10bb47dada4eefb2e14aa5d01" "aff0396925324838889f011fd3f5a0b91652b88f5fd0611f7b10021cc76f9e09" "ac893acecb0f1cf2b6ccea5c70ea97516c13c2b80c07f3292c21d6eb0cb45239" "d609d9aaf89d935677b04d34e4449ba3f8bbfdcaaeeaab3d21ee035f43321ff1" "d6b369a3f09f34cdbaed93eeefcc6a0e05e135d187252e01b0031559b1671e97" "ea4dd126d72d30805c083421a50544e235176d9698c8c541b824b60912275ba1" "1ad12cda71588cc82e74f1cabeed99705c6a60d23ee1bb355c293ba9c000d4ac" "cd5f8f91cc2560c017cc9ec24a9ab637451e36afd22e00a03e08d7b1b87c29ca" "a3a71b922fb6cbf9283884ac8a9109935e04550bcc5d2a05414a58c52a8ffc47" "ae20535e46a88faea5d65775ca5510c7385cbf334dfa7dde93c0cd22ed663ba0" "00d7122017db83578ef6fba39c131efdcb59910f0fac0defbe726da8072a0729" "36c5acdaf85dda0dad1dd3ad643aacd478fb967960ee1f83981d160c52b3c8ac" "0a2168af143fb09b67e4ea2a7cef857e8a7dad0ba3726b500c6a579775129635" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "7b602fe4a324dc18877dde647eb6f2ff9352566ce16d0b888bfcb870d0abfd70" "d41229b2ff1e9929d0ea3b4fde9ed4c1e0775993df9d998a3cdf37f2358d386b" "712dda0818312c175a60d94ba676b404fc815f8c7e6c080c9b4061596c60a1db" "937401a2e532f2c8c881b6b3f20d9d4b6b9405bccf72ea6289c9d3f4507eb1ab" "2e7dc2838b7941ab9cabaa3b6793286e5134f583c04bde2fba2f4e20f2617cf7" "a75aff58f0d5bbf230e5d1a02169ac2fbf45c930f816f3a21563304d5140d245" "fbf73690320aa26f8daffdd1210ef234ed1b0c59f3d001f342b9c0bbf49f531c" "faf642d1511fb0cb9b8634b2070a097656bdb5d88522657370eeeb11baea4a1c" "3d21eda97ce916fda054b0d2e1381e3fb3118cee79749e4b282b55fc461fb13e" "a0f44dd00ce24985ee69df0579a22a0903881fd6d7b12c9f3a19e3d638a77590" default))
 '(delete-selection-mode nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(nord-theme catppuccin-theme ef-themes modus-themes treemacs-all-the-icons treemacs-nerd-icons treemacs-tab-bar counsel-projectile treemacs-projectile lsp-tailwindcss lsp-ui vlf lsp-mode yasnippet lsp-treemacs lsp-ivy dashboard counsel projectile hydra flycheck company avy which-key helm-xref dap-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; END custom

;; configure package repositories and files
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(lsp-mode
				  yasnippet
				  lsp-treemacs
				  lsp-ivy
				  dashboard
				  counsel
				  projectile
				  hydra
				  flycheck
				  company
				  avy
				  which-key
				  helm-xref
				  dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; font
;; (set-frame-font "IBM Plex Mono 14" nil t)
(set-frame-font "Iosevka Fixed 12" nil t)
(global-display-line-numbers-mode 1)

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
(setq projectile-project-search-path '("~/work/repos"))
(setq projectile-auto-discover nil)
(setq projectile-indexing-method 'alien)
(projectile-mode +1)

;; org mode  --------------------------------------------------
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
;; for refile tasks to other files
;; use with C-c C-w file.org/parent

;; Files
(setq org-directory "~/Nextcloud/org")
(setq org-agenda-files (list "~/Nextcloud/org/")
      org-log-done 'time
      org-refile-targets '((org-agenda-files :maxlevel . 5))
      org-refile-use-outline-path 'file
)
(setq org-default-notes-file "~/Nextcloud/org/notes.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Nextcloud/org/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Nextcloud/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
; adjust scale for 
(add-hook 'org-mode-hook (lambda () (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))))

;; lsp ---------------------------------------------------------
(which-key-mode)
(company-mode)
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'sh-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)

(use-package lsp-treemacs
  :after lsp)
(use-package lsp-ivy)


(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;; LaTeX --------------------------------------------------------
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; org roam

(use-package org-roam
  :ensure t
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))

(setq org-roam-directory (file-truename "~/Nextcloud/org/org-roam"))
(setq find-file-visit-truename t)
(setq org-roam-completion-everywhere t)
(org-roam-db-autosync-mode)

