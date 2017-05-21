
---
title: The Frame Algorithm and the Cayley-Hamilton Theorem
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
---

The following excerpt is from **Matrix Theory, From Generalized Inverses to Jordan Forms**, by Robert Piziak and P. L. Odell.

In 1949, **J. Sutherlang Frame** (24 December 1907 - 27 February 1997) published an abstract in the *Bulletin of the American Mathematical Society* indicating a recursive algorithm for computing the inverse of a matrix and, as a by-product, getting additional informaiton, including the famous Cayley-Hamilton theorem.  (Hamilton is the Irish mathematician **William Rowan Hamilton** (4 August 1805 - 2 September 1895), and Cayley is **Aurthur Cayley** (16 August 1821 - 26 January 1895.)  We have not been able to find an actual paper with a detailed account of these claims.  Perhaps the author thought the abstract sufficient and went on with his work in group representations.  Perhaps he was told this algorithm had beeen rediscovered many times (see [House, 1964, p. 72]).  Whatever the case, in this section, we will expand on and expose the details of Frame's algorithm.  Suppose $A \in \mathbf{C}^{n \times n}$.  The *characteristic matrix* of A is $xI - A \in \mathbf{C}\left[x\right]^{n \times n}$, the collection of *n*-by*n* matrices with polynomial entries.  We must open our minds to accepting matrices with polynomial entries.  For example, $\left[ {\begin{array}{cc} x^2+1 & x-3 \\ 4x+2 & x^3-7 \\ \end{array} }\right] \in \mathbf{C}\left[x\right]^{2 \times 2}$.  Determinants work just fine for these kinds of matrices.  The determinant of $xI - A$, $det\left(xI - A\right) \in \mathbf{C}\left[x\right]$, the polynomials in x, and is what we call the *characteristic polynomial* of A:

\begin{equation*}
\mathcal{X}_A\left(x\right) = det\left(xI - A\right) = x^n + c_1 x^{n-1} + \cdots + c_{n-1} x + c_n
\end{equation*}

For example, if $A = \left[ {\begin{array}{ccc} 1 & 2 & 2 \\ 3 & 4 & 5 \\ 6 & 7 & 8 \end{array} }\right] \in \mathbf{C}\left[x\right]^{3x3}$, then $xI_3 - A =$

$\left[ {\begin{array}{ccc} x-1 & -2 & -2 \\ -3 & x-4 & -5 \\ -6 & -7 & x-8 \end{array} }\right] \in \mathbf{C}\left[x\right]^{3x3}$.  

Thus $\mathcal{X}_A\left(x\right) = {\begin{vmatrix} x-1 & -2 & -2 \\ -3 & x-4 & -5 \\ -6 & -7 & x-8 \end{vmatrix} } = x^3 - 13x^2 -9x - 3$.  This is computed using the usual familiar rules for expanding a determinant.

You may recall that the roots of the characteristic polynomial are quite important, being the *eigenvalues* of the matrix.  We will turn to this topic later.  For now, we focus on the coefficients of the characteristic polynomial.

First, we consider the constant term $c_n$.  You may already know the answer here, but let's make an argument.  Now $det\left(A\right) = \left(-1\right)^n det\left(-1\right) = \left(-1\right)^n det\left(0I - A\right) = \left(-1\right)^n \mathcal(X)_A\left(0\right) = \left(-1\right)^n c_n$.  Therefore, 

\begin{equation*}
det\left(A\right) = \left(-1\right)^n c_n.
\end{equation*}

As a consequence, we see immediately that A is invertible iff $c_n \neq 0$, in which case

\begin{equation*}
A^{-1} = \frac{\left(-1\right)^n}{c_n}adj\left(A\right),
\end{equation*}

where $adj\left(A\right)$ is the adjugate matrix of A introduced previously.  Also recall the important relationship, $B adj\left(B\right) = det\left(B\right)I$.  We conclude that

\begin{equation*}
\left(xI - A\right)adj\left(xI - A\right) = \mathcal{X}_A\left(x\right)I
\end{equation*}

To illustrate with the example above, 
$$ \left(xI - A\right)
= \left[ {\begin{array}{ccc} x-1 & -2 & -2 \\ -3 & x-4 & -5 \\ -6 & -7 & x-8 \end{array} }\right] \cdot \left[ {\begin{array}{ccc} x^2-12x-3 & 2x-2 & 2x+2 \\ 3x+6 & x^2-9x-4 & 5x+1 \\ 6x-3 & 7x+5 & x^2-5x-2 \end{array}} \right]
$$
$$
= \left[ {\begin{array}{ccc} x^3-13x^2-9x-3 & 0 & 0 \\ 0 & x^3-13x^2-9x-3 & 0 \\ 0 & 0 & x^3-13x^2-9x-3 \end{array} }\right] 
$$
$$
= x^3-13x^2-9x-3 \cdots \left[ {\begin{array}{ccc} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{array} }\right] 
$$

Next, let $C\left(x\right) = adj\left(xI - A\right) \in \mathbf{C}\left[x\right]^{n \times n}$.  We note that the elements of $adj\left(xI - A\right)$ are computed as $\left(n-1\right)-by-\left(n-1\right)$ subdeterminants of $\left(xI - A\right)$, so the highest power that can occur in $C\left(x\right)$ is $x^{n-1}$.  Also, note that we can identify $\mathbf{C}\left[x\right]^{n \times n}$, the *n*-by-*n* matrices with polynomial entries with $\mathbf{C}^{n \times n}\left[x\right]$, the polynomials with matrix coefficients, so we can view $C\left(x\right)$ as a polynomial in $x$ with scalar matrices as coefficients.  For example, 
$$ \left[ {\begin{array}{cc} x^2+1 & x-3 \\ 4x+2 & x^3-7 \end{array} }\right] = $$
$$ \left[ {\begin{array}{cc} 0 & 0 \\ 0 & 1 \end{array} }\right]x^3 + \left[ {\begin{array}{cc} 1 & 0 \\ 0 & 0 \end{array} }\right]x^2 + \left[ {\begin{array}{cc} 0 & 1 \\ 4 & 0 \end{array} }\right]x + \left[ {\begin{array}{cc} 1 & -3 \\ 2 & -7 \end{array} }\right]x.$$  All you do is gather the coefficients of each power of $x$ and make a matrix of scalar coefficients of that power of $x$.  Note that what we have thusly created is an element of $\mathbf{C}\left[x\right]^{n \times n}$, the polynomials in $x# whose coefficients come form the *n*-by*n* matrices over $\mathbf{C}$.  Also note, $xB = Bx$ for all $B \in \mathbf{C}\left[x\right]^{n \times n}$, so it does not matter which side we put the $x$ on.  We now view $C\left(x\right)$ as such an expression in $\mathbf{C}^{n \times n}\left[x\right]:$

$$C\left(x\right) = B_0 x^{n-1} + B_1 x^{n-2} + \cdots + B_{n-2} x + B_{n-1}.$$
