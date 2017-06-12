
---
title: Particle Filter notes
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
[//]: # Particle-Filter.md
[//]: # Mac Radigan

## Particle Filter

The Kalman filter is limited by the need to be able to characterize the target under surveillance using a linearized model.  Particle filters have more general application to targets with non-linear motion behavior, as the estimation can be produced adaptively by maintaining an internal set of probablility distribution weights\cite{Aru02}.

The general idea is use an estimate $x$ of the prior measurement $z$ probability density function (PDF) to provide an estimate for updating the current measurement, shown in Equation ~\eqref{eq:PriorPdf} \cite{Aru02}.  

\begin{equation}
p\left(x_{n}|z_{1:n-1}\right) = \int p\left(x_{n}|x_{n-1}\right)p\left(x_{k-1}|z_{1:n-1}\right)\mathrm{d}x_{n-1}
\label{eq:PriorPdf}
\end{equation}

The state space equation itself may be used to approximate the posterior PDF by sampling the state-space equation.  Arulampalam shows the approximation in as weighting terms defined as conditional probability of a state given prior measurements $w^{i}_{n-1|n-1}\equiv Pr(\mathbf{x}_{n-1}=\mathbf{x^{i}_{n-1|z_{1:n-1}}})$.  The prior PDF approximated from the state space equation is shown in Equation ~\eqref{eq:GridPrior} \cite{Aru02}.

\begin{equation}
p(\mathbf{x}_{n-1}|\mathbf{z}_{1:n-1}) \approx \sum^{\#Particles}_{i=1} \mathbf{w}^{i}_{n-1|n-1} \delta(\mathbf{x}_{n-1}-\mathbf{x}^{i}_{n-1})
\label{eq:GridPrior}
\end{equation}

This approximation may then be used for prediction (Equation ~\eqref{eq:GridPredict}) and update (Equation ~\eqref{eq:GridUpdate}) of the current measurements based on the prior PDF \cite{Aru02}.

\begin{equation}
p(\mathbf{x}_{n}|\mathbf{z}_{1:n-1}) \approx \sum^{\#Particles}_{i=1} \mathbf{w}^{i}_{n|n-1} \delta(\mathbf{x}_{n}-\mathbf{x}^{i}_{n})
\label{eq:GridPredict}
\end{equation}

\begin{equation}
p(\mathbf{x}_{n}|\mathbf{z}_{1:n}) \approx \sum^{\#Particles}_{i=1} \mathbf{w}^{i}_{n|n} \delta(\mathbf{x}_{n}-\mathbf{x}^{i}_{n})
\label{eq:GridUpdate}
\end{equation}

\subsection{Operation}
\label{sec:particleOperation}

The particle filter algorithm given in (Equation ~\eqref{alg:ParticleFilter}) may be used as a measurement correction \cite{Piw11} based on the grid PDF approximations given in Equations ~\eqref{eq:GridPrior}-~\eqref{eq:GridUpdate}.  The algorithm begins with assigning uniform particle weights.  During each iteration, the weights of the prior PDF if updated based on the current measurement, conditioned on the sampled state space.  These weights are then normalized, and used construct and estimate by integrating the prediction PDF over the current state.  The state equation is then used to construct the prediction for the next iteration.

\begin{algorithm}
\caption{Particle Fitler Algorithm}
\label{alg:ParticleFilter}
\begin{algorithmic}
\FOR{n=1:N}
  \FOR{i=1:\#Particles}
    \STATE{ - Assign initial particles: $\mathbf{x}^{\left(n\right)}_{0}$ }

    \STATE{ - Assign initial normalized weights: $\mathbf{w}^{\left(n\right)}_{0} = \frac{1}{N}$ }
  \ENDFOR
  \FOR{i=1:\#Particles}
    \STATE{ - Assign weights: $\mathbf{w^{\left(i\right)}_{n}} = \frac{p(\mathbf{z^{\left(i\right)}_{n}}|\mathbf{x^{\left(i\right)}_{n}})}{p(\mathbf{z}^{\left(i\right)}_{n})}$ }
  \ENDFOR
  \FOR{i=1:\#Particles}
    \STATE{ - Normalize weights: $\mathbf{w}^{\left(i\right)}_{n} = \frac{\mathbf{w}^{\left(i\right)}_{n}}{\sum^{\#Particles}_{l=1}\mathbf{w^{\left(i\right)}_{l}}} $ }
  \ENDFOR
  \STATE{ - Construct estimate: $\mathbf{\hat{x}}_{n} = \sum_{i=1}^{\#Particles} \mathbf{w}^{\left(i\right)}_{n} \mathbf{x}^{\left(i\right)}_{n}$ }
  \FOR{i=1:\#Particles}
    \STATE{ - Advance prediction using state model: $\mathbf{x}^{\left(i\right)}_{n+1} = \mathbf{F}\mathbf{w}^{\left(i\right)}_{n}\mathbf{x}^{\left(i\right)}_{n}$ }
  \ENDFOR
\ENDFOR
\end{algorithmic}
\end{algorithm}

\subsection{Resampling}
\label{sec:particleResampling}

One of the drawbacks of this algorithm is known as "degeneracy", which is a tendency for the a single particle of the posterior PDF to accumulate the majority of the density, rendering all other particle weights negligible.  Proper choice of importance densitiy and resampling are two techniques used to combat the degeneracy problem \cite{Aru02}.

The degeneracy is commonly measured using a metric known as the effective sample size , given below in Equation ~\eqref{eq:EffectiveSampleSize}.  Small $N_{eff}$ is an indicator of degeneracy \cite{Aru02}.

\begin{equation}
\bar{N}_{eff} = \frac{1}{\sum^{\#Particles}_{i=1} \left(\mathbf{w}^{i}_{n}\right)^2}
\label{eq:EffectiveSampleSize}
\end{equation}

A resampling method known as Sequence Importance Resampling (SIR) may be used to avoid the degeneration issue \cite{Wik11}.  A typically employed resampling algorithm for the particle filter is given below in Algortihm \ref{alg:ParticleFilterResampling} \cite{Aru02}.

\begin{algorithm}
\caption{Particle Fitler Resampling Algorithm}
\label{alg:ParticleFilterResampling}
\begin{algorithmic}
\STATE{ - Build CDF: }
\STATE{ $P_{1}:=0$ }
\FOR{ $i=2:\#Particles$ }
  \STATE{ $P_{i}:=P_{i-1} + \mathbf{w^{i}_{n}}$ }
\ENDFOR
\STATE{ - Create a uniform PDF: $u\sim\mathbf{U}\left(0,\frac{1}{\#Particles}\right)$ }
\FOR{ $j=1:\#Particles$ }
  \STATE{ $u_{j} = u_{\frac{j}{\#Partilces}}$ }
  \WHILE{ $u_{j}>c_{i}$ }
    \STATE{ $i = i+1$ }
  \ENDWHILE
  \STATE{ $\mathbf{x}^{j}_{n} = \mathbf{x}^{i}_{n}$ }
  \STATE{ $\mathbf{w}^{j}_{n} = \frac{1}{\#Particles}$ }
  \STATE{ $\mathbf{i}^{j} = i$ }
\ENDFOR
\end{algorithmic}
\end{algorithm}

