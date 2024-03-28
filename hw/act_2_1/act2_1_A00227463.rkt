#lang racket

; Implementación de Métodos Computacionales
; Actividad 2.1 - Programación Funcional
; Andrés Daniel Martínez Bermúdez - A00227463

; Ejercicio #1
; Toma la temperatura en fahrenheit y la convierte a celsius

(define (fahrenheit-to-celsius f)
  (/ (* 5.0 (- f 32)) 9))

(fahrenheit-to-celsius 32) ; 0
(fahrenheit-to-celsius 212) ; 100
(fahrenheit-to-celsius 98.6) ; 37
(fahrenheit-to-celsius 68) ; 20
(fahrenheit-to-celsius 50) ; 10

; Ejercicio 2
; Toma un número y devuelve 1 si es positivo, -1 si es negativo y 0 si es 0

(define (sign n)
    (cond ((< n 0) -1) 
    ((= n 0) 0)
    ((> n 0) 1))
)

(sign 5) ; 1
(sign -5) ; -1
(sign 0) ; 0


; Ejercicio 3
; Toma los coeficientes de una ecuación cuadrática y devuelve las raíces

(define (roots a b c) 
 (/ (+ (* -1 b) (sqrt (- (expt b 2) (* 4 (* a c))))) (* 2 a))
)

(roots 1 -3 2) ; 2
(roots 1 2 1) ; -1
(roots 1 -5 6) ; 3

; Ejercicio 4
; Toma el peso y la altura de una persona y devuelve su índice de masa corporal

(define (bmi w h)
 (define bm (/ w (expt h 2)))
 (cond ( (< bm 20) "underweight") ( (and (<= 20 bm) (< bm 25)) "normal") ( (and (<= 25 bm) (< bm 30) ) "obese1") ( (and (<= 30 bm) (< bm 40) ) "obese2") ( (>= bm 40) "obese3")))

(bmi 70 1.8) ; normal
(bmi 50 1.8) ; underweight
(bmi 90 1.8) ; obese1
(bmi 100 1.8) ; obese2
(bmi 120 1.8) ; obese3

; Ejercicio 5
; Toma un número y devuelve su factorial

(define (factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))

(factorial 5) ; 120
(factorial 10) ; 3628800
(factorial 20) ; 2432902008176640000


; Ejercicio 6
; Toma una lista y duplica cada elemento

(define (duplicate lst)
    (apply append (map (lambda (x) (list x x)) lst)))

(duplicate '(1 2 3 4 5)) ; (1 1 2 2 3 3 4 4 5 5)
(duplicate '(a b c d e)) ; (a a b b c c d d e e)
(duplicate '(1 2 3 4 5 6 7 8 9 10)) ; (1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10)

; Ejercicio 7 
; Toma un número y un exponente y devuelve el número elevado al exponente

(define (pow n e)
    (expt n e)
)

(pow 2 3) ; 8
(pow 3 3) ; 27
(pow 4 2) ; 16

; Ejercicio 8
; Toma un número y devuelve el n-ésimo número de la serie de Fibonacci

(define (fib n) 
    (cond ((<= n 1) n) (else (+ (fib (- n 1)) (fib (- n 2)))))
)

(fib 0) ; 0
(fib 1) ; 1
(fib 2) ; 1

; Ejercicio 9 
; Toma una lista y devuelve una lista de listas con cada elemento de la lista original

(define (enlist lst)
    (map (lambda (x) (list x)) lst))

(enlist '(1 2 3 4 5)) ; ((1) (2) (3) (4) (5))
(enlist '(a b c d e)) ; ((a) (b) (c) (d) (e))
(enlist '(1 2 3 4 5 6 7 8 9 10)) ; ((1) (2) (3) (4) (5) (6) (7) (8) (9) (10))


