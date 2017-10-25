#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: pandoc view clean clobber build init

.DEFAULT_GOAL := default

target = Compiler-Optimization

CXXFLAGS        = -g

template        = ./template
source          = ./src
bin             = ./bin
asm             = ./asm
results         = ./results
output          = ./output

default: doc

doc: pandoc

dox: init
	rm -rf $(output)
	env PYTHONPATH=../dox/library                 \
	  python3 ../dox/dox.py                       \
	    -v -r                                     \
	    -I ./include:$(source):$(asm):$(results)  \
	    -t $(template)                            \
	    -o $(output)

pandoc: build dox
	pandoc $(output)/$(target).md           \
	     --wrap=preserve                    \
	     --template=../include/template.tex \
	     --filter pandoc-eqnos              \
	     -M cleveref=On                     \
	     -f markdown                        \
	     --highlight-style=tango            \
	     -t latex                           \
	     -o $(target).tex
	pdflatex --shell-escape $(target).tex

view:
	@zathura -x -a $(target).pdf 1>/dev/null 2>/dev/null

clobber: clean
	-rm -f $(target).pdf

clean:
	-rm -f $(target).tex
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux
	-rm -f $(target).bbl
	-rm -f $(target).blg
	-rm -f ./$(bin)/*
	-rm -f ./$(results)/*

init:
	-mkdir -p $(figures) $(asm) $(bin) $(results)

build: init
	## Variable Declaration
	gcc $(CXXFLAGS) -o $(bin)/variable_stack_1 $(source)/variable_stack_1.cc
	objdump -d $(bin)/variable_stack_1 >$(asm)/variable_stack_1.asm
	gcc $(CXXFLAGS) -o $(bin)/variable_stack_2 $(source)/variable_stack_2.cc
	objdump -d $(bin)/variable_stack_2 >$(asm)/variable_stack_2.asm
	-./mydiff.sh "" $(asm)/variable_stack_1.asm $(asm)/variable_stack_2.asm >$(results)/variable_stack_1_2.diff
	## Memory Initialization
	gcc $(CXXFLAGS) -o $(bin)/segments_1 $(source)/segments_1.cc
	objdump -x $(bin)/segments_1 >$(asm)/segments_1.asm
	gcc $(CXXFLAGS) -o $(bin)/segments_2 $(source)/segments_2.cc
	objdump -x $(bin)/segments_2 >$(asm)/segments_2.asm
	-./mydiff.sh -s $(asm)/segments_1.asm $(asm)/segments_2.asm >$(results)/segments_1_2.diff

## *EOF*
