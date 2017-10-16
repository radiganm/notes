#!/usr/bin/octave -q
%% dct_single.m
%%
%% Plots a single DCT component for a selected frequency as a function of phase angle.

  function dct_single(fs, t, fc, A, fk, phi, tag)
    
    x = A*sin(2*pi*fk*t + phi); % pure real signal

  end % dct_single

 %o = parameters();
 %dct_single(...);

%% *EOF*
