
---
title: Lambda Calculus Notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{minted}
 - \usepackage{mathrsfs}
 - \bibliographystyle{IEEEtran}
---
[//1]: # Lambda-Calculus.md
[//2]: # Mac Radigan

## Y-Combinator

Description of the Y Combinator based on Mike Mvanier's blog post \cite{Mvanier}.
see http://mvanier.livejournal.com/2897.html

### Cannonical Expression

Curry's Y Combinator \cite{WikiY} is defined as:

\begin{equation}
\mathbf{Y} = 
\lambda f . 
\left( \lambda x . f \left( x x \right) \right)
\left( \lambda x . f \left( x x \right) \right)
\label{eq:y_combinator}
\end{equation}

When applied to a function $g$, the expansion follows \cite{WikiY}

\begin{equation}
\begin{aligned}
\mathbf{Y}g 
& = \left( \lambda f .  \left( \lambda x . f \left( x x \right) \right) \left( \lambda x . f \left( x x \right) \right) \right) g \\
& = \left( \lambda x . g \left( x x \right) \right) \left( \lambda x . g \left( x x \right) \right) \\
& = g \left( \left( \lambda x . g \left( x x \right) \right) \left( \lambda x . g \left( x x \right) \right) \right) \\
& = g \left( \mathbf{Y} g \right)
\end{aligned}
\label{eq:y_combinator_expanded}
\end{equation}

#### Connonical Form in Scheme
Direct implementation of the above expression for the Y Combinator will not terminate during applicative order \cite{Mvanier}.

##### Strict Scheme (Chicken)
  Chicken scheme is a strict scheme, and evaluates in applicative order.
````scheme

    (define Y
      (lambda (f)
        (f (Y f))))

    (define almost-factorial
      (lambda (f)
        (lambda (n)
          (if (= n 0)
              1
              (* n (f (- n 1)))))))

    (define factorial (Y almost-factorial))

    (display (factorial 6)) ; infinite loop

````

##### Using Lazy Evaluation (Racket \#lang lazy)
  This will work in a lazy language, as shown using the lazy extension in Racket.
````scheme

  #lang lazy

  ;;; Eliminating (most) explicit recursion (lazy version)

  (define Y
    (lambda (f)
      (f (Y f))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (println (factorial 6)) ; 720


````

#### Normal Order Y Combinator
The Normal Order Y Combinator will not terminate during applicative order \cite{Mvanier}.

##### Strict Scheme (Chicken)

````scheme

  ;;; The lazy (normal-order) Y combinator

  (define Y 
    (lambda (f)
      ((lambda (x) (f (x x)))
       (lambda (x) (f (x x))))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (prn (factorial 6)) ; infinite loop


````

##### Using Strict Evaluation (Racket)

````scheme

  #lang lazy

  ;;; The lazy (normal-order) Y combinator

  (define Y 
    (lambda (f)
      ((lambda (x) (f (x x)))
       (lambda (x) (f (x x))))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (println (factorial 6)) ; 720


````

##### Using Lazy Evaluation (Racket \#lang lazy)
However, it will work under lazy evaluation.

````scheme

  #lang lazy

  ;;; The lazy (normal-order) Y combinator

  (define Y 
    (lambda (f)
      ((lambda (x) (f (x x)))
       (lambda (x) (f (x x))))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (println (factorial 6)) ; 720


````

#### Applicative-Order) Y Combinator
The Strict (Applicative-Order) Y Combinator can be used with both applicative order and lazy evaluation \cite{Mvanier}.

##### Strict Scheme (Chicken)

````scheme

  ;;; The strict (applicative-order) Y combinator

  (define Y 
    (lambda (f)
      ((lambda (x) (x x))
       (lambda (x) (f (lambda (y) ((x x) y)))))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define (part-factorial self)
     (let ((f (lambda (y) ((self self) y))))
       (lambda (n)
         (if (= n 0)
           1 
           (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (display (factorial 6)) ; 720


````

##### Using Strict Evaluation (Racket)

````scheme

  #lang racket

  ;;; The strict (applicative-order) Y combinator

  (define Y 
    (lambda (f)
      ((lambda (x) (x x))
       (lambda (x) (f (lambda (y) ((x x) y)))))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define (part-factorial self)
     (let ((f (lambda (y) ((self self) y))))
       (lambda (n)
         (if (= n 0)
           1 
           (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (println (factorial 6)) ; 720

````

##### Using Lazy Evaluation (Racket \#lang lazy)

````scheme

  #lang lazy

  ;;; The strict (applicative-order) Y combinator

  (define Y 
    (lambda (f)
      ((lambda (x) (x x))
       (lambda (x) (f (lambda (y) ((x x) y)))))))

  (define almost-factorial
    (lambda (f)
      (lambda (n)
        (if (= n 0)
            1
            (* n (f (- n 1)))))))

  (define (part-factorial self)
     (let ((f (lambda (y) ((self self) y))))
       (lambda (n)
         (if (= n 0)
           1 
           (* n (f (- n 1)))))))

  (define factorial (Y almost-factorial))

  (println (factorial 6)) ; 720

````

\bibliography{IEEEabrv,bibliography}
