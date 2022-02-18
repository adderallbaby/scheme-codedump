(define (sqeq a b c)
  (if (= 0 a)
      (if (= 0 b)
          #f
          (root2 b c)
          )
      (if (= 0 b)
          (if (> c 0)
              "Пустое множество решений"
              (root3 a c))
          (root1 a b c))))

(define (root1 a b c)
  (if (> 0 (-(* b b) (* 4 (* a c))))
      "Пустое множество решений"
      (list (/ (- (- b) (sqrt(-(* b b) (* 4 (* a c)))))(* 2 a)) (/ (+ (- b) (sqrt(-(* b b) (* 4 (* a c)))))(* 2 a))))
  )
      
(define (root2 b c)
  (/ (- c) b)
  )
(define (root3 a c)
  (list (sqrt(/ (- c) a)) (-(sqrt(/ (- c) a))
  )))

