#lang racket
;written by Kevin Koscica
;The purpose of this program is to show off the quicksort algorithm using a pivot value
(define (quicksort L)
    (if (null? L) L
    (letrec ((pivot (car L)) ;chooses first element as pivot
         (split  
        (lambda (piv li return) 
            ;return is the list to be returned
            ;return will be (<pivot . >=pivot)
          (cond ((null? li) return) 
                ((< (car li) piv)
                 (split piv (cdr li) (cons (cons (car li) (car return))
                                             (cdr return))))
                (else   
                   (split piv (cdr li) (cons (car return) 
                                             (cons (car li)
                                                (cdr return)))))))
            ))      
      `(,@(quicksort (car (split pivot (cdr L) '(() . ())))) ,pivot
       ,@(quicksort (cdr (split pivot (cdr L) '(() . ()))))) 
      )
    )
  )