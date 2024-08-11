#lang sicp
;Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;Considering the substitution model it is easy to see that the interpreter first calls (a-plus-abs-b ..),
;which substitute itself with ((if ..) ..) and then replaces the result of predicate with an operator.
;Here the operator on a and b is itself the output of conditional. Use Dr.Racket to debug and understand.

(a-plus-abs-b 3 -4)
;7
