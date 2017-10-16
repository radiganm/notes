#!/usr/bin/octave -q
%% parameters.m
%%
%% Specifies the paramters used throughout this discussion.

  function y = parameters()
    
    fs    = 1e4;       % [Hz]       sampling frequency
    fc    = 3e2;       % [Hz]       carrier frequency
    fi    = 1e2;       % [Hz]       intermediate frequency
    A     = 1.0;       % [unitless] gain for signal of interest
    fk    = fc + 1e2;  % [Hz]       frequency for signal of interest
    phi   = 0.45 * pi; % [rad]      phase angle for signal of interest
    T     = 5e-2;      % [s ]       duration
    t     = 0:1/fs:T;  % [s ]       time vector

    y = struct(   ...
      'fs',  fs,  ...
      'fc',  fc,  ...
      'fi',  fi,  ...
      'A',   A,   ...
      'fk',  fk,  ...
      'phi', phi, ...
      'T',   T,   ...
      't',   t    ...
      );
    
  end % parameters

%% *EOF*
