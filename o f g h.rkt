(define (o . fs)
  (if (null? fs)
      (lambda (x) x)
      (lambda (x) ((car fs) ((apply o (cdr fs)) x)))))