#lang sicp
; Exercise 1.5

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
;APPLICATIVE ORDER EVALUATION:
;As Applicative order evaluates the arguments and then apply,
;it will check the first procedure to evaluate argument which
;result in loop as (p) is defined with itself (a philosophical conundrum)

;NORMAL ORDER EVALUATION:
;In normal order of evaluation we fully expand the procedure and then start
;reducing it. Hence, the if conditional gives an output 0.

;Applicative order can be visualised by DrRacket Debugger