#!/usr/bin/octave -q
%% sinusoids.m
%%
%% Plots sinusoids as a projection of a point on the unit circle under constant angular velocity.

  function sinusoids(fs, t, fc, A, fk, phi, tag)
    
   %x = A*exp(1i*2*pi*fk*t + phi);
    x = A*exp(1i*2*pi*fk*t + phi);

    T2   = abs(fk/fs/2/pi);
    off  = -1/2;
    to   = 500*t;

    tk = 1/kf/2/pi;
    ks = 1:kk;

    %% time domain plot
    ax = figure(103);
      subplot(1,1,1);
        plot(real(x), imag(x), 'linewidth', 2, 'color', 'k');
        hold on;
        plot(real(x) + off, to, 'linewidth', 2, 'color', 'b');
        plot(to, imag(x) + off, 'linewidth', 2, 'color', 'r');
        grid on;
        set(gca, 'linewidth', 4, 'fontsize', 12)
      set(ax, 'visible', 'off');
      saveas(ax, sprintf('../figures/%s_%s.png', mfilename, tag));

  end % sinusoids

 pkg load signal;
 o = parameters();
 tag = 'pos';
 fk = +1 * o.fk;
 sinusoids(   o.fs, o.t, o.fc,       1.0, fk, 0.0,   tag);
 tag = 'neg';
 fk = -1 * o.fk;
 sinusoids(   o.fs, o.t, o.fc,       1.0, fk, 0.0,   tag);

%% *EOF*
