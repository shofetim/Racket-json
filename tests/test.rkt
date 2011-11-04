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

;; Test reading json
;;(check-eq? (read-json (open-input-string "-23")) -23 "Parsing negative ints")
(check-equal? (read-json (open-input-string "0.023")) .023 "Parsing decimals")
(check-eq? (read-json (open-input-string "2")) 2 "Parsing a lone number")
(check-eq? (read-json (open-input-string " 2")) 2 "value is preceded by whitespace")


;; Test using sample json files

;;Failing
;; (check-eq? (let ([in (open-input-file "json-samples/pass1.json")])
;;              (read-json in))
;;            '??)

(check-equal? (let ([in (open-input-file "json-samples/pass3.json")])
                (read-json in))
              '#hasheq(
                       (|JSON Test Pattern pass3| . 
                              #hasheq(
                                      (|The outermost value| . "must be an object or array.") 
                                      (|In this test| . "It is an object.")))))


(check-equal? (let ([in (open-input-file "json-samples/pass2.json")])
                (read-json in))
              '((((((((((((((((((("Not too deep"))))))))))))))))))))