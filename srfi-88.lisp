;;;; srfi-88.lisp

(cl:in-package :srfi-88.internal)
;; (in-readtable :srfi-88)

(def-suite srfi-88)

(in-suite srfi-88)

(declaim (inline keyword?))
(defun keyword? (obj)
  (cl:keywordp obj))

(defun keyword->string (k)
  (cl:string k))

(defun string->keyword (x)
  (assert (stringp x))
  (values (cl:intern x :keyword)))

(macrolet ((tst (&body clauses)
             (do ((*gensym-counter* 0)
                  (c clauses (cdddr c))
                  (ans '()
                       (cons `(test ,(gensym)
                                (is (equal ,(first c)
                                           ,(third c))))
                             ans)))
                 ((null c)
                  `(progn ,@ans)))))
  (tst
   (keyword? ':foo)                    ==>  T
   (keyword? :foo)                     ==>  T
   (keyword? 'foo)                     ==>  nil
   (keyword? '\:)                      ==>  nil
   (keyword? :||)                      ==>  T
   (keyword? (car '(:a :b)))           ==>  T
   (keyword? "bar")                    ==>  nil
   (keyword->string :foo)              ==>  "FOO"
   (keyword->string :||)               ==>  ""
   (keyword->string
    (string->keyword "a b c"))         ==>  "a b c"
   (string->keyword "foo")             ==>  :|foo|
   (string->keyword "")                ==>  (values :||)))

;;; eof
