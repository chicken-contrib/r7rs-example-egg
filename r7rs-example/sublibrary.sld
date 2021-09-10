(define-library (r7rs-example sublibrary)
  (export subseq)
  (import (scheme base) (scheme case-lambda))
  (begin

    (define (list-copy* list start end)
      (let loop ((new-list '())
                 (list (list-tail list start))
                 (start start))
        (if (< start end)
            (loop (cons (car list) new-list)
                  (cdr list)
                  (+ start 1))
            (reverse new-list))))

    (define subseq
      (let ((recognize
             (lambda (seq)
               (cond ((string? seq) (values string-copy string-length))
                     ((vector? seq) (values vector-copy vector-length))
                     ((list?   seq) (values list-copy*  length))
                     (else          (error "Not a sequence" seq))))))
        (case-lambda
          ((seq start)
           (let-values (((copy length) (recognize seq)))
             (copy seq start (length seq))))
          ((seq start end)
           (let-values (((copy length) (recognize seq)))
             (copy seq start end))))))))
