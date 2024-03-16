;; START custom -----------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-default-style
   '((java-mode . "java")
     (awk-mode . "awk")
     (csharp-mode . "csharp")
     (other . "gnu")))
 '(custom-enabled-themes '(zeno))
 '(custom-safe-themes
   '("10fef6d73ae453f39c9f325915386d41894870b72926e8e9b0c39d030447b703" "18624b2da7749af193a4eeaa7be1dc2abe94a97a8562ba69f5ee0f06d6dd156e" default))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(subatomic-theme zeno-theme org-projectile-helm helm-org org-projectile helm-lsp helm-projectile helpful xwwp-follow-link-helm helm-aws dashboard embark activity-watch-mode flycheck lsp-ui company rustic lsp-mode rust-mode hledger-mode beans ledger-mode unicode-progress-reporter ess wakatime-mode org-roam magit counsel projectile ivy helm)))
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
(set-frame-font "IBM Plex Mono 14" nil t)
;(global-display-line-numbers-mode 1)

;; wakatime --------------------------------------------------
;;(load-file "~/.emacs.d/fernando/keys.el")
;;(setq wakatime-cli-path
;;      "~/.wakatime/wakatime-cli")

;;activity-watch
(global-activity-watch-mode 1)

;; ivy -------------------------------------------------------
;;(require 'counsel)
;;(ivy-mode 0)
;;(setq ivy-use-virtual-buffers t)
;;(setq ivy-count-format "(%d/%d) ")
;;(global-set-key (kbd "C-s") 'swiper-isearch)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "M-y") 'counsel-yank-pop)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "<f2> j") 'counsel-set-variable)
;;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;;(global-set-key (kbd "C-c v") 'ivy-push-view)
;;(global-set-key (kbd "C-c V") 'ivy-pop-view)

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

(require 'helm)
(helm-mode 1)
