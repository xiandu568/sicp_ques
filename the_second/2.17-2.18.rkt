#lang sicp
(define squares (list 1 4 9 16 25 36))
(define (list_ref items n)
  (if (= n 0)
      (car items)
      (list_ref (cdr items) (- n 1))))
(define (last_pair l)
  (if (null?  (cdr l))
      ( car l)
      (last_pair (cdr l))))
(define (reverse lst)
  (iter lst '()))
(define (iter remaind_lst result)
  (if (null? remaind_lst)
      result
      (iter (cdr remaind_lst)
      (cons( car remaind_lst) result))))
(reverse squares)

  
(last_pair squares)
      