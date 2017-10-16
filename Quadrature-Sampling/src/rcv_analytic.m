#!/usr/bin/octave -q
%% rcv_ddc.m
%%
%% Displays the time domain signal as seen by the DDC.

  function rcv_analytic(fs, t, fc, fi, A, fk, phi, tag)
    
    %% Receiver Channels
    x_a = A*exp(-1i*2*pi*fk*t + phi);     % analytic signal

    %% time domain plot
    ax = figure(321);
      subplot(2,1,1);
        plot(t, real(x_a), 'linewidth', 2, 'color', 'b');
        ylabel('Real Part');
        xlabel('Time [s]');
        grid on;
        xlim([t(1) t(end)]);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      subplot(2,1,2);
        plot(t, imag(x_a), 'linewidth', 2, 'color', 'r');
        title('Signal at DDC');
        ylabel('Quadrature Part');
        xlabel('Time [s]');
        grid on;
        xlim([t(1) t(end)]);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_%s.png', mfilename, tag));

    %% Fast Fourier Transform
    N = 10 * 2^nextpow2(numel(x_a));
    x_f = fftshift(fft(x_a, N));
    if mod(N,2), k=-N/2:N/2-1; else k=-(N-1)/2:(N-1)/2; end
    T = N/fs;
    n_f = k/T;

    %% frequency domain plot
    ax = figure(322);
      xrange = sort( (2*fk*[-1 +1]) );
      subplot(2,1,1);
        plot(n_f, 20*log10(abs(x_f)), ...
          'linewidth', 2, 'color', 'b');
        ylabel('Magnitude');
        xlabel('Frequency [Hz]');
        xlim(xrange);
       %grid on;
        set(gca,'XTick',xrange(1):100:xrange(end));
        legend({'filtered signal', 'low pass filter response'}, ...
          'location', 'southeast');
        set(gca, 'linewidth', 4, 'fontsize', 12)
      subplot(2,1,2);
        plot(n_f, angle(x_f), 'linewidth', 2, 'color', 'r');
        title('Spectrum at DDC');
        ylabel('Phase');
        xlabel('Frequency [Hz]');
        xlim(xrange);
        grid on;
        set(gca,'XTick',xrange(1):100:xrange(end));
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_freq_%s.png', mfilename, tag));

  end % rcv_analytic

 %o = parameters();
 %rcv_analytic(...);

%% *EOF*
