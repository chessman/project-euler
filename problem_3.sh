#! /bin/bash
N=600851475143
factor $N | awk '{print $NF}'
