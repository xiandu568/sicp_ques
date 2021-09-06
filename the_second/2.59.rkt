#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
(define (equal? x y)
  (cond ((and (symbol? x) (symbol? y))
         (eq? x y))
        ((and (number? x) (number? y))
         (eq? x y))
        ((and (list? x) (list y))
         (list-equal? x y))))
(define (list-equal? x y)
  (cond ((and (null? x) (null? y))
         true)
        ((or (null? x) (null? y))
          false)
        ((equal? (car x) (car y))
         (list-equal? (cdr x) (cdr y)))
        (else false)))
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)));set 是列表 只能用cons组合 还可以append
;并集
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
         nil)
        ((element-of-set? (car set1) set2)
         (cons (car set1)(intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
(define (union-set set1 set2)
  (reverse (iter (append set1 set2) nil)))
(define (iter input result)
  (if (null? input)
      result
      (if (element-of-set? (car input) result)
          (iter (cdr input) result)
          (iter (cdr input)
                (cons (car input) result)))))
(union-set '(1 2 3) '(4 5 6))
                                  




        

