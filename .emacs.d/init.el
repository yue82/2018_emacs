(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-compatibility-setup)

(add-to-list 'load-path "~/.emacs.d/elisp/")

;; menu-bar off on terminal
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; ファイル自動更新
(global-auto-revert-mode 1)

;; yes or noをy or nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; バックアップを残さない
(setq make-backup-files nil)

;; テーマ
(load-theme 'wombat t)

;; モードラインに列番号表示
(column-number-mode t)

;;行数表示
(global-linum-mode t)
(setq linum-format "%5d ")

;; 括弧ハイライト
(show-paren-mode t)

;; ソフトタブ
(setq-default indent-tabs-mode nil)

;; C-kで行全体を削除
(setq kill-whole-line t)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t)

;; anzu mode
(global-anzu-mode +1)
(setq anzu-mode-lighter "")
(setq anzu-deactivate-region t)
(setq anzu-search-threshold 1000)
(setq anzu-minimum-input-length 2)
(setq anzu--use-migemo-p nil)
(set-face-foreground 'anzu-mode-line nil)
(global-set-key (kbd "C-c r") 'anzu-query-replace)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;;指定行ジャンプ
(define-key global-map (kbd "M-n") 'goto-line)

;;全置換
(define-key global-map (kbd "C-c R") 'replace-string)
