#lang sicp
(define x(list (list 1 2) (list 3 4)))
(reverse x)
(define (deep_reverse x)
  (cond ((null? x) nil)
        ((not (pair? x)) x)
        (else (reverse (list (deep_reverse (car x))
                             (deep_reverse (cadr x)))))))
(deep_reverse x)
(cadr x);car cdr 解开包