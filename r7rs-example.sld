(define-library (r7rs-example)
  (export say-hello)
  (import (scheme base) (scheme case-lambda))
  (cond-expand
    (chicken (begin (define which "Chicken")))
    (chibi   (begin (define which "Chibi")))
    (gauche  (begin (define which "Gauche")))
    (gambit  (begin (define which "Gambit")))
    (else    (begin (define which "...?"))))
  (begin  (define say-hello
            (case-lambda
              (()
               (say-hello which))
              ((name)
               (write-string "Hello ")
               (write-string name)
               (newline))))))
