#!/bin/bash
for L in 4 5 6 7 8 9 10
do
    ./tarefa-d/tarefa-d-11820833.exe <<< "$beta $L"
    mv saida-d saidas/tarefa-d/saida-$L
    echo "done exec L = $L"
done