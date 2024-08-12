#lang sicp
;Exercise 1.9

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 4 5)
; The best way to visualise the evolution of process is to view the stack while debugging in DrRacket
;Here the stack (things to be added later) increases with each call, hence its recursive process
;              (+ 4 5)
;              (inc (+ 3 5))
;              (inc (inc (+ 2 5)))
;              (inc (inc (inc (+ 1 5))))
;              (inc (inc (inc (inc (+ 0 5)))))  ----> here the predicate (= a 0) satisfies and substituted to b = 5
;              (inc (inc (inc (inc 5))))
;              (inc (inc (inc 6)))
;              (inc (inc 7))
;              (inc 8)
;              9

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))


(+ 4 5)
;There each iteration produce a new procedure with no dependency on the previous one. The stack size require is just one
;can be visualised in debug mode, this makes it an iterative process
;
;             (+ 4 5)
;             (+ 3 6)
;             (+ 2 7)
;             (+ 1 8)
;             (+ 0 9) -----> here the predicate (= a 00 satisfies and invokes b
;             9
