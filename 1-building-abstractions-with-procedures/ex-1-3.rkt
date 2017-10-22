#lang sicp

(define (sum-squares a b)
  (+ (* a a)
     (* b b)))

(define (sum-squares-two-largest x y z)
  (cond ((and (< x y) (< x z)) (sum-squares y z))
        ((and (< y x) (< y z)) (sum-squares x z))
        (else (sum-squares x y))))

(= (sum-squares-two-largest 3 4 5) (+ 16 25))
(= (sum-squares-two-largest 5 3 4) (+ 16 25))
(= (sum-squares-two-largest 7 9 2) (+ 49 81))
