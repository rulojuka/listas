#!/bin/bash

echo `pwd`
cd gen/
./genmatsim_gera_direto
mv ./*.dat ../io
