
---
title: Category Theory notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
---
[//]: # Category-Theory.md
[//]: # Mac Radigan

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

