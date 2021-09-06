#lang sicp
(define (make_interval a b)
  (cons a b))
(define (upper_bound x)
  (cdr x))
(define (lower_bound x)
  (car x))
(define (make_center_percent c p)
  (make_interval (- c (* c (/ p 100)))(+ c (* c (/ p 100)))))

(define (center i)
  (/ (+ (upper_bound i) (lower_bound i)) 2))
(define (percent i)
  (* (/ (- (upper_bound i) (lower_bound i)) 2) 100))