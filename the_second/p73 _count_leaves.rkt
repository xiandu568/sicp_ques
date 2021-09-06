#lang sicp
(define (count_leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count_leaves (car x))
                 (count_leaves (cdr x))))))
(define x (cons (list 1 2) (list 3 4)))
(count_leaves x)
 (list 1 (list 2 (list 3 4)))
