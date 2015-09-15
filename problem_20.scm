
; for using fold
(use-modules (srfi srfi-1))

(define (number->digits-list n)
  (if (= 0 n)
   '()
   (cons (remainder n 10) (number->digits-list (quotient n 10)))))

(define (factorial n)
  (define (fact-iter n a)
    (if (= n 0)
       a
       (fact-iter (- n 1) (* n a))))
  (fact-iter n 1))

(display (fold + 0 (number->digits-list (factorial 100))))
