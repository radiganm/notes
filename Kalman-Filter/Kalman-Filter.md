
---
title: Kalman Filter notes
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \bibliographystyle{IEEEtran}
---
[//]: # Kalman-Filter.md
[//]: # Mac Radigan

## Kalman Filter

\label{sec:kalmanFilter}

\subsection{Operation}
\label{sec:operation}

The Kalman filter uses measurements from previous observations to feed a state space model of a target's behavior.  Given statistical knowlege of the process and measurement noise, a mean square error filtered estimate is taken of the expected and current measurement.  This "smoothed" result is taken as correction to the current measurement.  It depends on a linear system model, and assumes the process and measurement noise are Gaussian.  One of the most significant advantages of the Kalman filter is that it provides significant performance with little computational and memory requirements\cite{Ram20}.  The linearity of the system lends itself well to analysis and performance tuning.

The system model is described by a state space equation, $\mathbf{F}_{n}$.  At the $n$th observation, the system takes state $\mathbf{F}_{n}$.  The model assumes the characteristics of the target motion can be described by the linear distribution matrix, $\mathbf{G}_{n}$.  The process is acted upon by the input disturbance vector, $\mathbf{W}_{n}$, which is assumed to be zero-mean Gaussian with covariance $\mathbf{Q}$.

\begin{equation}
\mathbf{X}_{n+1} = \mathbf{F}_{n}\mathbf{X}_{n} + \mathbf{G}_{n}\mathbf{W}_{n}
\label{eq:ProcessModel}
\end{equation}

The measurement model uses the current measurement from the process model (in this case we are interested in position, so $\mathbf{H} = \begin{bmatrix}1&0&\cdots&0\end{bmatrix}$), corrupted by observation noise, $\mathbf{V}_{k}$, also zero-mean Gaussian with covariance $\mathbf{R}$.

\begin{equation}
\mathbf{Z}_{n} = \mathbf{H}\mathbf{X}_{n} + \mathbf{V}_{n}
\label{eq:Measurement}
\end{equation}

The algorithm for applying the filter is a two-stage process.  First, an estimate $\mathbf{\tilde{X}}$ is made of the target's position from the state-space equation based on the prior observation as shown in Equation ~\eqref{eq:Predict}.  The covariance matrix $\mathbf{\tilde{P}}$ in Equation ~\eqref{eq:PredictCovariance} is computed based on the process variance.  For initialization purposes, the actual measurement and process variance $\mathbf{Z}$ and $\mathbf{Q}$ respectively may be used to initialize $\mathbf{\tilde{X}}$ and $\mathbf{\tilde{P}}$.

\begin{equation}
\mathbf{\tilde{X}}_{n} = \mathbf{F}\mathbf{\tilde{X}}_{n-1}
\label{eq:Predict}
\end{equation}

\begin{equation}
\mathbf{\tilde{P}}_{n} = \mathbf{F}\mathbf{\hat{P}}_{n}\mathbf{F}^{T} + \mathbf{G}\mathbf{Q}\mathbf{G}^{T}
\label{eq:PredictCovariance}
\end{equation}

The second stage of the algorithm produces the filtered estimate, $\mathbf{\hat{X}}$ resulting in minimized MSE, by applying a gain factor $\mathbf{K}$ (Equation ~\ref{eq:KalmanGain}) to the difference between the measurement and its estimate as an adjustment factor to the original state estimate.  The Kalman-filtered estimate is given by Equation ~\eqref{eq:Correct}.  The filtered state error covariance matrix $\mathbf{\tilde{P}}_{n}$ is then updated (Equation ~\eqref{eq:CorrectCovariance}) for the next estimate iteration \cite{Yue10}.

\begin{equation}
\mathbf{K}_{n} = \mathbf{\tilde{P}_{n}}\mathbf{\tilde{H}^T}\left(\mathbf{H}\mathbf{\tilde{P}_{n}}\mathbf{H^T} + \mathbf{R}\right)^{-1}
\label{eq:KalmanGain}
\end{equation}

\begin{equation}
\mathbf{\hat{X}}_{n} = \mathbf{\tilde{X}_{n}} + \mathbf{K_{n}}\left(\mathbf{Z_{n}}-\mathbf{H\tilde{X}_{n}}\right)
\label{eq:Correct}
\end{equation}

\begin{equation}
\mathbf{\hat{P}}_{n} = \left(\mathbf{I} - \mathbf{K_{n}}\mathbf{H}\right)\mathbf{\tilde{P}_{n}}
\label{eq:CorrectCovariance}
\end{equation}

The result is a smoothed estimate of the original measurement.  If the assumptions about the white noise characteristics of the measurent noise hold true, then the Kalman filter is minimum mean square error between the measurement and expected value given the process model \cite{Ram20}.

\subsection{Tracking Under Constant Velocity Disturbances}
\label{sec:constantVelocity}

One of the advantages of the Kalman filter is that it can be apply to any number of independent dimensions \cite{Bro89}.  This lends itself well to a simple tracking simulation using motion video to track a two-dimensional target.  Here the $X$ and $Y$ dimensions can be tracked and filtered independently, using applying the matrices given in Equations ~\eqref{eq:constVState}-~\eqref{eq:constVMeasurementNoise} below \cite{Yue10}.  Here it is assumed that the target velocity remains constant between successive scans, taken at time intervals $T$, where $F$ is the state transition matrix, $H$ is the observation matrix, and $Q$ is the measurement covariance.

\begin{equation}
\mathbf{X}_{n} = \left[ \begin{array}{cccc}
x_{n} & \dot{x}_{n} & y_{n} & \dot{y}_{n} \\
\end{array} \right]^{T}
\label{eq:constVState}
\end{equation}

\begin{equation}
\mathbf{F} = \left[ \begin{array}{cccc}
1 & T & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & T \\
0 & 0 & 0 & 1 \\
\end{array} \right]
\label{eq:constVTransition}
\end{equation}

\begin{equation}
\mathbf{H} = \left[ \begin{array}{cccc}
1 & 0 & 0 & 0 \\
0 & 0 & 1 & 0 \\
\end{array} \right]
\label{eq:constVObservation}
\end{equation}

\begin{equation}
\mathbf{Q} = \left[ \begin{array}{cc}
\sigma^2_{x} & 0 \\
0 & \sigma^2_{y} \\
\end{array} \right]
\label{eq:constVMeasurementNoise}
\end{equation}

\subsection{Tracking Under Constant Acceleration Disturbances}
\label{sec:constantAcceleration}

The Kalman filter can be applied to constant accelerations by extending the state (Equation ~\eqref{eq:constAState}) and state transition matrix (Equation ~\eqref{eq:constATransition}) to include an acceleration term.  Again, it is assumed that the input vector (acceleration) remains constant between successive scans.  In general, this filtering approach can be applied to any system which can be approximated through linearization.

\begin{equation}
\mathbf{X}_{n} = \left[ \begin{array}{cccccc}
x_{n} & \dot{x}_{n} & \ddot{x}_{n} & y_{n} & \dot{y}_{n} & \ddot{y}_{n} \\
\end{array} \right]^{T}
\label{eq:constAState}
\end{equation}

\begin{equation}
\mathbf{F} = \left[ \begin{array}{cccccc}
1 & T & \frac{T^2}{2} & 0 & 0 & 0 \\
0 & 1 & T & 0 & 0 & 0 \\
0 & 0 & 1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 & T & \frac{T^2}{2} \\
0 & 0 & 0 & 0 & 1 & T \\
0 & 0 & 0 & 0 & 0 & 1 \\
\end{array} \right]
\label{eq:constATransition}
\end{equation}

\begin{equation}
\mathbf{H} = \left[ \begin{array}{cccccc}
1 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 & 0 & 0 \\
\end{array} \right]
\label{eq:constAObservation}
\end{equation}

\subsection{Tracking a Maneuvering Target}
\label{sec:variableAcceleration}

A unique aproach to extending the Kalman filter beyond the previously discussed linear limitations is discussed by Yue in \cite{Yue10}.  The Kalman filter assumes constant disturbances between scans.  This assumption results in poor performance in tracking highly maneuverable targets.  Yue describes a Kalman filter whose state transition matrix provides a coupling between the $x$ and $y$ dimensions, in terms of a turn coefficient.  The turn coefficient, $\Omega$, described by Yue is positive for leftward turning argets, and negative for rightward turning targets.  The rate of the turn is captured by the magnitude of this coefficient.  The turn coefficient itself must be estimated, and used for the generation of the state transition matrix.  

The approach uses a target model in which both velocity and acceleration are treated as process noise.  The state matrix (Equation ~\eqref{eq:TurnState}), state transition matrix (Equation ~\eqref{eq:TurnState}) and the process matrix (Equation ~\eqref{eq:TurnProcess}) are given below \cite{Yue10}.

\begin{equation}
\mathbf{X}_{n} = \left[ \begin{array}{cccc}
x_{n} & \dot{x}_{n} & y_{n} & \dot{y}_{n} \\
\end{array} \right]^{T}
\label{eq:TurnState}
\end{equation}

\begin{equation}
\mathbf{F} = \left[ \begin{array}{cccc}
1 & \frac{sin(\Omega T)}{\Omega} & 0 & -\frac{1-cos(\Omega T)}{\Omega} \\
0 & cos(\Omega T) & 0 & -sin(\Omega T) \\
0 & \frac{1-cos(\Omega T)}{\Omega} & 1 & \frac{sin(\Omega T)}{\Omega} \\
0 & sin(\Omega T) & 0 & cos(\Omega T) \\
\end{array} \right]
\label{eq:TurnTransition}
\end{equation}

\begin{equation}
\mathbf{G} = \left[ \begin{array}{cc}
\frac{T^2}{2} & 0 \\
T & 0 \\
0 & \frac{T^2}{2} \\
0 & T \\
\end{array} \right]
\label{eq:TurnProcess}
\end{equation}

