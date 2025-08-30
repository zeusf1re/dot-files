
;; Настройка репозиториев пакетов
(require 'package)
(require 'use-package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Запускать сервер при старте Emacs
(require 'server)
(unless (server-running-p)
  (server-start))

;; Включить автосохранение всех буферов
(setq auto-save-default t)

(setq comp-deferred-compilation t)  ; Отложенная компиляция

(setq inhibit-startup-screen t)  ; Не показывать стартовый экран
(setq initial-scratch-message "")  ; Пустой scratch-буфер

;; Сохранять и восстанавливать открытые буферы
(use-package desktop
  :ensure nil
  :config
  (desktop-save-mode 1)
  (setq desktop-restore-frames t))  ; Восстанавливать и расположение окон

(setq-default indent-tabs-mode t)  ; Использовать табы вместо пробелов
(setq-default tab-width 4)         ; Размер таба = 4 пробела
(setq c-basic-offset 4)           ; Для C/C++/Java и др.

; --------------------------THEMES-------------------------------  

;; Установка Catppuccin
(use-package catppuccin-theme
  :ensure t
  :config
   ) ;; Автоматически загружает тему

;; Добавляем папку с темой в путь поиска
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Загружаем и активируем тему
(load-theme 'kanagawa-wave t)  ;; 'kanagawa' — имя темы (может быть 'kanagawa-wave' или 'kanagawa-dragon')

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-current-absolute t)
 '(package-selected-packages
   '(avy company dap-mode dashboard flycheck helm-ag helm-lsp
		 helm-projectile helm-xref hydra lsp-mode lsp-treemacs lsp-ui
		 projectile which-key yasnippet)))

;; Через use-package (если используете)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Display battery for when in full screen mode
(display-battery-mode t)

;; Keybindings
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f3>") 'org-export-dispatch)
(global-set-key (kbd "<f6>") 'eshell) 
(global-set-key (kbd "<f7>") 'ranger) 
(global-set-key (kbd "<f8>") 'magit) 

;; Misc stuff
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "HOME" "/home/user/")



(set-face-attribute 'default nil 
  :font "FiraCode NerdFont"  ; Имя шрифта (проверьте через `fc-list`)
  :height 120)       ; Высота (10pt = 100, 12pt = 120)

;; Для терминальной версии (emacs -nw)
;---

					;-------------------------Dashboard-------------------------------
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Добро пожаловать в Emacs!")  ; Заголовок
  (setq dashboard-startup-banner 'official)  ; Логотип Emacs (или путь к своему изображению)
  (setq dashboard-center-content t)          ; Центрировать содержимое
  (setq dashboard-items '((recents  . 5)    ; Показать 5 последних файлов
                        (bookmarks . 5)    ; 5 закладок
                        (projects . 3))))  ; 3 проекта
 (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))) 



					;-------------------------Evil-------------------------------
(use-package evil
  :ensure t)

(evil-mode 1)

					; -----------------------------HELM-----------------------------------

(require 'helm)

    (setq helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t)
    (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
    (global-set-key (kbd "C-x C-b") 'helm-buffers-list) ;; List buffers ( Emacs way )
    (define-key evil-ex-map "b" 'helm-buffers-list) ;; List buffers ( Vim way )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
    (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste


(evil-define-key 'normal 'global (kbd "/") nil)  ;; Отключаем стандартный поиск
(evil-define-key 'normal 'global (kbd "/") 'helm-occur)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'helm-ag)

					; --------------------------WHICHKEY-------------------------------
(use-package which-key
  :config
  (setq whick-key-idle-delay 0.0)
  (which-key-mode)
  (which-key-setup-minibuffer)
  :ensure t)

;					--------------------------VTERM--------------------------
(use-package vterm
  :ensure t
  :commands vterm
  :config
  (setq vterm-max-scrollback nil))  ;; Увеличиваем буфер истории

(global-set-key (kbd "C-c t") 'vterm)

(with-eval-after-load 'vterm
  (evil-define-key 'normal vterm-mode-map (kbd "p") 'vterm-yank)
  (evil-define-key 'normal vterm-mode-map (kbd "P") 'vterm-yank)
  (evil-define-key 'normal vterm-mode-map (kbd "N") 'vterm-send-C-c)
  (evil-define-key 'normal vterm-mode-map (kbd "n") 'vterm-send-C-c)

  (define-key vterm-mode-map (kbd "C-v") 'vterm-yank)
  (define-key vterm-mode-map (kbd "N") 'vterm-send-C-c))

  ;; Бинд на K в Normal и Insert режиме Evil


; ---------------------------ORG MODE--------------------------


(use-package org
  :ensure t)

(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))
  
(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default


(use-package evil-org
  :ensure t
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(navigation insert textobjects additional calendar))))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(setq org-agenda-custom-commands
   '(("h" "Daily habits"
      ((agenda ""))
      ((org-agenda-show-log t)
       (org-agenda-ndays 7)
       (org-agenda-log-mode-items '(state))
       (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))




; ---------------------------TREEMACS--------------------------
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-follow-mode t)  ;; Авто-переход к текущему файлу
  (treemacs-filewatch-mode t)  ;; Следить за изменениями файлов
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)  ;; Переключиться в Treemacs
        ("C-x t t"   . treemacs)  ;; Открыть/закрыть Treemacs
        ("C-x t B"   . treemacs-bookmark)  ;; Добавить закладку
        ("C-x t C-t" . treemacs-find-file)))  ;; Найти файл через Treemacs

(use-package treemacs-all-the-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-load-theme "all-the-icons"))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile)
  :bind (:map projectile-command-map
              ("p" . treemacs-projectile)))  ;; Открыть проект в Treemacs


					; ---------------------------------PROJECTILE--------------------------------------
;; Projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-enable-caching t)  ; Кеширование для скорости
  (setq projectile-project-root-files-bottom-up '(".git" "CMakeLists.txt")))

(use-package helm-projectile
  :ensure t
  :after (helm projectile)
  :config
  (helm-projectile-on))

;; Поиск по проекту через / (с предпросмотром)
(defun my/helm-ag-projectile ()
  (interactive)
  (if (projectile-project-p)
      (let ((default-directory (projectile-project-root)))
        (helm-ag))
    (helm-ag)))

(use-package helm-projectile
  :ensure t
  :config
  (setq helm-projectile-ag-fuzzy t)
  ;; Игнорировать backup-файлы и бинарники
  (setq helm-ag-ignore-patterns '("*~" "\\#*\\#" "*.o" "*.a" "*/build/*"))
  ;; Привязка для Evil-mode
  (evil-define-key 'normal 'global (kbd "/") 'helm-projectile-ag))

  ;; Привязка к / для поиска по проекту



					; ---------------------------------LSP SERVER--------------------------------------

;; Обновлённый список пакетов (без company-lsp)
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode
    lsp-ui))  ;; Убрали company-lsp

;; Установка пакетов
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; Настройка Helm
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;; Основные настройки
(which-key-mode)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.5
      lsp-log-io nil)

;; Настройка LSP для C/C++
(use-package lsp-mode
  :ensure t
  :hook ((c-mode c++-mode) . lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
;; Настройка clangd для проекта
(setq lsp-clients-clangd-args
      '("--background-index"
        "--clang-tidy"
        "--completion-style=detailed"
        "--header-insertion=never"
        "--pch-storage=memory"
        "--query-driver=/usr/bin/clang++")))  ;; Путь к вашему компилятору

;; Автоформатирование при сохранении
(add-hook 'c++-mode-hook
          (lambda ()
            (setq clang-format-executable "/usr/bin/clang-format")  ; Путь к clang-format
            (add-hook 'before-save-hook 'clang-format-buffer nil t)))

;; Настройка автодополнения через company-capf (встроено в Emacs)
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-backends '(company-capf)))  ;; Используем встроенную интеграцию

;; Дополнительные пакеты LSP
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable nil))

;; Настройка DAP и других модулей
(with-eval-after-load 'lsp-mode
  (require 'dap-cpptools)
  (yas-global-mode)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; Автоматические парные скобки
(electric-pair-mode 1)
;; Какие символы считать "парами"
(setq electric-pair-pairs '(
    (?\" . ?\")  ; Кавычки "
    (?\( . ?\))   ; Круглые скобки
    (?\[ . ?\])   ; Квадратные скобки
    (?\{ . ?\})   ; Фигурные скобки
))

;; Отключить для некоторых режимов (например, для минибуфера)
(add-hook 'minibuffer-inactive-mode-hook (lambda () (electric-pair-local-mode -1)))


(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'cmake-mode-hook #'lsp-deferred)

