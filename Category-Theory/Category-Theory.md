
---
title: Category Theory notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \usepackage{amsthm}
 - \usepackage{tikz-cd}
 - \newcommand{\cat}{\mathbf}
 - \newcommand{\domain}[1]{\mathrm{dom}(#1)}
 - \newcommand{\codomain}[1]{\mathrm{cod}(#1)}
 - \newcommand{\idarrow}[1][]{\mathbf{1}_{#1}}
---
[//]: # Category-Theory.md
[//]: # Mac Radigan

$$
\theoremstyle{definition}
\newtheorem{defn}{Definition}[section]
\newtheorem{ex}{Exercise}
$$

## Kleisli Triple $\left( M, unit, \star \right)$

### type constructor $\left( M \right)$
\begin{equation}
M t
\end{equation}

### unit function $\left( unit \right)$
\begin{equation}
t \rightarrow \left( M t \right)
\end{equation}

### bind function $\left( \star \right)$
\begin{equation}
\left( M t \right) \rightarrow \left( t \rightarrow \left( M u \right) \right) \rightarrow \left( M u \right)
\end{equation}

## Monad Laws

### left unit
\begin{equation}
\mbox{unit } a \star \lambda b . m = n \left[ a/b \right]
\end{equation}

### right unit
\begin{equation}
m \star \lambda a . \mbox{ unit } a = m
\end{equation}

### associative
\begin{equation}
m \star \left( \lambda a . n \star \lambda b . o \right) = \left( m \star \lambda a . n \right) \star \lambda b . o
\end{equation}

# Category

A \emph{category} $\cat{C}$ consists of
\begin{itemize}
\item a collection of objects: $A$ , $B$ , $C$ ,
  \ldots
\item a collection of arrows: $ f $ , $ g $ , $h $ ,
  \ldots
\item for each arrow $f$ objects $\domain{f}$ and
  $\codomain{f}$ called the \emph{domain} and
\emph{codomain} of $f$. If $\domain{f}=A$ and
  $\codomain{f}=B$ , we also write $f:A \to B$,
\item given $f:A \to B$ and $g:B \to C$ , so that
  $\domain{g}=\codomain{f}$, there is an arrow
  $g \circ f:A \to C$ ,
\item an arrow $\idarrow[A]: A\to A$ for every
object $A$ of $\cat {C} $,
\end{itemize}
such that
\begin{description}
\item[(Associative law)] for every $f:A \to B$,
  $g:B \to C$ and $h:C \to C$ we have
\begin{equation*}
h\circ(g\circ f)=(h\circ g)\circ f,
\end{equation*}
\item[(Unit laws)] for every $f:A \to B$ we have
\begin{equation*}
f\circ\idarrow[A]=f=\idarrow[B]\circ f.
\end{equation*}
\end{description}


# Composition
\begin{equation*}
\begin{tikzcd}
A \arrow[r,"f"]
  \arrow[dr,swap,"g\circ f"]
  &
B \arrow[dr,"g\circ h"]
  \arrow[d,swap,"g"]
  \\
  {}&
C \arrow[r,swap,"h"]
  &
D
\end{tikzcd}
\end{equation*}


