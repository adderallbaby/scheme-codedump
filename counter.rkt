(define (count x xs)
      (define (fold x xs n)
        (if (null? xs)
            n
            (if (equal? x (car xs))
                (fold x (cdr xs) (+ 1 n))
                (fold x (cdr xs) n))))
        (fold x xs 0)
        
  )
     