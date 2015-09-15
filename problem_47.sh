#! /bin/bash

cnt=0
N=2

while [ $cnt -ne 4 ]; do
  N=$(($N+1))
  primes=$(factor $N | awk '{for( i = 2; i <= NF; i++) print $i }' | uniq | wc -l)
  if [ $primes -ge 4 ]; then
    cnt=$(($cnt+1))
  else
    cnt=0
  fi
done
echo $N
