(define (any? pred? xs)
  (my-and (and(map pred? xs))))
  
(define (my-and xs)
  (if (null? xs)
      #f
      (if (equal? (car xs) #t)
          #t
          (my-and (cdr xs)))
  ))
  
(lambda (x y)
  (+ x y)
  5 3)