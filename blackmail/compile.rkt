#lang racket
(provide all-defined-out)
(require "ast.rkt" a86/ast)

;;Expr -> Asm
(define (compile e)
  (prog (Label 'entry)
        (compile-e e)
        (Ret)))

(define (compile-e e)
  (match e
    [(Prim1 p e) (compile-prim1 p e)]
    [(Int i) (compile-integer i)]))

(define (compile-prim1 p e)
  (seq (compile-e e)
       (match p
         ['add1 (Add 'rax 1)]
         ['sub1 (Sub 'rax 1)])))

(define (compile-integer i)
  (seq (Mov 'rax i)))
