#!/bin/bash
for i in {1..7}
do
  echo "Problema $i: "
  ./ep1 < io/a$i.dat;
done
