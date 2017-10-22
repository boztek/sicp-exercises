#lang sicp

;; Calculate square root using Newton's method.
;; (iterate guesses until error tollerance is bridged.
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; Method works for "normal" sized numbers.
(sqrt 2)
(sqrt 4)
(sqrt 16)
(sqrt 144)

;; ... but fails for very small numbers
(sqrt 0.0000004) ;; 0.000632455532034
; => 0.03125426238406449
(sqrt 0.000004) ;; 0.002
; => 0.03129261341049664
;; ... and extremely large numbers, sometimes looping forever.
;(sqrt 9797979797979797979797979797979799797979797979797) ;; 3.130172486937389e24
;; =>                                                     ;; loops forever?
;(sqrt 98765432123456789) ;; 314269680.566638163565319
;;; =>                    ;; loops forever?
