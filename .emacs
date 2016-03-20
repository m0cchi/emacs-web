(prefer-coding-system 'utf-8)
(require 'package)
(require 'cl)
(require 'server)

;; env
(defconst +PORT+ (string-to-number (getenv "HTTP_PORT")))
(defconst +HOST+ (getenv "HTTP_IP"))

(defvar *dependencies* '(
                         elnode
                         ))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(package-refresh-contents)

(dolist (dependency *dependencies*)
  (unless (package-installed-p dependency)
    (package-install dependency))
    (require dependency))

(server-start)
(require 'elnode)
(setq elnode-init-port nil)
(setq elnode--do-error-logging nil)
(setq elnode-log-files-directory (concat (getenv "WORKING_DIR") "/log"))
(message (concat "elnode logs :" elnode-log-files-directory "\n"))

;; users code
(let ((init-el (concat (getenv "APP_DIR") "/init.el")))
  (if (file-exists-p init-el)
      (progn
        (message "load init.el")
        (load-file init-el))
    (progn
      (message "not exists init.el\n")
      (kill-emacs))))
