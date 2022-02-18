
(define-syntax test
  (syntax-rules ()
    ((test first second) (list 'first second))))

(define (run-test test)
  (display (car test))
  (define foldation (eval (car test) (interaction-environment)))
  (if (equal? foldation (cadr test))
      (begin (display " ok") (display "\n") #t)
      (begin (display " FAIL") (display "\n")
             (display "  Expected: ") (display (cadr test)) (display "\n")
             (display "  Returned: ") (display foldation) (display "\n") #f)))
(define (run-tests tests)
  (or (null? tests) (and (run-test (car tests)) (run-tests (cdr tests)))))



(define (signum x)
  (cond
    ((< x 0) -1)
    ((= x 0)  1) ; Ошибка здесь!
    (else     1)))

(define the-tests
  (list (test (signum -2) -1)
        (test (signum  0)  0)
        (test (signum  2)  1)))



(run-tests the-tests)