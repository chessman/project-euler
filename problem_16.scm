
; for using fold
(use-modules (srfi srfi-1))

(define (number->digits-list n)
  (if (= 0 n)
   '()
   (cons (remainder n 10) (number->digits-list (quotient n 10)))))

(display (fold + 0 (number->digits-list (expt 2 1000))))
