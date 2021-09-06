#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (length sequence)
  (accumulate (lambda (x y)
                (+ 1 y))
              0
              sequence))
(define (horner_eval x coefficient_sequence)
  (accumulate (lambda (this_coeff higher_terms)
                (+ this_coeff (* x higher_terms)))
              0
              coefficient_sequence))
(horner_eval 2 (list 1 3 0 5 0 1))
                