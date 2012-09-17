(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-width 2)
 '(text-mode-hook (quote (turn-on-auto-fill (lambda nil (auto-fill-mode 1) (flyspell-mode 1) (setq-default indent-tabs-mode 1))))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(show-paren-mode 1) 
(column-number-mode 1)
(tool-bar-mode 0)
(display-time)
(dynamic-completion-mode 1)

(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [C-end] 'end-of-buffer)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [delete]  'delete-char)

(global-set-key [f1] 'undo)
(global-set-key [f2] 'goto-line)
(global-set-key [f3] 'delete-other-windows)
(fset 'macro-kill-current-buffer
   [?\C-X ?K return])
(global-set-key [f4] 'macro-kill-current-buffer)

(global-set-key [f6]  'call-last-kbd-macro)

(global-set-key [f12]  'save-buffer)
(global-set-key [f11]  'find-file)
(global-set-key [f10]  'find-file-other-frame)
(global-set-key [f9]  'switch-to-buffer)


;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
; tabs instead of spaces in ruby
(setq ruby-indent-tabs-mode 1)
(setq ruby-indent-level 2)
; set tab width
(setq tab-width 2)
(setq default-tab-width 2)
(setq tab-interval 2)
;; narrow tabs for perl
(setq perl-indent-level 2)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 2)
        (setq python-indent 2)))

(setq latex-mode-hook                  ; do auto fill mode in text mode
      '(lambda () 
	 (flyspell-mode 1)
         ))
(setq text-mode-hook                  ; do auto fill mode in text mode
      '(lambda () 
         (auto-fill-mode 1) 
	 (flyspell-mode 1)
         (setq-default indent-tabs-mode 1)
         ))

;html
(setq html-mode-hook                  ; do auto fill mode in text mode
      '(lambda () (auto-fill-mode 0)))

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
;;; Takes a multi-line paragraph and makes it into a single line of text.

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
  (fill-paragraph nil)))

(defun unfill-region ()
  "Unfill the current region."
  (interactive) (with-unfilling 'fill-region))
(defalias 'unwrap-region 'unfill-region)

(defun unfill-individual-paragraphs ()
  "Unfill individual paragraphs in the current region."
  (interactive) (with-unfilling 'fill-individual-paragraphs))
(defalias 'unwrap-individual-paragraphs 'unfill-individual-paragraphs)

(defun with-unfilling (fn)
  (let ((fill-column 10000000)) (call-interactively fn)))

(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
