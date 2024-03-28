#lang racket

; Actividad 2.2 - Programación Funcional Parte 2
; Andrés Martínez - A00227463
; Andrés Sandoval - A01253138

; Ejercicio 1
; La función toma el número N y la lista LST y regresa una lista con el número insertado en orden.

(define (insert n lst)
  (cond
    [(eq? empty lst) (list n)]
    [(<= n (car lst)) (cons n lst)]
    [else (cons (car lst)(insert n (cdr lst)))]
  )
)

; Ejercicio 2
; Función que recibe una lista y la ordena de forma ascendente utilizando el algoritmo de ordenamiento por inserción.

(define (insertion-sort lst)
  (define (insertion-sort-helper lst-inside sorted)
    (cond
      [(empty? lst-inside) sorted]
      [else (insertion-sort-helper (cdr lst-inside) (insert (car lst-inside) sorted))]))
  (insertion-sort-helper lst '()))

; Ejercicio 4
; La función recibe un número y devuelve una lista con los factores primos de ese número.

(define (prime-factors n)
  (define (iter n divisor factors)
    (cond ((= n 1) factors)
          ((= (modulo n divisor) 0) 
           (iter (/ n divisor) divisor (cons divisor factors)))
          (else (iter n (+ divisor 1) factors))))
  (iter n 2 '()))

; Ejercicio 5
; La función recibe dos números y devuelve el máximo común divisor (ó GCD) de ambos números.

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Ejercicio 6
; La función recibe una lista y, utilizando la recursión, regresa el mismo contenido de la misma pero con el orden de sus elementos intercambiados, incluyendo listas anidadas.

(define (deep-reverse lst)
  (cond ((null? lst) '())                   
        ((not (pair? lst)) lst)             
        (else (append (deep-reverse (cdr lst)) 
                      (list (deep-reverse (car lst)))))))

; Ejercicio 9
; La función recibe una lista y devuelve una lista comprimida, eliminando los elementos repetidos de la lista.

(define (compress lst)
  (cond ((null? lst) '())
        ((null? (cdr lst)) lst)
        ((equal? (car lst) (cadr lst)) (compress (cdr lst)))
        (else (cons (car lst) (compress (cdr lst))))))

; Ejercicio 13
; La función toma como entrada una función de dos argumentos f y devuelve una nueva función que se comporta como f pero con el orden de sus dos argumentos intercambiados.

(define (args-swap f)
   (λ (x y)
    (f y x)))

((args-swap list) 1 2)

; Ejercicio 14
; La función recibe una función booleana y una lista. Después se regresa un booleano que evalúa si solo se cumplió una vez la función recibida.

(define (there-exists-one? pred lst)
  (define counter 0)
  (for-each (lambda (arg)
              (if (pred arg)
                  (set! counter (+ counter 1))
                  (void))) 
            lst)
   (= counter 1))


; Ejercicio 15
; La función recibe una lista, un valor x y una función de igualdad. Si el elemento no se encuentra en la lista devuelve falso, y por el otro lado devuelve la posición en la lista si el elemento se encuentra en la lista.

(define (linear-search lst x eq-fun)
  (define (search-helper lst index)
    (cond ((null? lst) #f)
          ((eq-fun (car lst) x) index)
          (else (search-helper (cdr lst) (+ index 1)))))
  (search-helper lst 0)) 
