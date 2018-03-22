#lang racket
;Written by Kevin Koscica, the purpose of this assignment is to use racket to answer the homework problems.

;This function computes the power of a function using recursion 
(define (power base exponent)
  {let([sqr(lambda (b ex)
             {cond
               [(odd? ex) (power (* b b) ((quotient (- ex 1) 2)) (* base))]
               [else (power (* b b) (quotient exp 2) (* base))]})])
  {cond
    [ (= exponent 0) 1]
    [ else (* base (power base (- exponent 1)))]
  }
 }
)

;This function utilizes the power function from above in order to calculate the sum of the powers of 1^e to n^e
(define (power-sum n e)
    (cond
      ((= n 0) 0)
      (else (+ (power n e) (power-sum(- n 1)e)))
    )
  )
;This function demonstrates the use of letrec and lambda to define the power function within the power-sum function
(define (power-sum1 n e)
  { letrec ([power1 (lambda (base exponent)
                      {cond
                         [ (= exponent 0) 1]
                         [ else (* base (power1 base (- exponent 1)))]
                         }
                      )
                    ]
            )
                         
  
                        
  (cond
      ((= n 0) 0)
      (else (+ (power1 n e) (power-sum1(- n 1)e)))
      )
     }
  )
     
      