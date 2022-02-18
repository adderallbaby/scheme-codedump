(define (day-of-week day month year)
  (if (< month 3)
      (remainder (+ (- (+ day (quotient (* 31 (+ 10 month)) 12) (- year 1) (quotient (- year 1) 4)) (quotient ( - year 1) 100)) (quotient ( - year 1) 400)) 7)

      (remainder (+ (- (+ day (quotient (* 31 (- month 2)) 12) year (quotient year 4)) (quotient year 100)) (quotient year 400)) 7)
      

  )
)

