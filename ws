#!/bin/bash
echo
for i in a e i o u E O U
do
  for j in a e i o u E O U
    do
      echo -n "$i $j $k: "
      perl msearch.pl "($i)K($j)" | grep items
      echo "."
    done
done
