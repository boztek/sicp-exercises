#lang sicp

;; the first compound expression in the function body evaluates to either + or - operators
;; thus if b is +'ve add a to b, otherwise subtract b from a (i.e. add (-b) to a)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a
                    b))

