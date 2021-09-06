#lang sicp
(define (make_interval a b)
  (cons a b))
(define (upper_bound x)
  (cdr x))
(define (lower_bound x)
  (car x))
(define (sub_interval x y)
  (make_interval (- (lower_bound x)
                    (upper_bound y))
                 (- (upper_bound x)
                    (lower_bound y))))
(define (divide_interval x y)
  (if (or (= (upper_bound y) 0) (= (lower_bound y) 0))
      (display "error")
      (mul_interval x
                    (make_interval
                     (/ 1.0 (upper_bound y))
                     (/ 1.0 (lower_bound y))))))
(define (mul_interval x y)
  (let ((p1 (* (lower_bound x) (lower_bound y)))
        (p2 (* (lower_bound x) (upper_bound y)))
        (p3 (* (upper_bound x) (lower_bound y)))
        (p4 (* (upper_bound x) (upper_bound y))))
    (make_interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

        
            
(define x (make_interval 1 2))
(define y (make_interval 3 4))
(sub_interval x y)
(mul_interval x y)