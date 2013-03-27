(defun scroll-other-window-up-line ()
  "Scroll the other window one line up."
  (interactive)
  (scroll-other-window -1))
(defun scroll-other-window-down-line ()
  "Scroll the other window one line down."
  (interactive)
  (scroll-other-window 1))
(global-set-key (kbd "C-S-p") 'scroll-other-window-up-line)
(global-set-key (kbd "C-S-n") 'scroll-other-window-down-line)

(provide 'scroll-other-window)