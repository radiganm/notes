---
title: Digial Image Warping notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
---
[//]: # Digital-Image-Warping.md
[//]: # Mac Radigan

## Polynomial Transformations

Inferring polynomial coefficients with a pseudoinverse solution using a second-degree approximation

$$
\left[ {\begin{array}{c} u_1 \\ u_2 \\ u_3 \\ \cdots \\ \cdots \\ u_M \end{array} }\right]
=
\left[ {\begin{array}{cccccc} 
  1 & x_1 & y_1   & x_1 y_1   & x_1^2   & y_1^2  \\
  1 & x_2 & y_1   & x_2 y_2   & x_2^2   & y_2^2  \\
  1 & x_3 & y_1   & x_3 y_3   & x_3^2   & y_3^2  \\
    &     &       & \cdots    &         &        \\
    &     &       & \cdots    &         &        \\
  1 & x_M & y_M   & x_M y_M   & x_M^2   & y_M^2  \\
\end{array} }\right]
=
\left[ {\begin{array}{c} a_{00} \\ a_{10} \\ a_{01} \\ a_{11} \\ a_{20} \\ a_{02} \end{array} }\right]
$$

and

$$
\left[ {\begin{array}{c} v_1 \\ v_2 \\ v_3 \\ \cdots \\ \cdots \\ v_M \end{array} }\right]
=
\left[ {\begin{array}{cccccc} 
  1 & x_1 & y_1   & x_1 y_1   & x_1^2   & y_1^2  \\
  1 & x_2 & y_1   & x_2 y_2   & x_2^2   & y_2^2  \\
  1 & x_3 & y_1   & x_3 y_3   & x_3^2   & y_3^2  \\
    &     &       & \cdots    &         &        \\
    &     &       & \cdots    &         &        \\
  1 & x_M & y_M   & x_M y_M   & x_M^2   & y_M^2  \\
\end{array} }\right]
=
\left[ {\begin{array}{c} a_{00} \\ a_{10} \\ a_{01} \\ a_{11} \\ a_{20} \\ a_{02} \end{array} }\right]
$$

Written in matrix form

$U = WA$

$V = WB$

This gives us

$W^{\intercal}U = W^{\intercal}WA$

Expanding the notation

$$
\left[ {\begin{array}{c} \sum u \\ \sum xu \\ \sum yu \\ \sum xyu \\ \sum x^2 u \\ \sum y^2 u \end{array} }\right]
=
\left[ {\begin{array}{cccccc} 
  M        & \sum x     & \sum y     & \sum xy      & \sum x^2     & \sum y^2     \\
  \sum x   & \sum x^2   & \sum xy    & \sum x^2 y   & \sum x^3     & \sum x y^2   \\
  \sum y   & \sum x y   & \sum y^2   & \sum x y^2   & \sum x^2 y   & \sum y^3     \\
  \sum xy  & \sum x^2 y & \sum x y^2 & \sum x^2 y^2 & \sum x^3 y   & \sum x y^3   \\
  \sum x^2 & \sum x^3   & \sum x^2 y & \sum x^3 y   & \sum x^4     & \sum x^2 y^2 \\
  \sum y^2 & \sum x y^2 & \sum y^3   & \sum x y^3   & \sum x^2 y^2 & \sum y^4     \\
\end{array} }\right]
=
\left[ {\begin{array}{c} a_{00} \\ a_{10} \\ a_{01} \\ a_{11} \\ a_{20} \\ a_{02} \end{array} }\right]
$$

Solving for A and B, we have

$A = \left(W^{\intercal}W\right)^{-1}W^{\intercal}U$

$B = \left(W^{\intercal}W\right)^{-1}W^{\intercal}V$
