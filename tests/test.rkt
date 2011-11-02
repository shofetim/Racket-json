#lang racket/base

(require rackunit
         "../main.rkt")

;; Basic jexpr tests
(check-true (jsexpr? #\null))
(check-true (jsexpr? #t))
(check-true (jsexpr? #f))
(check-true (jsexpr? "I am string"))
(check-true (jsexpr? 12))
(check-true (jsexpr? -12))
(check-true (jsexpr? -1.0))
(check-true (jsexpr? 1E10))
(check-true (jsexpr? '(1E10 #t "string")))
(check-true (jsexpr? (hasheq 'foo "string")))
(check-true (jsexpr? (hasheq 'foo 10)))
(check-false (jsexpr? 3+4i))
