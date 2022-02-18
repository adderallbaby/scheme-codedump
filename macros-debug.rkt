

(define-syntax trace-ex
  (syntax-rules ()
    ((my-begin one-action)  (and (display 'one-action) (display "=>") (display one-action )(display "\n") one-action) )
 ))


(define (zip . xss)
  (if (or (null? xss)
          (null? (trace-ex (car xss)))) ; Здесь...
      '()
      (cons (map car xss)
            (apply zip (map cdr (trace-ex xss)))))) ; ... и здес 