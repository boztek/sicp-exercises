#lang sicp

;; Calculate square root using Newton's method.
;; (iterate guesses until error tolerance is bridged.
(define (sqrt x)
  (sqrt-iter2 1.0 x))

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) x)))

;; This version uses a custom procedure version of the if special form.
;; The result of this is that next iterations are calculated infinitely instead
;; of stopping when guess is within tolerance, and the program never ends.
(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter2 (improve guess x) x)))

;; Non-special form version of if.
;; This will evaluate both then and else clauses every time
;; regardless of if the predicate passes or fails.
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))
