
---
title: Quaternion Notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{amssymb}
 - \usepackage{mathrsfs}
 - \bibliographystyle{IEEEtran}
 - \usepackage[utf8]{inputenc}
 - \usepackage{accents}
---
[//]: # Quaternions.md
[//]: # Mac Radigan

\newcommand\undervec[1]{\underaccent{\vec}{#1}}

\newcommand{\norm}[1]{\left\lVert#1\right\rVert}

## Quaternions

### ordered list representation

$\mathbf{q} 
= \left[ \begin{array}{cccc}
q_x & q_y & q_z & q_0
\end{array} \right]
^{\intercal}$

### scalar part

$R\left(\mathbf{q}\right) = q_0$

### vector part

$I\left(\mathbf{q}\right) 
= \left[ \begin{array}{cccc}
q_x & q_y & q_z
\end{array} \right]
^{\intercal}$

### conjugate

$\mathbf{q}^{*}
= \left[ \begin{array}{cccc}
q_x & -q_y & -q_z & -q_0
\end{array} \right]
^{\intercal}$

### unit quaternion

$\norm{\mathbf{q}} = \sqrt{\mathbf{q}\mathbf{q}^{*}} = \sqrt{q_0^2 + q_x^2 + q_y^2 + q_z^2}$

### reciprocal

$\mathbf{q}^{-1} = \frac{\mathbf{q}^{*}}{\norm{\mathbf{q}}}$

### compact representation

$P\left(\mathbf{q}\right) 
= q_0 I\left(\mathbf{q}\right)
= \left[ \begin{array}{cccc}
q_0 q_x & q_0 q_y & q_0 q_z
\end{array} \right]
^{\intercal}
= \undervec{q}$

### complex matrix representation

$\mathbf{q}
= \left[ \begin{array}{cc}
q_0 + q_x & q_y + q_z \\
-q_y + q_z & q_0 - q_x \\
\end{array} \right]$

### real matrix representation

$\mathbf{q}
= \left[ \begin{array}{cccc}
q_0 & -q_x & -q_y & -q_z \\
q_x &  q_0 & -q_z &  q_y \\
q_y &  q_z &  q_x & -q_y \\
q_z & -q_y &  q_y &  q_x
\end{array} \right]$

### product

$\mathbf{p}\mathbf{q}
= \left[ \begin{array}{cccc}
p_0 q_x + p_0 q_y + p_0 q_z \\
p_0 q_0 - \undervec{p}\undervec{q}
\end{array} \right]
^{\intercal}$

### inverse

$qq^{-1} = q^{-1}q = \left[\begin{array}{cccc}0 & 0 & 0 & 1\end{array}\right]^{\intercal}$

$q^{-1} = \frac{q^{*}}{|q|^{2}}$ all non-zero cases

$q^{-1} = q^{*}$ for unit quaternions

### covariance

$C_{q} = \frac{1}{N-1}\Sigma_{i=1}^{N}\left[q_i - \hat{q}\right]\left[q_i - \hat{q}\right]^{\intercal}$

### axis-angle form

$q\left(\undervec{\hat{q}},\theta\right)
= \left[ \begin{array}{c}
q_x \\
q_y \\
q_z \\
q_0
\end{array} \right]
= \left[ \begin{array}{c}
\undervec{\hat{q}} sin \left( \frac{\theta}{2} \right) \\
cos \left( \frac{\theta}{2} \right)
\end{array} \right]$

### antipodal symmetry

$q\left(\hat{q},\theta + 2 \pi\right)
= \left[ \begin{array}{c}
\undervec{\hat{q}} sin \left( \pi + \frac{\theta}{2} \right) \\
cos \left( \pi + \frac{\theta}{2} \right)
\end{array} \right]
= \left[ \begin{array}{c}
-\hat{q} sin \left( \frac{\theta}{2} \right) \\
-cos \left( \frac{\theta}{2} \right)
\end{array} \right]$

### quaternion vector rotation

 rotate $\undervec{v}$ by unit quaterion $q$

 1. form quaternion $v$ from $\undervec{v}$ by setting

\begin{center}

$I\left(\mathbf{v}\right) = \undervec{v}$ and $R\left(\mathbf{v}\right) = 0$

$\undervec{v}
= \left[ \begin{array}{c}
v_x \\
v_y \\
v_z
\end{array} \right]
\rightarrow
\left[ \begin{array}{c}
v_x \\
v_y \\
v_z \\
0
\end{array} \right]$

\end{center}

 2. form quaternion product $w = qvq^{*}$

 3. find $\undervec{w} = I\left(w\right)$



