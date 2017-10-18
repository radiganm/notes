#!/usr/bin/octave -q
%% fft_tone.m
%%
%% Displays the time and frequency domain plot of a single tone.

  function fft_tone(fs, t, fc, A, fk, phi, f, tag)
    
    x = f(A*exp(1i*2*pi*fk*t + phi));

    T2   = abs(fk/fs/2/pi);

    %% Fast Fourier Transform
    N = 10 * 2^nextpow2(numel(x));
    x_f = fftshift(fft(x, N));
    if mod(N,2), k=-N/2:N/2-1; else k=-(N-1)/2:(N-1)/2; end
    T = N/fs;
    n_f = k/T;

    x_f      = fftshift(fft(x, N));
    x_f_max  = max(abs(x_f));
    xrange = sort( (2*fk*[-1 +1]) );

    %% frequency domain spectral plot
    ax = figure(201);
      title('Spectrum');
      subplot(2,1,1);
        plot(n_f, abs(x_f), ...
          'linewidth', 2, 'color', 'b');
        ylabel('Magnitude');
        xlabel('Frequency [Hz]');
        xlim(xrange);
        grid on;
        set(gca,'XTick',xrange(1):100:xrange(end));
        legend({'|F\{x(t)\}|'}, 'location', 'southwest', 'orientation', 'horizontal');
        set(gca, 'linewidth', 4, 'fontsize', 12)
      subplot(2,1,2);
        plot(n_f, angle(x_f), 'linewidth', 2, 'color', 'r');
        ylabel('Phase');
        xlabel('Frequency [Hz]');
        xlim(xrange);
        grid on;
        set(gca,'XTick',xrange(1):100:xrange(end));
        set(gca, 'linewidth', 4, 'fontsize', 12)
        legend({'<F\{x(t)\}'}, 'location', 'southwest', 'orientation', 'horizontal');
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_spectrum_%s.png', mfilename, tag));

    %% frequency domain I and Q plot
    ax = figure(203);
      title('Frequency Domain');
      subplot(2,1,1);
        plot(n_f, real(x_f), 'linewidth', 2, 'color', 'b');
        xlabel('Frequency [Hz]');
        ylabel('Real Part');
        xlim(xrange);
        grid on;
        set(gca, 'linewidth', 4, 'fontsize', 12)
        legend({ 'RE\{F\{x(t)\}\}' }, 'location', 'southwest', 'orientation', 'horizontal');
      subplot(2,1,2);
        xlabel('Frequency [Hz]');
        plot(n_f, imag(x_f), 'linewidth', 2, 'color', 'r');
        ylabel('Quadrature Part');
        xlim(xrange);
        grid on;
        set(gca, 'linewidth', 4, 'fontsize', 12)
        legend({ 'IM\{F\{x(t)\}\}' }, 'location', 'southwest', 'orientation', 'horizontal');
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_fft_%s.png', mfilename, tag));

    %% time domain plot
    ax = figure(203);
      title('Time Domain');
      subplot(1,1,1);
        plot(t, real(x), 'linewidth', 2, 'color', 'b');
        xlabel('Time [s]');
        hold on;
        plot(t, imag(x), 'linewidth', 2, 'color', 'r');
        ylabel('Signal Amplitude');
        xlabel('Time [s]');
        grid on;
        xlim([t(1) T2]);
        set(gca, 'linewidth', 4, 'fontsize', 12)
        legend({ 'RE\{x(t)\}','IM\{x(t)\}'}, 'location', 'southwest', 'orientation', 'horizontal');
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_%s.png', mfilename, tag));

  end % fft_tone

 %o = parameters();
 %fft_tone(...);

%% *EOF*
