#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (prime_sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (make_pair_sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime? n)
  (define (small_divides n)
    (find_divisor n 2))
  (define (find_divisor n test_divisor)
    (cond  ((> (square test_divisor) n) n)
           ((divides? test_divisor n) test_divisor)
           (else (find_divisor n (+ test_divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (small_divides n)))
(define (prime_sum_pairs n)
  (map make_pair_sum
       (filter prime_sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate_interval 1 (- i 1))))
                (enumerate_interval 1 n)))))
(define (square x)
  (* x x))
(define (filter predicte sequence)
  (cond ((null? sequence) nil)
        ((predicte (car sequence))
         (cons (car sequence)
               (filter predicte (cdr sequence))))
        (else (filter predicte (cdr sequence)))))
(define (enumerate_interval  low high)
  (if (> low high)
      nil
      (cons low (enumerate_interval (+ low 1) high))))
(define (unique_pairs n)
  (accumulate append
              nil
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                   (enumerate_interval 1 (- i 1))))
                   (enumerate_interval 1 n))))
(define (prime-sum-pairs n)
  (map make_pair_sum
       (filter prime_sum? (unique_pairs n))))

(unique_pairs 4)
(prime-sum-pairs 4)
(prime_sum_pairs 4)
(map (lambda (i)
           (* 2 i))
           (list 1 2 3 4))
              

      
       

  
