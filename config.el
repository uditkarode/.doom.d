;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; ---------- CUSTOM STUFF ------------ ;;
; support keycast
(after! keycast
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (add-hook 'pre-command-hook 'keycast--update t)
      (remove-hook 'pre-command-hook 'keycast-mode-line-update)))
  (setq keycast-substitute-alist '((ivy-done nil nil)
                                   (self-insert-command nil nil))))
(add-to-list 'global-mode-string '("" mode-line-keycast))
(keycast-mode)

;; open treemacs with keyboard
(defun +private/treemacs-back-and-forth ()
  (interactive)
  (if (treemacs-is-treemacs-window-selected?)
      (aw-flip-window)
    (treemacs-select-window)))

(map! :after treemacs
      :leader
      :g "-" #'+private/treemacs-back-and-forth)

;; some handy binds
(map!
 :g (kbd "<C-right>") 'centaur-tabs-forward
 :g (kbd "<C-left>") 'centaur-tabs-backward
 :g "M-w" 'forward-word
 :g "M-s" 'kill-ring-save
 :g "C-t" 'treemacs
 )

; use M-DEL as keyboard-escape-quit
(define-key input-decode-map (kbd "M-<delete>") [?\C-g])

; use C-k as C-p (P is too hard to reach)
(define-key input-decode-map (kbd "C-k") [?\C-p])

; use C-j as C-n (old habits die hard)
(define-key input-decode-map (kbd "C-j") [?\C-n])

; setup projects directory
(projectile-discover-projects-in-directory "/home/udit/CodingProjects")

;; use rjsx mode on .tsx files
(add-to-list 'auto-mode-alist '("components\\/.*\\.tsx\\'" . rjsx-mode))

;; buffer scroll
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-k" "\C-u1\M-v")

;; ---------- CUSTOM STUFF ------------ ;;

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Udit Karode"
      user-mail-address "udit.karode@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka SS04 Semibold" :size 20)
       doom-variable-pitch-font (font-spec :family "SF UI Text" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
