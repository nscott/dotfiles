(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(inhibit-startup-screen t)
 '(markdown-command "/usr/local/bin/pandoc -f markdown_github -t html5")
 '(package-selected-packages
   (quote
    (markdown-mode org-plus-contrib unicode-fonts web-mode cider coffee-mode php-mode clojure-mode flx-ido flx projectile)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(font-lock-builtin-face ((t (:foreground "#e090d7" :family "Menlo-12")))))

; (set-face-attribute 'default nil :height 90)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))
(mapc
	(lambda (package)
		(progn
			(unless (package-installed-p package)
					(package-install package))
			(require package)))
	'(projectile flx flx-ido
	  clojure-mode php-mode coffee-mode
	  cider web-mode unicode-fonts markdown-mode yaml-mode json-mode json-reformat))

; (load-theme 'solarized-dark t)
(setq show-trailing-whitespace 1)
(setq-default show-trailing-whitespace 1)

(setq linum-format "%4d \u2502")
(linum-mode 1)
(global-linum-mode t)

(projectile-global-mode)
(setq proectile-enable-caching t)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(require 'web-mode)

;; For PHP to use only tabs
(setq php-mode-force-pear t)
(define-key php-mode-map (kbd "TAB") 'self-insert-command)

; set up file format defaults
(setq auto-mode-alist
      (append '(("\\.h\\'" . c-mode)
                ("\\.c\\'" . c-mode)
                ("\\.rules\\'" . conf-unix-mode)
                ("\\.hh\\'" . c++-mode)
                ("\\.hx\\'" . c++-mode)
                ("\\.hpp\\'" . c++-mode)
                ("\\.cc\\'" . c++-mode)
                ("\\.cpp\\'" . c++-mode)
                ("\\.[CH]\\'" . c++-mode)
                ("\\.java\\'" . java-mode)
                (".*[mM]akefile.*" . makefile-mode)
                ("\\.html\\'" . web-mode)
                ("\\.HTML\\'" . web-mode)
                ("\\.htm\\'" . web-mode)
                ("\\.HTM\\'" . web-mode)
                ("\\.html?\\'" . web-mode)
                ("\\.phtml\\'" . web-mode)
                ("\\.tpl\\.php\\'" . web-mode)
                ("\\.[agj]sp\\'" . web-mode)
                ("\\.as[cp]x\\'" . web-mode)
                ("\\.erb\\'" . web-mode)
                ("\\.mustache\\'" . web-mode)
                ("\\.dhtml\\'" . web-mode)
                ("\\.php\\'" . php-mode)
                ("\.xemacs" . emacs-lisp-mode)
                ("\.emacs"  . emacs-lisp-mode)
                ("\\.el\\'" . emacs-lisp-mode)
                ("\\.p[lm]\\'" . perl-mode)
                ("\\.lua\\'" . lua-mode)
                ("\\.sh\\'" . sh-mode)
                ("\.bash_profile" . sh-mode)
                ("\.bashrc" . sh-mode)
                ("\.cshrc" . sh-mode)
                ("\.tcshrc" . sh-mode)
                ("\\.exp\\'" . tcl-mode)
                ("\\.sql\\'" . sql-mode)
                ("\\.txt\\'" . text-mode)
                ("\\.text\\'" . text-mode)
                ("\\.php\\'" . php-mode)
                ("\\.py\\'" . python-mode)
                ("\\.ps\\'" . postscript-mode)
                ("\\.[tT]e[xX]\\'" . tex-mode)
                ("\\.ltx\\'" . latex-mode)
                ("\\.bib\\'" . bibtex-mode)
                ("\\.[sS]\\'" . asm-mode)
                ("\\.asm\\'" . asm-mode)
                ("\\.scm\\'" . scheme-mode)
                ("\\.awk\\'" . awk-mode)
                ("\\.f\\(or\\)?\\'" . fortran-mode)
                ("\\.f\\(?:or\\)?\\'" . fortran-mode)
                ("\\.[fF]90\\'" . f90-mode)
                ("\\.ad[abs]\\'" . ada-mode)
                ("\\.lisp\\'" . lisp-mode)
                ("\\.cl\\'" . lisp-mode)
                ("\\.cm\\'" . lisp-mode)
                ("\\.clm\\'" . lisp-mode)
                ("\\.p\\(as\\)?\\'" . pascal-mode)
                ("\\.p\\(?:as\\)?\\'" . pascal-mode)
                ("\\.lex\\'" . c-mode)
                ("\\.yacc\\'" . c-mode)
                ("\\.yy\\'" . c-mode)
                ("\\.y\\'" . c-mode)
                ("\\.bas\\'" . basic-mode)
                ("\\.vbs\\'" . basic-mode)
                ("\\.m\\'" . matlab-mode)
                ("\\.[Jj][Pp][Ee]?[Gg]\\'" . image-mode)
                ("\\.[Pp][Nn][Gg]\\'" . image-mode)
                ("\\.[Gg][Ii][Ff]\\'" . image-mode)
                ("\\.[Tt][Ii][Ff][Ff]?\\'" . image-mode)
                ("\\.coffee\\'" . coffee-mode)
                ("\\.coffee$" . coffee-mode)
                ("Cakefile" . coffee-mode)
                ("\\.md\\'" . markdown-mode)
                ) auto-mode-alist))

; tab jawns
(setq default-tab-width 1)
(setq tab-width 1)
(setq c-basic-indent 1)

(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(setq column-number-mode t)
(setq line-number-mode t)
;(global-set-key (kbd "TAB") 'self-insert-command)

(setq c-backspace-function 'backward-delete-char)

(add-to-list 'default-frame-alist '(height . 30))
(add-to-list 'default-frame-alist '(width .135))
(setq default-frame-alist
	  '((menu-bar-lines . 1)
		(left-fringe)
		(right-fringe)
		(tool-bar-lines . 0)
		(width . 100)
		(height . 52)
		))
; disallow the auto backup files
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key [(hyper h)] 'help-command)
(global-set-key "\C-xg" 'goto-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key (kbd "C-x C-v") 'clipboard-yank)
; (global-set-key [backtab] '(indent-rigidly -4))

; regular directory to load from
(let ((default-directory "~/.emacs.d/"))
      (normal-top-level-add-subdirs-to-load-path))

; replace yes and no with y and n
(fset 'yes-or-no-p 'y-or-n-p)

;;==== jump to matching parenthesis :: [%]
;; (global-set-key "\C-%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; == Java mode
(add-hook 'java-mode-hook
          (lambda()
            (setq c-basic-offset 1
                  tab-width 1
                  indent-tabs-mode nil)))
