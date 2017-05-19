
---
title: Information Theory
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
---

## Information Theory

In information theory, the analog of the law of large numbers is the Asymptotic Equipartition Property (AEP).

The Law Of Large Numbers states that for Indenpendent, Identically Distributed (*i.i.d.*) random variables states:

$\frac{1}{N} \Sigma_{k=1}^N X_k \rightarrow E\left(N\right)$ for sufficiently large N

The Asymptotic Equipartition Property (AEP) states:

$\frac{1}{N} \log_2{\frac{1}{p\left(X_1,X_2,\cdots,X_N\right)}} \rightarrow H\left(X\right)$ where $H$ is the entropy, $X_k$'s are *i.i.d*. and $p\left(X_1,X_2,\cdots,X_N\right)$ is the probability of observing the sequence $X_1,X_2,\cdots,X_N$.

This enables us to divide the set of all sequences into two sets, the *typical set*, where the sample entropy is close to the true entropy, and the nontypical set, which contains the other sequences.

## Entropy

The entropy is a measure of the average uncertainty in a random variable.

The entropy of a random variable $X$ with a probability mass function $p(x)$ is defined by
\begin{equation}
H\left(X\right) = -\sum_x p\left(x\right) \log_{2}{p\left(x\right)}
\end{equation}


## Asymptotic Equipartition Property (AEP)

If $X_1,X_2,\cdots,X_N$ are *i.i.d* ~ p(x), then
\begin{equation}
\frac{1}{N} \log_2{p\left(X_1,X_2,\cdots,X_N\right)} \rightarrow H\left(X\right) \mbox{ in probability }
\end{equation}

Proof:
\begin{equation*}
\begin{split}
\frac{1}{N} \log_2{p\left(X_1,X_2,\cdots,X_N\right)} & = -\frac{1}{N} \sum_k{\log_{2}{p\left(X_k\right)}} \\
                                                     & \rightarrow -E \log_{2}{p\left(X\right)} \\
                                                     & \rightarrow H\left(X\right) \\
\end{split}
\end{equation*}


## Typical Set $A_\epsilon^{\left(n\right)}$

A *typical set* $A_\epsilon^{\left(n\right)}$ with respect to p(x) is the set of sequences $\left(x_1, x_2, \cdots, x_N\right) \in \mathcal{X}^N$ with the property

\begin{equation*}
2^{-N\left(H\left(X\right)+\epsilon\right)} \leq p\left(x_1, x_2, \cdots, x_n\right) \leq 2^{-N\left(H\left(X\right)-\epsilon\right)}
\end{equation*}

