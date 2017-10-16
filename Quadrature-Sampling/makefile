#!/usr/bin/make -f
## makefile (for Quadrature Sampling)
## Mac Radigan

.PHONY: init dox pandoc view clean clobber dist run test

.DEFAULT_GOAL := default

target = Quadrature-Sampling

date = $(shell date +%F)

template        = ./template
output          = ./output
figures         = ./figures
include         = ./include
src             = ./src
distributables  = ./dist
package         = ./$(target)

default: doc

doc: pandoc

src: init run
	#$(MAKE) -C src

dox: src
	rm -rf $(output)
	env PYTHONPATH=../dox/library      \
	  python3 ../dox/dox.py            \
	    -v -r                          \
	    -I ./include:./src             \
	    -t $(template)                 \
	    -o $(output)

pandoc: dox
	mddia -pdf $(output)/$(target).md |    \
	  pandoc                               \
	     --wrap=preserve                   \
	     --template=./include/template.tex \
	     --filter pandoc-eqnos             \
	     -M cleveref=On                    \
	     -f markdown                       \
	     --highlight-style=tango           \
	     -t latex                          \
	     -o $(target).tex
	pdflatex --shell-escape $(target).tex

run:
	$(MAKE) -C src $@

clobber: clean
	$(MAKE) -C src $@
	-rm -Rf $(distributables)
	-rm -f $(target).pdf

clean:
	$(MAKE) -C src $@
	-rm -f $(target).tex
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux

init:
	mkdir -p $(figures)

view:
	@zathura -x -a $(target).pdf 1>/dev/null 2>/dev/null

preview:
	@feh -Y --fullscreen $(figures)

test: doc
	$(MAKE) view

dist: doc
	rm -Rf $(distributables)
	mkdir -p $(distributables)/$(package)
	rsync -avhrL $(target).pdf $(distributables)/$(package)
	rsync -avhrL $(template)   $(distributables)/$(package)
	rsync -avhrL $(include)    $(distributables)/$(package)
	rsync -avhrL $(src)        $(distributables)/$(package)
	rsync -avhrL makefile      $(distributables)/$(package)
	(cd $(distributables); zip -r $(package)_$(date).zip $(package) )
	(cd $(distributables); openssl sha1 $(package)_$(date).zip >$(package)_$(date).zip.sha1 )

## *EOF*
