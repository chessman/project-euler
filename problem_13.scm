
(use-modules (srfi srfi-1))

(define (int-list fd)
 (let ((int (read fd)))
   (if (eof-object? int) 
      '()
      (cons int (int-list fd)))))

(let ((fd (open-input-file "test.in")))
  (display "Answer: ")
  (display (substring (number->string (fold + 0 (int-list fd))) 0 10)))

