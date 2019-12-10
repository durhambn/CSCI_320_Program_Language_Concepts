#lang racket

;Assignment 4 - Brandi Durham

;1 make_list_size
;returns list of n copies of e
(define (make_list_size N E )
  (cond
    ((zero? N) '())
    (else (cons E (make_list_size (- N 1) E)))
    )
  )

;2 zeros
;returns the number of zeros in list
(define (zeros list)
  (cond
    ((null? list) 0)
    ((zero? (car list))(+ 1 (zeros (cdr list))))
    (else (zeros (cdr list)))
    )
  )

;3 power
;returns a raised to the b power
(define (power a b)
  (cond
    ((zero? b) 1)
    (else (expt b a))
    )
  )

;4 remove
;takes a list and an atom and returns a list with atom's removed
(define (remove list atom)
  (cond
    ((null? list) list)
    ((eqv? atom (car list))(remove (cdr list) atom))
    (else (cons (car list)(remove (cdr list) atom)))
    )
  )

;5 largest
;returns largest value in list
(define (largest list)
  (cond
    ((null? list) '())
    ((null? (cdr list))(car list))
    ((< (car list) (cadr list)) (largest (cdr list)))
    (else (largest (cons (car list) (cddr list))))
    )
  )