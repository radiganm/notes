{% include 'header.md' %}

\captionsetup{labelformat=empty}
\captionsetup{font=small}

# Preliminaries

## Context of Discussion

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.matlab .numberLines}
{% include 'src/parameters.m' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Even and Odd Functions

### Definition of Even and Odd Functions

even function:
\begin{equation}
\begin{split}
f\left(x\right) &= f\left(-x\right)
\end{split}
\end{equation}

odd function:
\begin{equation}
\begin{split}
f\left(-x\right) &= -f\left(x\right)
\end{split}
\end{equation}

### Trigonometric Symmetries

\begin{equation}
\begin{split}
cos\left(x\right) &= cos\left(-x\right)
\end{split}
\end{equation}

\begin{equation}
\begin{split}
sin\left(-x\right) &= -sin\left(x\right)
\end{split}
\end{equation}

## Inner Products

conjugate symmetry
\begin{equation}
\begin{split}
\langle \cdot , \cdot \rangle \colon \mathbb{V} \times \mathbb{V} \mapsto \mathbb{F}
\end{split}
\end{equation}

$x,y,z \in \mathbb{V}$ and $\alpha \in \mathbb{F}$

conjugate symmetry
\begin{equation}
\begin{split}
\langle x , y \rangle 
&= \overline{\langle y , x \rangle}
\end{split}
\end{equation}

linearity
\begin{equation}
\begin{split}
\langle \alpha x , y \rangle &= \alpha \langle x , y \rangle \\
\langle x + y , z \rangle &= \langle x , z \rangle + \langle y , z \rangle
\end{split}
\end{equation}

positive-definateness
\begin{equation}
\begin{split}
\langle x , x \rangle \geq 0 \\
\langle x , x \rangle = 0 \leftrightarrow x = 0 \\
\end{split}
\end{equation}

### Inner Product Defined

For the space of points in $\mathbb{R}^n$, the inner product is defined as
\begin{equation}
\begin{split}
\left\langle \begin{bmatrix} x_1 \\ \vdots \\ x_n \end{bmatrix},\begin{bmatrix} y_1 \\ \vdots \\ y_n \end{bmatrix} \right\rangle &\triangleq x^\text{T} y \\
&= \sum_{k=1}^n x_k y_k \\
&= x_1 y_1 + \cdots + x_n y_n
\end{split}
\end{equation}

For the space of continuous complex functions on the interval $\left[a,b\right]$, i.e. $\mathbb{C}\left[a,b\right]$, the inner product is defined as
\begin{equation}
\begin{split}
\langle f , g \rangle \triangleq \int_a^b f\left(t\right) \overline{g\left(t\right)} dt
\end{split}
\end{equation}

### Properties of Inner Products

\begin{equation}
\begin{split}
\langle x , x \rangle 
&= \overline{\langle x , x \rangle}
\end{split}
\end{equation}

\begin{equation}
\begin{split}
\langle x , -x \rangle
&= -1 \langle x , x \rangle \\
&= \overline{-1} \langle x , x \rangle \\
&= \langle x , -x \rangle
\end{split}
\end{equation}

## Trigonomic Identities

### Angle Sum and Differences

\begin{equation}
\begin{split}
\sin\left(\alpha\pm\beta\right) &= \sin\alpha \cos\beta \pm \cos\alpha\sin\beta \\
\cos\left(\alpha\pm\beta\right) &= \cos\alpha \cos\beta \mp \sin\alpha\sin\beta \\
\end{split}
\end{equation}

### Identities Involving Complex Exponentials

Euler's formula:
\begin{equation}
\begin{split}
e^{ix} &= \cos x + i \sin x
\end{split}
\end{equation}

Written in terms of cosine and sine:
\begin{equation}
\begin{split}
\cos x &= \frac{e^{ix} + e^{-ix}}{2} \\
\sin x &= \frac{e^{ix} - e^{-ix}}{2i} \\
\end{split}
\end{equation}

## Fourier Transform

### Fourier Transform Defined

forward transform:
\begin{equation*}
\begin{split}
\mathbb{F}\{s\left(t\right)\} = S\left(f\right) \triangleq \int_{-\infty}^{+\infty} s\left(t\right) e^{-2 \pi i f t} dt
\end{split}
\end{equation*}

inverse transform:
\begin{equation*}
\begin{split}
\mathbb{F}^{-1}\{S\left(f\right)\} = s\left(t\right) \triangleq \int_{-\infty}^{+\infty} S\left(f\right) e^{2 \pi i t f} df
\end{split}
\end{equation*}

## Fourier Transform as the Superposition of Inner Products

## Fourier Analysis of a Single Frequency Component

### Fourier Transform of Analytic Signals, Single Frequency

\begin{equation*}
\begin{split}
\mathbb{F}\{e^{2\pi i f_k t + \phi_k}\} 
&= \int_{-\infty}^{+\infty} e^{2\pi i f_k t + \phi_k} e^{-2 \pi i f t} dt \\
&= \int_{-\infty}^{+\infty} e^{2\pi i \left( f_k - f \right) t} e^\phi_k dt \\
&= 2\pi e^{-i\phi_k}\delta\left(f - f_k\right)
\end{split}
\end{equation*}

### Fourier Transform of Real Signals, Single Frequency

\begin{equation*}
\begin{split}
\mathbb{F}\{\mathbb{RE}\{e^{2\pi i f_k t + \phi_k}\}\}
&= \mathbb{F}\{\mathbb{RE}\{ \cos\left(2\pi i f_k t + \phi_k\right) + i\sin\left(2\pi i f_k t + \phi_k\right) \}\} \\
&= \mathbb{F}\{\cos\left(2\pi i f_k t + \phi_k\right) \} \\
&= \mathbb{F}\{ \frac{ e^{2\pi i f_k t + \phi_k} + e^{-2\pi i f_k t + \phi_k} }{2} \} \\
&= \frac{1}{2} \left[ 
  \int_{-\infty}^{+\infty} e^{2\pi i f_k t + \phi_k} e^{-2 \pi i f t} dt 
  +
  \int_{-\infty}^{+\infty} e^{-2\pi i f_k t + \phi_k} e^{-2 \pi i f t} dt 
\right] \\
&= \frac{1}{2} \left[ 
  \int_{-\infty}^{+\infty} e^{2\pi i \left( f_k - f \right) t} e^\phi_k dt
  +
  \int_{-\infty}^{+\infty} e^{2\pi i \left( -f_k - f \right) t} e^\phi_k dt
\right] \\
&= 2\pi \left[ e^{-i\phi_k} \delta\left(f + f_k\right) + e^{i\phi_k} \delta\left(f - f_k\right) \right]
\end{split}
\end{equation*}

![Single Tone (complex signal, positive frequency)](./figures/fft_tone_pos_cplx.png "Single Tone (complex, positive)"){width=120%}
![Single Tone (complex signal, negative frequency)](./figures/fft_tone_neg_cplx.png "Single Tone (complex, negative)"){width=120%}

![Fourier Transform of a Single Tone (complex signal, positive frequency)](./figures/fft_tone_fft_pos_cplx.png "Fourier Transform of a Single Tone (complex, positive)"){width=120%}
![Fourier Transform of a Single Tone (complex signal, negative frequency)](./figures/fft_tone_fft_neg_cplx.png "Fourier Transform of a Single Tone (complex, negative)"){width=120%}

![Spectrum of a Single Tone (complex signal, positive frequency)](./figures/fft_tone_spectrum_pos_cplx.png "Spectrum of a Single Tone (complex, positive)"){width=120%}
![Spectrum of a Single Tone (complex signal, negative frequency)](./figures/fft_tone_spectrum_neg_cplx.png "Spectrum of a Single Tone (complex, negative)"){width=120%}


![Single Tone (real signal, positive frequency)](./figures/fft_tone_pos_real.png "Single Tone (real, positive)"){width=120%}
![Single Tone (real signal, negative frequency)](./figures/fft_tone_neg_real.png "Single Tone (real, negative)"){width=120%}

![Fourier Transform of a Single Tone (real signal, positive frequency)](./figures/fft_tone_fft_pos_real.png "Fourier Transform of a Single Tone (real, positive)"){width=120%}
![Fourier Transform of a Single Tone (real signal, negative frequency)](./figures/fft_tone_fft_neg_real.png "Fourier Transform of a Single Tone (real, negative)"){width=120%}

![Spectrum of a Single Tone (real signal, positive frequency)](./figures/fft_tone_spectrum_pos_real.png "Spectrum of a Single Tone (real, positive)"){width=120%}
![Spectrum of a Single Tone (real signal, negative frequency)](./figures/fft_tone_spectrum_neg_real.png "Spectrum of a Single Tone (real, negative)"){width=120%}


![Single Tone (imaginary signal, positive frequency)](./figures/fft_tone_pos_imag.png "Single Tone (imaginary, positive)"){width=120%}
![Single Tone (imaginary signal, negative frequency)](./figures/fft_tone_neg_imag.png "Single Tone (imaginary, negative)"){width=120%}

![Fourier Transform of a Single Tone (imaginary signal, positive frequency)](./figures/fft_tone_fft_pos_imag.png "Fourier Transform of a Single Tone (imaginary, positive)"){width=120%}
![Fourier Transform of a Single Tone (imaginary signal, negative frequency)](./figures/fft_tone_fft_neg_imag.png "Fourier Transform of a Single Tone (imaginary, negative)"){width=120%}

![Spectrum of a Single Tone (imaginary signal, positive frequency)](./figures/fft_tone_spectrum_pos_imag.png "Spectrum of a Single Tone (imaginary, positive)"){width=120%}
![Spectrum of a Single Tone (imaginary signal, negative frequency)](./figures/fft_tone_spectrum_neg_imag.png "Spectrum of a Single Tone (imaginary, negative)"){width=120%}



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.matlab .numberLines}
{% include 'src/fft_tone.m' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Hilbert Transform

### Hilbert Transform Defined

\begin{equation*}
\begin{split}
H\{g\left(t\right)\} 
&= g\left(t\right) \\
&= \frac{1}{\pi}\int_{-\infty}^{+\infty}\frac{g\left(\tau\right)}{t-\tau} d\tau \\
&= \frac{1}{\pi}\int_{-\infty}^{+\infty}\frac{g\left(t-\tau\right)}{\tau} d\tau
\end{split}
\end{equation*}

### Hilbert Tranfsorm Defined in Terms of the Fourier Transform


# Receiver Antenna

\begin{equation}
\begin{split}
x_{+}\left(t\right) 
&= \cos\left( 2 \pi f_k + \phi_k \right)
\end{split}
\end{equation}

\begin{equation}
\begin{split}
x_{-}\left(t\right) 
&= \cos\left( -2 \pi f_k + \phi_k \right)
\end{split}
\end{equation}

![Signal at Antenna (positive frequency)](./figures/rcv_antenna_pos.png "Signal at Antenna (positive)"){width=120%}
![Signal at Antenna (negative frequency)](./figures/rcv_antenna_neg.png "Signal at Antenna (negative)"){width=120%}

![Spectrum at Antenna (positive frequency)](./figures/rcv_antenna_freq_pos.png "Spectrum at Antenna (positive)"){width=120%}
![Spectrum at Antenna (negative frequency)](./figures/rcv_antenna_freq_neg.png "Spectrum at Antenna (negative)"){width=120%}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.matlab .numberLines}
{% include 'src/rcv_antenna.m' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Analytic Signal

\begin{equation}
\begin{split}
x_{+}\left(t\right) 
&= e^{+i 2 \pi f_k t+ \phi_k } \\
&= \cos\left( 2 \pi f_k + \phi_k \right) +i \sin\left( 2 \pi f_k + \phi_k \right)
\end{split}
\end{equation}

\begin{equation}
\begin{split}
x_{-}\left(t\right) 
&= e^{-i 2 \pi f_k t+ \phi_k } \\
&= \cos\left( -2 \pi f_k + \phi_k \right) +i \sin\left( -2 \pi f_k + \phi_k \right) \\
&= \cos\left( 2 \pi f_k + \phi_k \right) -i \sin\left( 2 \pi f_k + \phi_k \right)
\end{split}
\end{equation}

![Analytic Signal (positive frequency)](./figures/rcv_analytic_pos.png "Analytic Signal (positive)"){width=120%}
![Analytic Signal (negative frequency)](./figures/rcv_analytic_neg.png "Analytic Signal (negative)"){width=120%}

![Spectrum of Analytic Signal (positive frequency)](./figures/rcv_analytic_freq_pos.png "Spectrum of Analytic Signal (positive)"){width=120%}
![Spectrum of Analytic Signal (negative frequency)](./figures/rcv_analytic_freq_neg.png "Spectrum of Analytic Signal (negative)"){width=120%}


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.matlab .numberLines}
{% include 'src/rcv_analytic.m' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Quadrature Sampling

~~~~~ {.ditaa .no-separation}
                                                                   
                  cos(wt)                                          
   +-----+          |                                              
   | Ant |          v                                              
   +-----+         /-\    +---+   +---+  +---+                     
      |        +-->|x|--->|LPF|-->|ADC|->|Amp|----+                
      v        |   \-/    +---+   +---+  +---+    |                
   +-----+x(wt)|                                  v                
   | LNA |-----+                                +---+  +---+       
   +-----+     |                                |DDC|->|DSP|       
               |                                +---+  +---+       
               |                                  ^                
               |   /-\    +---+   +---+  +---+    |                
               +-->|x|--->|LPF|-->|ADC|->|Amp|----+                
                   \-/    +---+   +---+  +---+                     
                    ^                                              
                    |                                              
                  sin(wt)                                          
                                                                   
~~~~~

![Signal at DDC (positive frequency)](./figures/rcv_ddc_pos.png "Signal at DDC (positive)"){width=120%}
![Signal at DDC (negative frequency)](./figures/rcv_ddc_neg.png "Signal at DDC (negative)"){width=120%}

![Spectrum at DDC (positive frequency)](./figures/rcv_ddc_freq_pos.png "Spectrum at DDC (positive)"){width=120%}
![Spectrum at DDC (negative frequency)](./figures/rcv_ddc_freq_neg.png "Spectrum at DDC (negative)"){width=120%}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.matlab .numberLines}
{% include 'src/rcv_ddc.m' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Demo 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.matlab .numberLines}
{% include 'src/run_demo.m' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

{# *EOF* #}
