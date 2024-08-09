#lang sicp
; Exercise 1.6
(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
;0

(new-if (= 1 1) 0 5)
;5


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))


(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))


(sqrt 2)
;This will not stop even if the good-enough? is true

;The program on debugging in DrRacket shows one more flaw of substitution using applicative order evaluation
;here in the new-if the arguments are always evaluated first and then its applied to the procedure, hence
;the sqrt-iter is always evaluated resulting in an infinite evaluation.
