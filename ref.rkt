(define (string-insert xs index elem)
  (and (>= index 0) (<= index (string-length xs)) (char? elem) (string-append (substring xs 0 index) (string elem) (substring xs index (string-length xs)))))

(define (list-insert xs index elem)
  (and (>= index 0) (<= index (length xs)) (cond ((null? xs) (and (= index 0) (list elem))) ((= index 0) (cons elem xs))(else (cons (car xs) (list-insert (cdr xs) (- index 1) elem))))))

(define (vector-insert xs id el)
  (and (>= index 0) (<= index (vector-length xs)) (list->vector (list-insert (vector->list xs) index elem))))

(define (ref xs index . elems)
  (if (null? elems\)
      (cond ((string? xs) (and (>= index 0) (<= index (- (string-length xs) 1)) (string-ref xs index)))
            ((vector? xs) (and (>= index 0) (<= index (- (vector-length xs) 1)) (vector-ref xs index)))
            ((list? xs) (and (>= index 0) (<= index (- (length xs) 1)) (vector-ref (list->vector xs) index))))
      (cond ((string? xs) (string-insert xs index (car elems)))
            ((vector? xs) (vector-insert xs index (car elems)))
            ((list? xs) (list-insert xs index (car elems))))))