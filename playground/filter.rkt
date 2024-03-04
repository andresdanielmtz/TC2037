#lang racket

; Regresa una lista con los elementos pares con estos mismos valores al cuadrado.

(map (lambda (number) (* number number)) (filter even? '(1 2 3 4 5 6 7 8 9 10)))