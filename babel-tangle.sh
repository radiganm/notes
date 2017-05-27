#!/bin/bash
## babel-tangle.sh
## Mac Radigan

  emacs -q --batch --kill --eval '(progn (require (quote org)) (org-babel-tangle-file "./README.org"))'

## *EOF*
