#lang sicp
;Exercise 1.3
;Declare the sq procedure
(define (sq x) (* x x))
;Declare the sum of square procedure
(define (sum-of-sq x y)
  (+ (sq x) (sq y)))

;Finding the sum of square of two larger number out of 3
(define (sum-of-sq-of-2-larger-num x y z)
  (cond ((and (> x y) (> y z))
         (sum-of-sq x y))
        ((and (> y x) (> z x))
         (sum-of-sq y z))
        (else x z)))

(sum-of-sq-of-2-larger-num 3 4 5)