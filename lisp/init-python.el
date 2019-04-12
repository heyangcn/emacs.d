;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq python-shell-interpreter "python3.6")
(setq elpy-rpc-python-command "python3.6")

;; (setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
;; (setq flycheck-python-pycompile-executable "python3")

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(elpy-enable)
;; (when (maybe-require-package 'elpy-mode)
;;   (after-load 'python
;;     (add-hook 'python-mode-hook 'elpy-mode)))
(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (after-load 'python
        (push 'company-anaconda company-backends))))
  )


(provide 'init-python)
;;; init-python.el ends here
