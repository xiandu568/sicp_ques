#lang sicp
(define (make_interval a b)
  (cons a b))
(define (upper_bound x)
  (cdr x))
(define (lower_bound x)
  (car x))
(define (make_center_width c w)
  (make_interval (- c w) (+ c w)))

(define (center i)
  (/ (- (upper_bound i) (lower_bound i)) 2))

(define (mul_interval x y)
  (if (> (lower_bound x) 0)
      (if (> (lower_bound y) 0)
          (make_interval (* (lower_bound x) (lower_bound y))
                         (* (upper_bound x) (upper_bound y)))
          (if (> (upper_bound y) 0)
              (make_interval (* (upper_bound x) (lower_bound y))
                         (* (upper_bound x) (upper_bound y)))
              (make_interval (* (upper_bound x) (lower_bound y))
                         (* (lower_bound x) (upper_bound y)))))
      (if (> (upper_bound x) 0)
          (if (> (lower_bound y) 0)
          (make_interval (* (lower_bound x) (upper_bound y))
                         (* (upper_bound x) (upper_bound y)))
          (if (> (upper_bound y) 0)
              (let (( p1 (max (* (upper_bound x)
                                 (upper_bound y))
                              (* (lower_bound x)
                                 (lower_bound y))))
                    (p2 (min (* (upper_bound x)
                                (lower_bound y))
                             (* (upper_bound y)
                                (lower_bound x)))))  
              (make_interval p2 p1))
              (make_interval (* (lower_bound y) (upper_bound x))
                         (* (lower_bound x) (lower_bound y)))))
          (if (> (lower_bound y) 0)
              (make_interval  (* (lower_bound x) (lower_bound y))
                         (* (upper_bound x) (upper_bound y)))
              (if (> (upper_bound y) 0)
                  (make_interval  (* (lower_bound x) (upper_bound y))
                         (* (lower_bound x) (upper_bound y)))
                  (make_interval  (* (upper_bound x) (upper_bound y)
                                     (* (lower_bound x) (lower_bound y)))))))))

(define x (make_interval -1 2))
(define y (make_interval -3 -2))
(mul_interval x y)

              
              
              
          
              
          
      
