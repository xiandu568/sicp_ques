#lang scheme/gui 
(#%require sicp-pict)
(require graphics)
(open-graphics)
(define (make_rect xcor_vect ycor_vect)
  (list  xcor_vect ycor_vect))
(define (xcor_vect v)
  (car v))
(define (ycor_vect v)
  (cadr v))
(define (make_segment start end)
  (list start end))
(define (start_segment v)
  (car v))
(define (end_segment v)
  (cadr v))

(define (add_vect vect1 vect2)
  (make_rect (+ (xcor_vect vect1)
                (xcor_vect vect2))
             (+ (ycor_vect vect1)
                (ycor_vect vect2))))
(define (sub_vect vect1 vect2)
  (make_rect (- (xcor_vect vect1)
                (xcor_vect vect2))
             (- (ycor_vect vect1)
                (ycor_vect vect2))))
(define (scale_vect scale vect)
  (make_rect (* (xcor_vect vect)
                scale)))

(make_segment (make_rect 0 0)
              (make_rect 1 1))
(define (segments->painter segment_list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame_coord_map frame) (start_segment segment))
        ((frame_coord_map frame) (end_segment segment)))))
    segment_list))
(define (frame_coord_map frame)
  (lambda(v)
    (add_vect
     (origin_frame frame)
     (add_vect (scale_vect (xcor_vect v)
                           (edge1_frame frame))
               (scale_vect (xcor_vect v)
                           (edge2_frame frame))))))
(define (make_frame origin edge1 edge2)
    (list origin edge1 edge2))

(define (origin_frame f)
    (car f))

(define (edge1_frame f)
    (cadr f))

(define (edge2_frame f)
    (caddr f))
(define left-top (make-vect 0.0 1.0))

(define right-bottom (make-vect 1.0 0.0))

(define right-top (make-vect 1.0 1.0))
(define left-bottom (make-vect 0.0 0.0))

(define left-top-to-right-bottom (make-segment left-top
                                               right-bottom))

(define right-top-to-left-bottom (make-segment right-top
                                               left-bottom))
(define canvas
  (open-viewport "canvas" 1024 1024))
(segments->painter (list left-top-to-right-bottom
                         right-top-to-left-bottom))
        