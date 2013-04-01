;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; add the following two lines to .emacs ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;-----------------------------------------
;(add-to-list 'load-path "~/elisp")
;(load "emacs.el")
;-----------------------------------------




(load "~/elisp/autoloads" 'install)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;(add-to-list 'load-path "~/elisp")
(require 'install)
;(require 'package)
;(package-initialize)

(require 'naquadah-theme)
(set-face-attribute 'default nil :height 140) ;100 is 10pt
(tool-bar-mode -1)			    ;remove toolbar
(menu-bar-mode -1)			    ;remove menu bar
(scroll-bar-mode -1)			    ;disable scroll bar
;(global-linum-mode t)			    ;display line number
;(setq column-number-mode t)		    ;display column number
(setq make-backup-files nil)                ;stop creating those backup~ files 
(setq auto-save-default nil)                ;stop creating those #auto-save# files
(show-paren-mode 1)			    ;show pair of () {}.., can use C-M-n, p
(global-auto-revert-mode t)		    ;auto refresh buffer when changed in disk
(mouse-avoidance-mode 'jump)		    ;?? move mouse when cursor close
;(desktop-save-mode 1)			    ;save current files before quit for restart use

(global-set-key [(control x) (k)] 'kill-this-buffer);; kill buffer without confirmatioin


(global-set-key "\M-`" 'other-window)	;switch cursor to other window
;(global-set-key [C-tab] 'other-window)	; 'previous-buffer, 'next-buffer

(require 'wcy-swbuff)			;C-TAB, C-`, switch current window content
(global-set-key [(control tab)] 'wcy-switch-buffer-forward)
(global-set-key [?\C-`] 'wcy-switch-buffer-backward)


(when (fboundp 'winner-mode)		    ;C-c <- back to former window layout
      (winner-mode 1))

(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2) ((control) . nil))) ;mouse scroll slower
(setq mouse-wheel-progressive-speed nil)

(require 'ido) 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-file-extensions-order '(".c" ".txt" ".h" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
(autoload 'idomenu "idomenu" nil t)
(add-hook 'c-mode-hook #'imenu-add-menubar-index)      ; c


(require 'smex)				;M-x diplay recent commands
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;This is your old M-x.


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode) ;C-u C-c SPC to search inside word

(add-to-list 'load-path "~/elisp/expand-region.el-master")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(pending-delete-mode t)			;highlight and delete/replace


(require 'move-text-internal)		;move one line or a block up and down
(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)

(require 'ioccur)

(require 'browse-kill-ring)		;M-y to browse Yank
(browse-kill-ring-default-keybindings)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; Use Ibuffer for Buffer List

(require 'buffer-move)			;move the buffer left
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(require 'win-swap)			;C-c o, swap left-right windows

(defun backward-delete-word (arg)	;in minibuffer, M-backspce will not copy
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))
(define-key minibuffer-local-map [M-backspace] 'backward-delete-word)

;; multi-term config
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) ;make M-x shell works well
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)
(setq multi-term-program "/bin/bash")
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste))) ;paste for term


(require 'scroll-other-window)		;C-N,P       C-{,}

(require 'iy-go-to-char)		;not useful if have ace-jump-mode
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

(require 'key-chord)                  ;;not very useful
(key-chord-mode 1)
(key-chord-define-global "vv" 'iy-go-to-char)
(key-chord-define-global "bb" 'iy-go-to-char-backward)
;(key-chord-define-global "gg" 'goto-line)
;(key-chord-define-global ";;" "\C-e")
;(key-chord-define-global "pp" "\M-v")
;(key-chord-define-global "nn" "\C-v")

;; C++
(require 'cc-mode)	      ;
(c-set-offset 'inline-open 0)		
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
(setq c-basic-offset 4)
;(c-set-style "stroustrup")



(load "myC.el")

(require 'autopair)		     ;not working because of above myC.el
(autopair-global-mode) ;; enable autopair in all buffers

(defun my-make-CR-do-indent ()
            (define-key c-mode-base-map "\C-m" 'c-context-line-break))
          (add-hook 'c-initialization-hook 'my-make-CR-do-indent)


(require 'switch-window)		;overwrite C-x o, show windows number 1,2,3,4...


(require 'uniquify)			;filename not <2><3>etc, not working now...
(setq uniquify-buffer-name-style 'reverse)
;(setq uniquify-buffer-name-style 'forward)


;; show filename and entire directory 
(setq frame-title-format		;show directory and filename on frame top
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(defun show-file-name ()		;show directory and filename in minibuffer
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))
(global-set-key [C-f1] 'show-file-name) ; 


;; C-;  comment/uncomment one line or region
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-;") 'comment-or-uncomment-region-or-line)

;; group ibuffer
(setq ibuffer-saved-filter-groups
      '(("home"
	 ("emacs-config" (or (filename . ".emacs.d")
			     (filename . "emacs-config")))
         ("martinowen.net" (filename . "martinowen.net"))
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
         ("code" (filename . "code"))
	 ("Web Dev" (or (mode . html-mode)
			(mode . css-mode)))
	 ("Subversion" (name . "\*svn"))
	 ("Magit" (name . "\*magit"))
	 ("ERC" (mode . erc-mode))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook 
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "code")))

;; C-k kill line and region
(defun kill-line-or-region (beg end) 
 "kill region if active only or kill line normally"
  (interactive "r")
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-line)))
  (global-set-key (kbd "C-k") 'kill-line-or-region)

;; C- left/right/up/down arrow, move cursor to different window
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
    (global-set-key (kbd "<C-left>")  'windmove-left)
    (global-set-key (kbd "<C-right>") 'windmove-right)
    (global-set-key (kbd "<C-up>")    'windmove-up)
    (global-set-key (kbd "<C-down>")  'windmove-down)

;; M-j, keep this to join multiple lines to one line
(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))


;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)

;; C-RET, C-S_RET, add new line below/above, even cursor in the middle of current line
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; only display line number when use Goto Line
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))