#lang sicp
;Exercise 1.7
;Below is the sqrt program using newton's method

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;Here its the idea of comparing the square of guess with that of x we are
;trying to find square of

(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (square x)
  (* x x))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 4)

;2.0000000929222947

;Lets find the relative error percentage
;Realative error in percentage =

(define (Rerror% real calculated)
  (* 100 (abs (/ (- real calculated) real))))
(Rerror% 2 (sqrt 4))


;4.6461147373833e-6

;Issues faced when dealing with larger or smaller number
;Smaller number

(sqrt 0.00156)

;0.04634063049926908

(Rerror% 0.039496835316262998 (sqrt 0.00156))

;17.327452005219566
;its easy to view that the realtive error has increased a lot
;Lets see for large number

(Rerror% 12345678987654321 (sqrt 1.5241578966620942021e+32))


;The computer is stuck and goes to infinite loop as the computer is not able to
;handle such precision

;To solve this issue as suggested in the problem comparing the relative change of guess and
;when its very small we halt and give the output
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- guess x)) 0.001))

;For small numbers
(Rerror% 0.039496835316262998 (sqrt 0.00156))
;Error decreased = 1.2794984799458176

;For large numbers
(Rerror% 12345678987654321 (sqrt 1.5241578966620942021e+32))
;Error decreased to 0.0


