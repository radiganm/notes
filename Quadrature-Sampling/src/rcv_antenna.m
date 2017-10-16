#!/usr/bin/octave -q
%% rcv_antenna.m
%%
%% Displays the time domain signal as seen by the antenna.

  function rcv_antenna(fs, t, fc, A, fk, phi, tag)
    
    x = A*cos(2*pi*fk*t + phi); % pure real signal

    %% time domain plot
    ax = figure(301);
      subplot(2,1,1);
        plot(t, real(x), ...
          'linewidth', 2, 'color', 'b');
        ylabel('Real Part');
        xlabel('Time [s]');
        grid on;
        set(gca, 'linewidth', 4, 'fontsize', 12)
      subplot(2,1,2);
        plot(t, imag(x), ...
          'linewidth', 2, 'color', 'r');
        title('Signal at Antenna');
        ylabel('Quadrature Part');
        xlabel('Time [s]');
        grid on;
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_%s.png', mfilename, tag));

    %% Fast Fourier Transform
    N = 10 * 2^nextpow2(numel(x));
   %x_f = fftshift(fft(x, N))/N;
    x_f = fftshift(fft(x, N));
    if mod(N,2), k=-N/2:N/2-1; else k=-(N-1)/2:(N-1)/2; end
    T = N/fs;
    n_f = k/T;

    %% frequency domain plot
    ax = figure(302);
      xrange = sort( (2*fk*[-1 +1]) );
      subplot(2,1,1);
        semilogy(n_f, abs(x_f), ...
          'linewidth', 2, 'color', 'b');
        ylabel('Magnitude');
        xlabel('Frequency [Hz]');
        xlim(xrange);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      subplot(2,1,2);
        plot(n_f, angle(x_f), ...
          'linewidth', 2, 'color', 'r');
        title('Spectrum at Antenna');
        ylabel('Phase');
        xlabel('Frequency [Hz]');
        xlim(xrange);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_freq_%s.png', mfilename, tag));

  end % rcv_antenna

 %o = parameters();
 %rcv_antenna(...);

%% *EOF*
