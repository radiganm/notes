
---
title: Camera Theory Notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \bibliographystyle{IEEEtran}
---
[//]: # Camera-Theory.md
[//]: # Mac Radigan

## Camera Matrix

### Intrinsic Parameters

The instrinsic camera \cite{Hartley2004}, having focal length $f$, shear $s$, sample spacing $m_x$ and $m_y$, and camera center $x_0$ and $y_0$.

\begin{equation}
\left[ \begin{array}{ccc}
m_{x}\emph{f} & s & x_{0} \\
0 & m_{y}\emph{f} & y_{0} \\
0 & 0 & 1 \\
\end{array} \right]
\left[ \begin{array}{cccc}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
\end{array} \right]
\label{eq:intrinsic}
\end{equation}

### Extrinsic Parameters

\begin{equation}
\left[ \begin{array}{cc}
\mathbf{R} & \mathbf{0}_{3x1} \\
\mathbf{0}_{1x3} & 1 \\
\end{array} \right]
\left[ \begin{array}{cc}
\mathbf{I}_{3x3} & \mathbf{t} \\
\mathbf{0}_{1x3} & 1 \\
\end{array} \right]
\label{eq:extrinsic}
\end{equation}

### Representation

\begin{equation}
\mathbf{H} = \mathbf{KPRT} = 
\left[ \begin{array}{ccc}
m_{x}\emph{f} & s & x_{0} \\
0 & m_{y}\emph{f} & y_{0} \\
0 & 0 & 1 \\
\end{array} \right]
\left[ \begin{array}{cccc}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
\end{array} \right]
\left[ \begin{array}{cc}
\mathbf{R} & \mathbf{0}_{3x1} \\
\mathbf{0}_{1x3} & 1 \\
\end{array} \right]
\left[ \begin{array}{cc}
\mathbf{I}_{3x3} & \mathbf{t} \\
\mathbf{0}_{1x3} & 1 \\
\end{array} \right]
\label{eq:camera}
\end{equation}

\begin{equation}
\mathbf{t} = \left[ \begin{array}{c}
t_{x} \\
t_{y} \\
t_{z} \\
\end{array} \right]
\label{eq:translation}
\end{equation}

\begin{equation}
\begin{split}
\mathbf{R} = \mathbf{R_{x}\left(\theta_{x}\right)R_{y}\left(\theta_{y}\right)R_{z}\left(\theta_{z}\right)}
\end{split}
\end{equation}

\begin{equation*}
\begin{split}
= \left[ \begin{array}{ccc}
1 & 0 & 0 \\
0 & \cos(\theta_{x}) & -\sin(\theta_{x}) \\
0 & \sin(\theta_{x}) & \cos(\theta_{x}) \\
\end{array} \right]
\left[ \begin{array}{ccc}
\cos(\theta_{y}) & 0 & \sin(\theta_{y}) \\
0 & 1 & 0 \\
-\sin(\theta_{y}) & 0 & \cos(\theta_{y}) \\
\end{array} \right]
\left[ \begin{array}{ccc}
\cos(\theta_{z}) & -\sin(\theta_{z}) & 0 \\
\sin(\theta_{z}) & \cos(\theta_{z}) & 0 \\
0 & 0 & 1 \\
\end{array} \right]
\label{eq:rotation}
\end{split}
\end{equation*}


\bibliography{IEEEabrv,bibliography}
