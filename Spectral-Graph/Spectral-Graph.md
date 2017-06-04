
---
title: Notes on Spectral Graph Theory
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \usepackage{algorithm}
 - \usepackage{amsfonts}
 - \usepackage{amssymb}
 - \usepackage{fancyvrb}
 - \usepackage{titlesec}
 - \usepackage{algpseudocode}
---

The Laplacian matrix is the product of an oriented incident matrix, say $\mathbb{M}$,  and its transpose.  Note that this matrix is Hermitian, which is a property we will exploit in the numerical computation of eigenvalues.
\begin{equation}
\mathbb{L} = \mathbb{M}\mathbb{M}^{\intercal}
\label{eq:laplacianMatrix}
\end{equation}
We can determine if all nodes within a submatrix of an oriented incident matrix is connected from its algebraic connectivity.  The second eigenvalue of the Laplacian matrix of a subgraph is the algebraic connectivity, and thus the subgraph is connected if the second eigenvalue is greater than zero.  
\begin{equation} 
\Delta_{\mathbb{L}}\left(s\right) = | s\mathbb{I} - \mathbb{L} |
\label{eq:characteristicPolynomial}
\end{equation}
\begin{equation} 
\underline{\lambda} = \Delta_{\mathbb{L}}\left(0\right)
\label{eq:eigenvalues}
\end{equation}
\begin{equation} 
\lambda_{2} > 0 \Leftrightarrow \mbox{ connected}
\label{eq:eigenvalues}
\end{equation}

Of course, we may also compute the transitive closure from the adjacency matrix.
\begin{equation} 
\mathbb{C}^{*} = \left( \mathbb{A} + \mathbb{I}_{N \times N} \right)^{N}
\label{eq:characteristicPolynomial}
\end{equation}

We may exploit the fact that our Laplacian matrix is Hermitian, and use Kung's Algorithm for $\mathbb{QR}$ factorization (qrDecomp).  We may then use the $\mathbb{QR}$ Algorithm (eigW) to compute the eigenvalues of the Laplacian matrix.

To support Kung's Algorithm, we introduce a notation for transvections, $T_{i,j}^{N}\left(x\right)$.  The transvection is an $N \times N$ matrix with ones along the diaginal, the value $x$ at row $i$ and column $j$, and zeros elsewhere.

\begin{equation}
\centering
\mathbb{T}_{i,j}^{N}\left(x\right) = \mathbb{I}_{N} + x\mathbb{E}_{i,j}
\label{eq:transvection}
\end{equation}

Kung's $\mathbb{QR}$ Algorithm then computes a strictly positive diagonalization matrix, $\mathbb{E}$, and resultant diagonal matrix $\mathbb{D}$.  We define $\mathbb{C} = \sqrt{\mathbb{D}}$, and can write the factorization of a matrix $\mathbb{M}_{N \times N}$ as follows.
\begin{equation}
\centering
\mathbb{E} = \displaystyle{\prod_{i=1}^{N}} \displaystyle{\prod_{j \not= i}T_{i,j}^{N}\left(\mathbb{M}_{i,j}\right)^{*}}
\label{eq:qrDecompE}
\end{equation}
\begin{equation}
\centering
\mathbb{D} = \left(\mathbb{EM}\right)^{*}\left(\mathbb{ME}\right) = \mathbb{E}^{*}\mathbb{M}^{*}\mathbb{M}\mathbb{E}
\label{eq:qrDecompD}
\end{equation}
\begin{equation}
\centering
\mathbb{C} = \sqrt{\mathbb{D}}
\label{eq:qrDecompC}
\end{equation}
\begin{equation}
\centering
\mathbb{Q} = \mathbb{A}\mathbb{E}\mathbb{C}^{-1}
\label{eq:qrDecompQ}
\end{equation}
\begin{equation}
\centering
\mathbb{R} = \mathbb{C}\mathbb{E}^{-1}
\label{eq:qrDecompR}
\end{equation}

\begin{algorithm}
\caption{Transvection}
\label{alg:transvection}
\Function{transvection}{$\mathbb{M}_{N \times N},i,j$}
  \State \Comment{Initialize an identity matrix}
  \State allocate $\mathbb{T}_{N \times N} \gets 0$
  \For{$k \gets 1 \ldots N$}
    \State $\mathbb{T}_{k,k} \gets 1$
  \EndFor
  \State \Comment{Conjugate and copy at i,j}
  \State $\mathbb{T}_{i,j} \gets \mathbb{M}_{i,j}^{*}$
  \State \Comment{Return the transvection}
  \State \Return $\mathbb{T}$
\EndFunction
\end{algorithm}

\begin{algorithm}
\caption{Kung's Algorithm}
\label{alg:qrDecomp}
\Function{qrDecomp}{$\mathbb{M}_{N \ times N}$}
  \State \Comment{Initialize an identity matrix}
  \State allocate $\mathbb{E}_{N \times N} \gets 0$
  \For{$k \gets 1 \ldots N$}
    \State $\mathbb{E}_{k,k} \gets 1$
  \EndFor
  \State \Comment{Create the diagonalizer by applying conjugate pairs of transvections to remove off-diagonal elements}
  \For{$i \gets 1 \ldots N$}
    \For{$j \gets 1 \ldots N$}
      \If{$i \not= j$}
        \State $\mathbb{E} = \mathbb{E} \cdot \Call{Transvection}{\mathbb{M},i,j}$
      \EndIf
    \EndFor
  \EndFor
  \State \Comment{Apply the diagonalizer to create the diagonalization}
  \State $\mathbb{D} \gets \mathbb{E}^{*}\mathbb{M}^{*}\mathbb{M}\mathbb{E}$
  \State $\mathbb{C} \gets \sqrt{\mathbb{D}}$
  \State \Comment{Compute the $\mathbb{Q}$ and $\mathbb{R}$ matrices}
  \State $\mathbb{Q} \gets \mathbb{A}\mathbb{E}\mathbb{C}^{-1}$
  \State $\mathbb{R} \gets \mathbb{C}\mathbb{E}^{-1}$
  \State \Comment{Return the orthogonal and upper triangular decomposition}
  \State \Return $\mathbb{Q}, \mathbb{R}$
\EndFunction
\end{algorithm}

The \mathbb{QR} Algorithm iteratively computes the eigenvalues of a matrix using a \mathbb{QR} decomposition.  The algorithm converges when the elements in the subdiagonal approach zero.

\begin{algorithm}
\caption{QR Algorithm}
\label{alg:eigW}
\Function{eigW}{$\mathbb{A}^{N \times N}_0$}
  \State \Comment{Set the initial conditions}
  \State $k \gets 0$
  \State \mathbb{Q}_0, \mathbb{R}_0 \gets \Call{$qrDecomp$}{$\mathbb{A}_0$}
  \State \Comment{Iterate until the subdiagonal converges to zero}
  \While{$ \mathbb{A}_{k_{i,j}} < \epsilon, \forall j=i-1 \forall i \in 1 \ldots N$ }
    \State $k \gets k+1$
    \State $\mathbb{Q}_{k-1}, \mathbb{R}_{k-1} \gets \Call{qrDecomp}{\mathbb{A}_{k-1}}$
    \State $\mathbb{A}_{k} \gets \mathbb{R}_{k-1}\mathbb{Q}_{k-1}$
  \EndWhile
  \State \Comment{Create a vector from the diagonal elements of $\mathbb{A}_k$}
  \State $\underbar{\lambda} \gets \{ a_{i,j} | \forall a_{i,j} \in \mathbb{A}_k \land i=j \} }$
  \State \Comment{Return eigenvalues}
  \State \Return $\underbar{\lambda}$
\EndFunction
\end{algorithm}
