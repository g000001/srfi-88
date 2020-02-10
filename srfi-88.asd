;;;; srfi-88.asd

(cl:in-package :asdf)


(defsystem :srfi-88
  :version "20200211"
  :description "SRFI 88 for CL: Keyword objects"
  :long-description "SRFI 88 for CL: Keyword objects
https://srfi.schemers.org/srfi-88"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:fiveam)
  :components ((:file "package")
               (:file "srfi-88")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-88))))
  (let ((name "https://github.com/g000001/srfi-88")
        (nickname :srfi-88))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-88))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-88#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-88)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*
