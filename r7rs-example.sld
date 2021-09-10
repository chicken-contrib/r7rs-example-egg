(import (r7rs))
(define-library (r7rs-example)
  (export say-hello)
  (import (scheme base) (scheme case-lambda))
  (begin  (define say-hello
            (case-lambda
              (()
               (write-string "Hello")
               (newline))
              ((name)
               (write-string "Hello ")
               (write-string name)
               (newline))))))
