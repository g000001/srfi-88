;;;; srfi-88.asd

(cl:in-package :asdf)

(defsystem :srfi-88
  :serial t
  :depends-on (:fiveam
               :named-readtables)
  :components ((:file "package")
               (:file "srfi-88")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-88))))
  (load-system :srfi-88)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-88.internal :srfi-88))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
