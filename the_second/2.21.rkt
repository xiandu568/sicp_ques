#lang sicp
(define squares (list 1 2 3 4))
(define (square x)
  (* x x))
(define (lst_square square lst)
  (map square lst))
(lst_square square squares)