#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: pandoc view clean clobber

.DEFAULT_GOAL := default

target = Lambda-Calculus
output = .

default: doc

doc: pandoc


pandoc:
	-bibtex $(target)
	pandoc $(output)/$(target).md           \
	     --wrap=preserve                    \
	     --listings                         \
	     --latex-engine=xelatex             \
	     --latex-engine-opt=-shell-escape   \
	     --highlight-style=pygments         \
	     --filter=pandoc-minted             \
	     --template=../include/template.tex \
	     -s                                 \
	     -f markdown                        \
	     -F pandoc-minted                   \
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

## *EOF*
