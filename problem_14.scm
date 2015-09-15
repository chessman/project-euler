
; for using fold
(use-modules (srfi srfi-1))

(define (chain-length n)
  (define (chain-len-iter n len)
    (cond ((= n 1 ) (+ 1 len))
          ((even? n ) (chain-len-iter (quotient n 2) (+ len 1)))
          ((odd? n ) (chain-len-iter (+ (* n 3) 1) (+ len 1)))))
  
  (chain-len-iter n 0))


(define (max-chain-length n max-chain-list)
  (cond ((= n 1000000) max-chain-list)
        ((> (chain-length n) (cdr max-chain-list))
	  (max-chain-length (+ 1 n) (cons n (chain-length n))))
	(else (max-chain-length (+ 1 n) max-chain-list))))

(display (max-chain-length 1 (cons 1 1)))
