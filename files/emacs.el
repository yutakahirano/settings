(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xg" 'beginning-of-buffer)
(global-set-key "\C-xG" 'end-of-buffer)
(global-set-key "\C-x:" 'goto-line)
(global-set-key "\C-z" nil)


(setq make-backup-files nil)
(setq auto-save-default nil)

(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

;;
;;  kill-line-twice
;;
(defun kill-line-twice (&optional numlines)
  "Acts like normal kill except kills entire line if at beginning"
  (interactive "*p")
  (cond ((eobp) (signal 'end-of-buffer nil))
        ((or (bolp)
             (> numlines 1))
         (kill-line numlines))
        (t (kill-line))))
(global-set-key "\C-k" 'kill-line-twice)

;; Open the init file for ease of accessibility.
(find-file user-init-file)
(switch-to-buffer "*scratch*")

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

