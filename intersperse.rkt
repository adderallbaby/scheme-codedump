(define (intersperse x xs)
  (define (appender new old)
    (if (null? (cdr old))
        (append new (list (car old)))
        (appender (append new (list (car old) x)) (cdr old))))
  (appender (list) xs))
        