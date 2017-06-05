
---
title: Graphics Notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \bibliographystyle{IEEEtran}
---
[//]: # Graphics.md
[//]: # Mac Radigan

## Phong Reflection Model

A commonly used model used for modelling reflectance is the Pong model (eqation ~\eqref{eq:phong}) \cite{WikiPhong}.  We refer to this model for its compromise in simplicity and realism, but most importantly for the ease and efficiency of implementation on a digital computer using hardware accellated graphics.  The Phong model provides the reflection intensity $I_p$ as a function of the cofficients for the reflection properties of the material ($\alpha_s$ specular, $\alpha_d$ diffuse, $\alpha_a$ ambient, and $\alpha_0$ shininess), lighing properties ($i_s$ specular, $i_d$ diffuse, and $i_a$ ambient), the vector direction of the light source, $\hat{l}$, vector direction of the surface to observer, $\hat{v}$, and the surface normal, $\hat{n}$, from $k$ lighting sources.

\begin{equation}
%\tag{Phone Reflection Model}
I_p = k_{a}i_{a}+\sum_{k\in sources}\left[ \alpha_{d}\left(\hat{l_{k}}\cdot\hat{n}\right)i_{k,d} + \alpha_{s}\left(\left(2\left(\hat{l_{k}}\cdot\hat{n}\right)\hat{n}-\hat{l}\right)^{\alpha_0}i_{k,s} \right) \right]
\label{eq:phong}
\end{equation}

\bibliography{IEEEabrv,bibliography}
