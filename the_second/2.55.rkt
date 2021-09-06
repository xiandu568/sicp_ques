#lang sicp
(define (equal? seq1 seq2)
  (cond ((and (null? seq1) (null? seq2)) true)
        ((or (null? seq1) (null? seq2)) false)
        ((eq? (car seq1) (car seq2))
         (equal? (cdr seq1) (cdr seq2)));需要递归深度
        (else false)))
(equal? '(this is a test)  '(this is a test))
(car ''abracadabra)