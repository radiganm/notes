#!/usr/bin/octave -q
%% rcv_ddc.m
%%
%% Displays the time domain signal as seen by the DDC.

  function rcv_ddc(fs, t, fc, fi, A, fk, phi, tag)
    
    %% Receiver Channels
    x        = A*sin(2*pi*fk*t + phi);         % signal at antenna
    fd       = -1 * abs(fc - fi);              % mixer frequency
    x_i      = x .* cos(2*pi*fd*t);            % real channel
    x_q      = x .* sin(2*pi*fd*t);            % quadrature channel

    %% Low-Pass Filter
    fcut     = 3.0 * fi;                       % [Hz    ] cutoff frequency
    wcut     = fcut/(fs/2);                    % [f norm] cutoff frequency (normalized)
    attn     = 40;                             % [dB    ] attenuation
    ord      = (attn*fs)/(22*(1.1*fcut-fcut)); % [#     ] FIR filter order
    if mod(ceil(ord),2)
      ord = ceil(ord) + 1;
    else
      ord = ceil(ord);
    end
    hb       = fir1(ord, wcut, 'low');
    ha       = [1];
    x_i_lpf  = filter(hb, ha, x_i);    % real channel low pass filter
    x_q_lpf  = filter(hb, ha, x_q);    % quadrature channel low pass filter

    %% Analytic Signal
    x_a_full = x_i     + 1i*x_q;
    x_a      = x_i_lpf + 1i*x_q_lpf;   % analytic signal

    %% time-alignment to account for filter response delay
    t0       = 0.03;                   % [s     ] filter response time
    ks       = find(t>t0);
    ks       = ks(1) + find(real(x_a(ks)) == max(real(x_a(ks))));  % cosine peak
    t0       = t(ks(1));               % snap to cosine peak
    ks       = find(t>t0);

    %% time domain plot
    ax = figure(311);
      subplot(2,1,1);
        plot(t(ks), real(x_a(ks)), 'linewidth', 2, 'color', 'b');
        ylabel('Real Part');
        xlabel('Time [s]');
        grid on;
        xlim([t(ks(1)) t(ks(end))]);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      subplot(2,1,2);
        plot(t(ks), imag(x_a(ks)), 'linewidth', 2, 'color', 'r');
        title('Signal at DDC');
        ylabel('Quadrature Part');
        xlabel('Time [s]');
        grid on;
        xlim([t(ks(1)) t(ks(end))]);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_%s.png', mfilename, tag));

    %% Fast Fourier Transform
    N = 10 * 2^nextpow2(numel(x_a));
    x_f = fftshift(fft(x_a, N));
    if mod(N,2), k=-N/2:N/2-1; else k=-(N-1)/2:(N-1)/2; end
    T = N/fs;
    n_f = k/T;

    x_f_full = fftshift(fft(x_a_full, N));
    x_f_max  = max(abs(x_f));

    x_lpf = abs(fftshift(fft(hb,N)));
    scale = x_f_max / max(x_lpf);
    x_lpf = x_lpf * scale;
    f_lpf = (-0.5:1/N:0.5-1/N)*fs;

    %% frequency domain plot
    ax = figure(312);
      xrange = sort( (2*fk*[-1 +1]) );
      subplot(2,1,1);
       %plot(n_f, 20*log10(abs(x_f_full)), 'linewidth', 2, 'color', 'k-');
       %hold on;
        plot(n_f, 20*log10(abs(x_f)), ...
          'linewidth', 2, 'color', 'b');
        hold on;
        plot(f_lpf, 20*log10(x_lpf), ...
          'linewidth', 2, 'color', 'm', 'linestyle', '-');
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

    %% Low-Pass Filter response
    frange = 3.0*fi * [-1 +1];
    ax = figure(313);
      subplot(1,1,1);
        plot((-0.5:1/N:0.5-1/N)*fs,20*log10(abs(fftshift(fft(hb,N)))), ...
          'linewidth', 2, 'color', 'r');
        xlim([frange(1) frange(end)]);
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_lpf_%s.png', mfilename, tag));

  end % rcv_ddc

 %o = parameters();
 %rcv_ddc(...);

%% *EOF*
