#lang sicp
(define (square_list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons 
               (square (car things))
                    answer))))
  (iter (reverse items) '()))


      
  
(define (square x)
  (* x x))
(define squares (list 1 2 3 4))
(square_list squares)