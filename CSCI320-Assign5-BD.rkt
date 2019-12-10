#lang racket
;Assignment 5
;Brandi Durham
;CSCI 320

;1 Complex Number Operations
(define (real num)
  (car num)
  )

(define (complex num)
  (cadr num)
  )

(define (compl num)
  (cadr num)
  )

(define (abs num)
  (sqrt (+ (expt 2 (real num)) (expt 2 (complex num))))
  )

(define (equal? num1 num2)
  (cond
   ((and (eqv? (real num1) (real num2)) (eqv? (complex num1) (complex num2))) #t)
   (else #f)
   )
  )

(define (plus num1 num2)
  (+ (+ (real num1) (real num2)) (+ (complex num1) (complex num2)))
  )

(define (minus num1 num2)
  (+ (- (real num1) (real num2)) (- (complex num1)(complex num2)))
  )

(define (prod num1 num2)
  (* (+ (real num1) (complex num1)) (+ (real num2) (complex num2)))
  )

(define (quotient num1 num2)
  (/
   (+
    (+
     (* (real num1) (real num2))
     (* (complex num1) (complex num2))
    )
    (-
     (* (real num2) (complex num1))
     (* (real num1) (complex num2))
     )
    )
   (+
    (expt 2 (real num2)) (expt 2 (complex num2)))
   )
  )

;2
;remove function from Assignment 4
(define (remove list atom)
  (cond
    ((null? list) list)
    ((eqv? atom (car list))(remove (cdr list) atom))
    (else (cons (car list)(remove (cdr list) atom)))
    )
  )

(define (permutation? list1 list2)
  (cond
    ((and (null? list1) (null? list2)) #t)
    ((and (eqv? (cdr list1) '()) (eqv? (cdr list2) '()) (eqv? (car list1) (car list2))) #t)
    ((not(= (length list1) (length list2))) #f)
    (else (permutation? (remove list1 (car list1)) (remove list2 (car list1))))
    )
  )

;3
(define (tree? list)
  (cond
    ((null? list) #t)
    ((null? (cdr list)) #t)
    (else (and (tree? (cadr list)) (tree? (caddr list))))
    )
  )

(define (preorder tree)
  (cond
    ((not (tree? tree)) #f)
    ((null? tree) '())
    ((null? (cdr tree)) (car tree))
    (else (append (list (car tree)) (preorder (cadr tree)) (preorder (caddr tree))))
    )
  )

(define (inorder tree)
  (cond
    ((not (tree? tree)) #f)
    ((null? tree) '())
    ((null? (cdr tree)) (car tree))
    (else (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree))))
    )
  )

(define (postorder tree)
  (cond
    ((not (tree? tree)) #f)
    ((null? tree) '())
    ((null? (cdr tree)) (car tree))
    (else (append (postorder (cadr tree)) (postorder (caddr tree)) (list (car tree))))
    )
  )