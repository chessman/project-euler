
(use-modules (ice-9 rdelim))
(debug-set! stack 10000000)

(define (triangle-value n)
  ( / (* n (1+ n) ) 2))

(define (is-triangle x)
  (define (tri? x n)
    (cond  ((> (triangle-value n) x) 0)
	   ((= (triangle-value n) x) 1)
	   (else (tri? x (+ n 1)))))
  (tri? x 1))

(define (char-accum char start)
  (+ start (- (char->integer char) (char->integer #\A)) 1))

(define (word-value word)
  (string-fold char-accum 0 word))

(define (count-triangles t)
  (if (null? t) 
    0
    (+ (is-triangle (car t)) (count-triangles (cdr t)))))

(define (words-values fd)
  (define (iter fd data)
    (if (string-any char-alphabetic? data)
      (list (word-value data))
      (list)))
  (let ((data (read-delimited (string #\" #\,) fd)))
    (if (eof-object? data)
      (list) 
      (append (iter fd data) (words-values fd)))))

(let ((fd (open-input-file "words.txt")))
  (display "Answer: ")
  (display (count-triangles (words-values fd))))


