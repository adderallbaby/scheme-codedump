   
(define (interpret program stack)
  
  (define (jmp_end start)
    (if (eq? (vector-ref program start) 'end)
        start
        (jmp_end (+ start 1))))
  (define (jmp_if start)
    (if (eq? (vector-ref program start) 'endif)
        start
        (jmp_if (+ start 1))))

  (define (main_program count stack stack_return dictionary)
    (and 
   
    (if (>= count (vector-length program)) stack
        (let ((current_lexem (vector-ref program count)))
          (cond ((number? current_lexem) (main_program (+ count 1) (cons current_lexem stack) stack_return dictionary))
                ((eq? current_lexem '+) (main_program (+ count 1) (cons (apply + (list (cadr stack) (car stack))) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem '-) (main_program (+ count 1) (cons (apply - (list (cadr stack) (car stack))) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem '*) (main_program (+ count 1) (cons (apply * (list (cadr stack) (car stack))) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem '/) (main_program (+ count 1) (cons (apply quotient (list (cadr stack) (car stack))) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem 'mod) (main_program (+ count 1) (cons (apply remainder (list (cadr stack) (car stack))) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem 'neg) (main_program (+ count 1) (cons (- (car stack)) (cdr stack)) stack_return dictionary))
                ((eq? current_lexem '=) (main_program (+ count 1) (cons (if (apply = (list (cadr stack) (car stack))) -1 0) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem '>) (main_program (+ count 1) (cons (if (apply > (list (cadr stack) (car stack))) -1 0) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem '<) (main_program (+ count 1) (cons (if (apply < (list (cadr stack) (car stack))) -1 0) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem 'not) (main_program (+ count 1) (cons (if (= (car stack) -1) 0 -1) (cdr stack)) stack_return dictionary))
                ((eq? current_lexem 'and) (main_program (+ count 1) (cons (if (and (apply = (list (cadr stack) (car stack))) (= (car stack) -1)) -1 0) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem 'or) (main_program (+ count 1) (cons (if (or (= (cadr stack) -1) (= (car stack) -1)) -1 0) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem 'drop) (main_program (+ count 1) (cdr stack) stack_return dictionary))
                ((eq? current_lexem 'swap) (main_program (+ count 1) (append (list (cadr stack) (car stack)) (cddr stack)) stack_return dictionary))
                ((eq? current_lexem 'dup) (main_program (+ count 1) (append (list (car stack) (car stack)) (cdr stack)) stack_return dictionary))
                ((eq? current_lexem 'over) (main_program (+ count 1) (cons (cadr stack) stack) stack_return dictionary))
                ((eq? current_lexem 'rot) (main_program (+ count 1) (append (list (caddr stack) (cadr stack) (car stack)) (cdddr stack)) stack_return dictionary))
                ((eq? current_lexem 'depth) (main_program (+ count 1) (append (list (length stack)) stack) stack_return dictionary))
                ((eq? current_lexem 'define) (main_program (+ (jmp_end count) 1) stack stack_return (cons (list (vector-ref program (+ count 1)) (+ count 2)) dictionary)))
                ((eq? current_lexem 'if) (if (not (= (car stack) 0))
                                             (main_program (+ count 1) (cdr stack) stack_return dictionary)
                                             (main_program (+ (jmp_if count) 1) (cdr stack) stack_return dictionary)))
                ((eq? current_lexem 'endif) (main_program (+ count 1) stack stack_return dictionary))
                ((eq? current_lexem 'end) (main_program (car stack_return) stack (cdr stack_return) dictionary))
                ((eq? current_lexem 'exit) (main_program (car stack_return) stack (cdr stack_return) dictionary))
                ((not (eq? (assq current_lexem dictionary) #f))
                 (and (display (cadr (assq current_lexem dictionary)))
                      (newline)
          
                  (main_program (cadr (assq current_lexem dictionary)) stack (cons (+ count 1) stack_return) dictionary)))
                (else 'error))))))
  
  (main_program 0 stack '() '()))
