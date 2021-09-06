#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

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

(define (queens board_size)
  (define (queen_cols k)
    (if (= k 0)
        (list empty_board)
        (filter
         (lambda (pos) (safe? k pos))
         (flatmap
          (lambda (rest_queens)
            (map (lambda (new_row)
                   (adjoin_pos new_row k rest_queens))
                 (enumerate_interval 1 board_size)))
          (queen_cols (- k 1))))))
  (queen_cols board_size))
(define empty_board nil)

(define (adjoin_pos new_row k rest_queens)
  (cons new_row rest_queens))
(define (safe? k position)
    (iter-check (car position) 
                (cdr position)       
                 1))

(define (iter-check row-of-new-queen rest-of-queens i)
    (if (null? rest-of-queens)  ; 下方所有皇后检查完毕，新皇后安全
        #t
        (let ((row-of-current-queen (car rest-of-queens)))
            (if (or (= row-of-new-queen row-of-current-queen)           ; 行碰撞
                    (= row-of-new-queen (+ i row-of-current-queen))     ; 右下方碰撞
                    (= row-of-new-queen (- row-of-current-queen i)))    ; 左下方碰撞
                #f
                (iter-check row-of-new-queen 
                            (cdr rest-of-queens)    ; 继续检查剩余的皇后
                            (+ i 1))))))            ; 更新步进值
(for-each (lambda (pos)
            (begin
              (display pos)
              (newline)))
          (queens 8))

              
                   
  