
---
title: Time-Frequency Notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \usepackage{mathtools}
 - \DeclarePairedDelimiter\abs{\lvert}{\rvert}
 - \DeclarePairedDelimiter\norm{\lVert}{\rVert}
---
[//]: # Time-Frequency.md
[//]: # Mac Radigan

## Fourier Expansion

\begin{equation*}
s\left(t\right) = \frac{1}{\sqrt{2\pi}}\int S\left(\omega\right)e^{j\omega t}d\omega
\end{equation*}

\begin{equation*}
S\left(t\right) = \frac{1}{\sqrt{2\pi}}\int s\left(t\right)e^{-j\omega t}dt
\end{equation*}

## Mean Frequency

\begin{equation*}
\begin{split}
\langle\omega\rangle &= \int\omega\abs{S\left(\omega\right)}^2 d\omega \\
                     &= \int s^{*}\left(t\right)\frac{1}{j}\frac{d}{dt}s\left(t\right)dt
\end{split}
\end{equation*}

## Mean Square Frequency
\begin{equation*}
\begin{split}
\langle\omega^2\rangle &= \int\omega^2\abs{S\left(\omega\right)}^2 d\omega \\
                       &= \int s^{*}\left(t\right)\left(\frac{1}{j}\frac{d}{dt}\right)^2 s\left(t\right)dt \\
                       &= \int \abs{\frac{d}{dt} s\left(t\right)}^2 dt
\end{split}
\end{equation*}

## Root Mean Square Bandwidth
\begin{equation*}
\begin{split}
B^2 = \langle\sigma_\omega^2\rangle &= \int\left(\omega - \langle\omega\rangle\right)^2|S\left(\omega\right)|^2 d\omega \\
                       &= \int s^{*}\left(t\right)\left(\frac{1}{j}\frac{d}{dt} - \langle\omega\rangle\right)^2 s\left(t\right)dt \\
                       &= \int \abs{\left(\frac{1}{j}\frac{d}{dt} - \langle\omega\rangle\right) s\left(t\right)}^2 dt
\end{split}
\end{equation*}

## Ambiguity Function
\begin{equation*}
A\left(\tau,f\right) = \int\limits_0^T s_1\left(t\right)s_2^{*}\left(t+\tau\right)e^{-j2\pi ft}dt
\end{equation*}

## Analytic Signal
\begin{equation*}
s_a\left(t\right) = \frac{2}{\sqrt{2\pi}} \int\limits_0^\infty S_{RE}\left(\omega\right)e^{j\omega t}d\omega
\end{equation*}

## Uncertainty

\begin{equation*}
T^2 = \sigma_t^2 = \int\left(t - \langle t \rangle\right)^2 \abs{s\left(s\right)}^2 dt
\end{equation*}

\begin{equation*}
B^2 = \sigma_\omega^2 = \int\left(\omega - \langle \omega \rangle\right)^2 \abs{S\left(\omega\right)}^2 d\omega
\end{equation*}

\begin{equation*}
TB \ge \frac{1}{2}
\end{equation*}

\begin{equation*}
\sigma_t\sigma_\omega \ge \frac{1}{2}\sqrt{1+4 Cov_{t\omega}^2}
\end{equation*}
