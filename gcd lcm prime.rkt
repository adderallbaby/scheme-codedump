(define (my-gcd a b)
  (if (= 0 b)
      a
      (my-gcd b (remainder a b))
      )
  )


(define (prime? n)
  (isprime1? n 2)
  )
(define (isprime1? n i)
  (if (= 0 (remainder n i))
      (if (= n i)
          #t
          #f
       )
      (isprime1? n (+ i 1))
      
  
  )
 )

(define (my-lcm a b)
  (mylcm1 a b 1))
(define  (mylcm1 a b n)
  (if (= 0(remainder n a))
      (if (= 0 (remainder n b))
          n
          (mylcm1 a b (+ n 1))
          )
      (mylcm1 a b (+ n 1))
  )
  )
