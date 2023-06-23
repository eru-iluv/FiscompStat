#!/bin/bash
for beta in 0.35 0.48
do
    for L in 60 80 100; do
        ./tarefa-c/tarefa-c-2-11820833.exe <<< "$beta $L"
        mv saida-c-2 saidas/tarefa-c/L$L/saida-b$beta
        echo "done exec beta = $beta L = $L"
    done
done