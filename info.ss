#lang setup/infotab
(define name "json")
(define blurb
  (list "Implements the JSON data exchange format."))
(define primary-file "main.rkt")
(define categories '(datastructures))
(define scribblings '(("json.scrbl" ())))
(define release-notes
  '((p "The json library was originally developed by dherman see dherman/json.")
    (p "This version includes some bugfixes and better test. Before I
        released it I tried to get in contact with dherman to incorperate the
        changes instead of forking, but I was not able to do so.")))
(define repositories '("4.x"))
(define required-core-version "5.2.0.1")
(define version "1")
