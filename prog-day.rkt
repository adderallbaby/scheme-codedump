(define (official-checker year)
  (if (> year 2010)
      (if (> year 2021)
          "Будет праздноваться официально"
          "Праздновался официально"
          )
      (if (> year 2001)
          "Праздновался неофициально"
          "Не праздновался"
          )
      )
  )
(define (fourhundred-checker year)
  (if  (= 0 (remainder year 4))
       (if (= 0 (remainder year 100))
           (if ( = 0 (remainder year 400))
               "12 сентября"
               "13 сентября"
               )
           "12 сентября"
           )
       "13 сентября"
       )
  )
      

(define (prog-day year)
  (if (> year 2001 )
      (list (official-checker year) (fourhundred-checker year))
      (official-checker year)
  )
 )