

(define (sum-n n)
  (if (= n 0)
      0
      (+ n (sum-n (- n 1)))))

(define (square-sum-n n) (* (sum-n n) (sum-n n)))

(define (differ c n)
  (if (= n 0)
      c
      (differ (- c (* n n)) (- n 1))))


(display (differ (square-sum-n 100) 100 ))
