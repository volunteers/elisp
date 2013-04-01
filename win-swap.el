;(defun win-swap () "Swap windows using buffer-move.el" (interactive) (if (null (windmove-find-other-window 'right)) (buf-move-left) (buf-move-right)))

(defun win-swap ()
 "If you have 2 windows, it swaps them." (interactive) (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
 (t
 (let* ((w1 (first (window-list)))
	 (w2 (second (window-list)))
	 (b1 (window-buffer w1))
	 (b2 (window-buffer w2))
	 (s1 (window-start w1))
	 (s2 (window-start w2)))
 (set-window-buffer w1 b2)
 (set-window-buffer w2 b1)
 (set-window-start w1 s2)
 (set-window-start w2 s1)))))

(global-set-key (kbd "C-c o")   'win-swap)

(provide 'win-swap)
