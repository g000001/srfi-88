;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-88
  (:use)
  (:export :keyword?
           :keyword->string
           :string->keyword))

(defpackage :srfi-88.internal
  (:use :srfi-88 :cl :fiveam))
