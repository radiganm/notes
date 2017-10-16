#!/usr/bin/octave -q
%% run_demo.m
%%
%% Runs the complete demo for all sections.

  function my_demo(o)
    
    %% positive frequency (+f_k)
    tag = 'pos';
    fk = +1 * o.fk;
    rcv_antenna( o.fs, o.t, o.fc,       o.A, fk, o.phi, tag);
    rcv_ddc(     o.fs, o.t, o.fc, o.fi, o.A, fk, o.phi, tag);
    rcv_analytic(o.fs, o.t, o.fc, o.fi, o.A, fk, o.phi, tag);

    %% negative frequency (-f_k)
    tag = 'neg';
    fk = -1 * o.fk;
    rcv_antenna( o.fs, o.t, o.fc,       o.A, fk, o.phi, tag);
    rcv_ddc(     o.fs, o.t, o.fc, o.fi, o.A, fk, o.phi, tag);
    rcv_analytic(o.fs, o.t, o.fc, o.fi, o.A, fk, o.phi, tag);
    
  end % my_demo

  pkg load signal;
  o = parameters();
  my_demo(o);

%% *EOF*
