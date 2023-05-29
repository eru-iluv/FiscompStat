#!/bin/bash
for i in $(seq 0 $3)
do
    ./tarefa-$1/$2
    mv saida-$1-11820833 saidas/tarefa-$1/saida-$i
    echo "done exec $i"
done