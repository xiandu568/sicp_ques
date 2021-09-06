#lang sicp
(define (fold_left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
(define (reverse sequence)
  (fold_left (lambda (x y)
               (cons y x)) 
             nil
             sequence))
(reverse (list 1 2 3 4))
(fold_left list nil (list 1 2 3))
                  