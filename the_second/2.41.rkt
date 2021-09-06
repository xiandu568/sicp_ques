#lang sicp
;练习2.41
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
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (unique_pairs n)
  (accumulate append
              nil
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                   (enumerate_interval 1 (- i 1))))
                   (enumerate_interval 1 n))))
;flatmap
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (unique_triples n)
  (flatmap (lambda (i)
            (map (lambda (j)
                   (cons i j))
                 (unique_pairs (- i 1))))
          (enumerate_interval 1 n)))
(define (tripe_sum_equal? sum triple)
  (= sum
     (+ (car triple)
        (cadr triple)
        (caddr triple))))

(define (remove_triple_not_equal sum triple)
  (filter (lambda (current_triple)
            (tripe_sum_equal? sum current_triple))
          triple))
(remove_triple_not_equal 10 (unique_triples 6))
c

