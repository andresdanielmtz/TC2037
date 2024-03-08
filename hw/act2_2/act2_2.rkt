#lang racket

; Actividad 2.2 
; Implementación de Métodos Computacionales 



; Ejercicio 7 

(define (insert-anywhere x lst)
  (define (insert-at index lst)
    (if (empty? lst)
        (list (list x))
        (cons (append (take lst index) (cons x (drop lst index)))
              (map (lambda (rest) (cons (first lst) rest))
                   (insert-at (add1 index) (rest lst))))))
  (insert-at 0 lst))

; Ejemplo
(insert-anywhere 1 '(2 3 4 5)) 