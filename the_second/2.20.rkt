#lang sicp
(define (filter option? lst)
  (cond ((null? lst) nil)
        ((option? (car lst))
         (cons (car lst) (filter option? (cdr lst))))
        (else (filter option? (cdr lst)))))
(define mylist (list 1 2 3 4 5 6 7))
(filter even? mylist)