#lang racket

; Ejercicio #1

(define (fahrenheit-to-celsius f)
  (/ (* 5.0 (- f 32)) 9))

;Ejercicio 2

(define (sign n)
    (cond ((< n 0) -1) 
    ((= n 0) 0)
    ((> n 0) 1))
)

; Ejercicio 3

(define (roots a b c) 
 (/ (+ (* -1 b) (sqrt (- (expt b 2) (* 4 (* a c))))) (* 2 a))
)

; Ejercicio 4

(define (bmi w h)
 (define bm (/ w (expt h 2)))
 (cond ( (< bm 20) "underweight") ( (and (<= 20 bm) (< bm 25)) "normal") ( (and (<= 25 bm) (< bm 30) ) "obese1") ( (and (<= 30 bm) (< bm 40) ) "obese2") ( (>= bm 40) "obese3")))

; Ejercicio 5

(define (factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))

; Exercise 6

(define (duplicate lst)
    (apply append (map (lambda (x) (list x x)) lst)))

; Exercise 7 

(define (pow n e)
    (expt n e)
)

; Exercise 8

(define (fib n) 
    (cond ((<= n 1) n) (else (+ (fib (- n 1)) (fib (- n 2)))))
)



; Exercise 9 

(define (enlist lst)
    (map (lambda (x) (list x)) lst))

