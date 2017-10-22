#lang sicp

;; Calculate square root using Newton's method.
;; (iterate guesses until error tolerance is bridged.
(define (sqrt x)
  (sqrt-iter 1.0 x x))

(define (sqrt-iter guess prev-guess x)
  (if (should-stop-guessing? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

;; Return true if change in guesses is less than a millionth of the guess.
(define (should-stop-guessing? guess prev-guess)
  (< (abs (- guess prev-guess))
     (/ prev-guess 1000000.0)))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; Method works even better for "normal" sized numbers.
(sqrt 2)
(sqrt 4)
(sqrt 16)
(sqrt 144)
;; ... and for very small numbers
(sqrt 0.0000004) ;; 0.000632455532034
; =>                0.0006324555320336759
(sqrt 0.000004) ;; 0.002
; =>               0.0020000000000000235
;; ... and works well for quite large numbers
(sqrt 98765432123456789) ;; 314269680.566638163565319
; =>                        314269680.5666381
;; ... but still pretty wrong for extremely large numbers in absolute terms.
(sqrt 9797979797979797979797979797979799797979797979797) ;; 3.130172486937389e24
; =>                                                     ;; 3.1301724869373886e+24