(defun win-swap () "Swap windows using buffer-move.el" (interactive) (if (null (windmove-find-other-window 'right)) (buf-move-left) (buf-move-right)))
(global-set-key (kbd "C-c o")   'win-swap)

(provide 'win-swap)