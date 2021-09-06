#lang sicp
;对树的映射
(define (scale_tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale_tree (car tree) factor)
                    (scale_tree (cdr tree) factor)))))
;map 实现树中所有元素扩大倍数
(define (sacle_map tree factor)
  (map (lambda (sub_tree)
         (if (pair? sub_tree)
             (scale_map sub_tree factor)
             (* sub_tree factor)))
       tree))

  