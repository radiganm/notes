#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: 

.DEFAULT_GOAL := default

default:
	$(MAKE) -C Cayley-Hamilton
	$(MAKE) -C Markowitz
	$(MAKE) -C Information-Theory
	$(MAKE) -C Time-Frequency
	$(MAKE) -C Camera-Theory
	$(MAKE) -C Compiler-Optimization
	$(MAKE) -C Digital-Image-Warping
	$(MAKE) -C Particle-Filter
	$(MAKE) -C Quadrature-Sampling
	$(MAKE) -C Lambda-Calculus
	$(MAKE) -C Quaternions
	$(MAKE) -C Map-Seeking-Circuits
	$(MAKE) -C Kalman-Filter
	$(MAKE) -C Graphics
	$(MAKE) -C Convex-Optimization
	$(MAKE) -C Machine-Learning
	$(MAKE) -C Archimedes
	$(MAKE) -C Spectral-Graph
	$(MAKE) -C Technical-Analysis
	$(MAKE) -C Trachtenberg-Systems

clobber: clean
	$(MAKE) -C Archimedes $^
	$(MAKE) -C Camera-Theory $^
	$(MAKE) -C Cayley-Hamilton $^
	$(MAKE) -C Compiler-Optimization $^
	$(MAKE) -C Convex-Optimization $^
	$(MAKE) -C Digital-Image-Warping $^
	$(MAKE) -C Graphics $^
	$(MAKE) -C Information-Theory $^
	$(MAKE) -C Kalman-Filter $^
	$(MAKE) -C Lambda-Calculus $^
	$(MAKE) -C Machine-Learning $^
	$(MAKE) -C Map-Seeking-Circuits $^
	$(MAKE) -C Markowitz $^
	$(MAKE) -C Particle-Filter $^
	$(MAKE) -C Quadrature-Sampling $^
	$(MAKE) -C Quaternions $^
	$(MAKE) -C Spectral-Graph $^
	$(MAKE) -C Time-Frequency $^
	$(MAKE) -C Technical-Analysis $^
	$(MAKE) -C Trachtenberg-Systems $^

clean:
	$(MAKE) -C Archimedes $^
	$(MAKE) -C Camera-Theory $^
	$(MAKE) -C Cayley-Hamilton $^
	$(MAKE) -C Compiler-Optimization $^
	$(MAKE) -C Convex-Optimization $^
	$(MAKE) -C Digital-Image-Warping $^
	$(MAKE) -C Graphics $^
	$(MAKE) -C Information-Theory $^
	$(MAKE) -C Kalman-Filter $^
	$(MAKE) -C Lambda-Calculus $^
	$(MAKE) -C Machine-Learning $^
	$(MAKE) -C Map-Seeking-Circuits $^
	$(MAKE) -C Markowitz $^
	$(MAKE) -C Particle-Filter $^
	$(MAKE) -C Quadrature-Sampling $^
	$(MAKE) -C Quaternions $^
	$(MAKE) -C Spectral-Graph $^
	$(MAKE) -C Time-Frequency $^
	$(MAKE) -C Technical-Analysis $^
	$(MAKE) -C Trachtenberg-Systems $^

## *EOF*
