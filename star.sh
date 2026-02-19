#!/bin/bash
n=5
for ((i=n; i>=1; i--))
do
  for ((j=1; j<=i; j++))
  do
    echo -n "*"
  done
  echo
done

for ((i=1; i<=n; i++))
do
  for ((j=1; j<=i; j++))
  do
    echo -n "*"
  done
  echo
done