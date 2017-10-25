#!/bin/zsh
## mydiff.sh

  d=${0%/*}; f=${0##*/}; n=${f%.*}; e=${f##*.}
  r=`readlink -f $d`

  flags=$1; shift
  a=$1;     shift
  b=$1;     shift

  sdiff $flags -w 150 =(tail -n +3 $a) =(tail -n +3 $b) 
  echo ""
  if [ $? -ne 0 ]; 
  then
    echo "== Differences Exist =="
  else
    echo "== No Difference =="
  fi
  echo ""

## *EOF*
