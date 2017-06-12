
---
title: Convex Optimization notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \usepackage{algorithm}
 - \usepackage{algorithmic}
 - \usepackage{amsfonts}
 - \usepackage{amssymb}
 - \bibliographystyle{IEEEtran}
---
[//]: # Convex-Optimization.md
[//]: # Mac Radigan

## Convex Optimization

### Infeasible Start Newton Method

\begin{algorithm}
\caption{Infeasible Start Newton Method}
\begin{algorithmic}
\STATE{ $\mathbf{given} x \in f, \nu, \epsilon<0, \alpha \in \left(0,\frac{1}{2}\right), \beta \in \left(0,1\right)$ }
\REPEAT
    \STATE{ 1. compute primal and dual Newton steps $\Delta x_{NT}$ and $\Delta \nu_{NT}$ }
    \STATE{ 2. backtracking line search on $\|r\|_2$ }
    \STATE{    t := 1}
      \WHILE{ $\|r\left(x+t\Delta x_{NT},\nu+t\Delta\nu_{NT}\right)\|_2 > \left(1-\alpha t\right)\|r\left(x,\nu\right)\|_2$ }
      \STATE{ $t := \beta t$ }
      \ENDWHILE
    \STATE{ 3. update $x:=x+t\Delta x_{NT}$ and $\nu:=\nu+t\Delta \nu_{NT}$ }
\UNTIL{$Ax=b \mathbf{and}$ $\|r\left(x,\nu\right)\|\leq\epsilon$}
\end{algorithmic}
\label{eq:problem4Algorithm}
\end{algorithm}
