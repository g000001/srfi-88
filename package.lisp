;;;; package.lisp

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-88"
  (:use)
  (:export keyword?
           keyword->string
           string->keyword))


(defpackage "https://github.com/g000001/srfi-88#internals"
  (:use "https://github.com/g000001/srfi-88"
        cl
        fiveam))


;;; *EOF*
