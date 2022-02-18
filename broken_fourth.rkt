(define (mycdr mylist)
  (define (folded mlist)
    (if (list? (cdr mlist))
        (if (equal? (cdr mlist) '())
            #t
            (folded (cdr mlist)))
        "NOT PROPPER"))
  (folded mylist))
(define (folded mylist newlist)
  (if (not (number? (cdr mylist)))
      (if (equal? (cdr mylist) '())
          newlist
          (folded (cdr mylist) (cons (car mylist) newlist)))
      (append (list (cdr mylist) (car mylist) ) newlist)))
(define (improper->proper mlist)
  (if (list? mlist)
      mlist

      (reverse (folded mlist (list)))))