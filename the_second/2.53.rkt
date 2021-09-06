#lang sicp
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
(memq 'a  '((a c) d) );false
(list 'a 'b 'c)
(pair? (cdr'((x1 x 2) (x3 x4))))