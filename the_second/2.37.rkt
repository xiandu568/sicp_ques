#lang sicp
(define x(list (list 1 2 3 4) (list 5 6 6 6) (list 6 7 8 9)))
(define v(list 1 2 3 4))
(define (dot_product v w)
  (accumulate + 0 (map * v w)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (matrix-*-vector m v)
  (map (lambda (x)
         (dot_product v x))
       m))
;测试
(matrix-*-vector  x v)
(define (accumulate_n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate_n op init (map cdr seqs)))))
(define (transpose mat)
  (accumulate_n cons nil mat))
(transpose x)
;矩阵乘法
(define (matrix_*_matrix m v)
  (let ((cols (transpose v)))
    (map (lambda (y)
           (matrix-*-vector cols y))
         m)))
(matrix_*_matrix x (transpose x))
        
