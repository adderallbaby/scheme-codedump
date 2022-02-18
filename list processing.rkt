(define (my-range a b d)
  (define (folded newlist appender block step)
    (if (>= appender block)
        (reverse newlist)
        (folded (cons appender newlist) (+ step appender) b step)
        )
    )
  (folded (list) a b d)
  )

(define (my-element? x xs)
  (define (folded check checklist)
    (if (null? checklist)
        #f
        (if (= (car checklist) check)
            (= (car checklist) check)
            (folded check (cdr checklist))
            )
        )
    )
  (folded x xs)
  )
(define (my-filter pred? xs)
  (define (folded pred? new old)
    (if (null? old)
        (reverse new)
        (if (pred? (car old))
            (folded pred? (append (list (car old)) new) (cdr old))
            (folded pred? new (cdr old))))
    )
  (folded pred? (list) xs)
  )
(define (my-fold-left op xs)
  (define (folded fu l)
    (if (null? (cdr l))
        (car l)
        (folded fu (cons (apply fu (list (car l) (cadr l))) (cdr (cdr l))))
        )
    )
  (folded op xs)
  )
(define (my-fold-right op xs)
  (define (folded fu l)
    (if (null? (cdr l))
        (car l)
        (folded fu (reverse (cons (apply fu (list (cadr (reverse l)) (car (reverse l)))) (reverse(cdr (cdr(reverse l)))))))
        ))
    
  (folded op xs)
  )

(define (my-flatten xs)
  (if (null? xs)
      (list)
      (if (pair? xs)
          (append (my-flatten (car xs)) (my-flatten (cdr xs)))
          (list xs)
          )
      )
  )