#lang sicp
;; Test if this interpreter is using applicative-order or normal-order evaluation.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
