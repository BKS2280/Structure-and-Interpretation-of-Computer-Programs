#lang sicp
;Exercise 1.8
;cube root procedure, only thing that changed was how to improve guess

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 64)
; 4.000017449510739

;For better approximation we can use the same improvement in Ex-1.7