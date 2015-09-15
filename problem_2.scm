

(define (sum-of-even-fib-lt-n n)

  (define (fib)
    (define (fib-iter n1 n2)
      (if (>= n1 n)
        '()
        (cons n1 (fib-iter n2 (+ n1 n2) ))))

    (fib-iter 1 2))

  (define (even-sum l)
    (cond ((null? l) 0)
          ((even? (car l))
           (+ (car l) (even-sum (cdr l))))
          (else
            (even-sum (cdr l)))))

  (even-sum (fib)))

(display (sum-of-even-fib-lt-n 4000000))
