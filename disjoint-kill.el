(setq ay/disjoint-buffer '())

(defun ay/disjoint-kill ()
  "Kill multiple unrelated sections of text and put it to a
buffer so it can be yanked together as a group."
  (interactive)
  (add-to-list 'ay/disjoint-buffer
               (buffer-substring-no-properties
                (region-beginning)
                (region-end)))
  (delete-region (region-beginning)
                 (region-end)))

(defun ay/disjoint-yank ()
  "Yank the disjoint kill and past it as a block."
  (interactive
  (mapcar (lambda (arg)
            (insert arg "\n"))
          ay/disjoint-buffer)
  (setq ay/disjoint-buffer '())))
