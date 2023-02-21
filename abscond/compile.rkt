#lang racket
(provide compile compile-e)
(require "ast.rkt" a86/ast)

(define (compile e)
  (prog (Label 'entry)
        (compile-e e)
        (Ret)))

;; Expr -> Asm
(define (compile-e e)
  (match e
    [(Int i)
     (Mov 'rax i)]))
