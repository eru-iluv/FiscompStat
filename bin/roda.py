#! /usr/bin/python
import sys
import subprocess
import os
import re

 

try:
    nomeArquivo, extensao = sys.argv[1].split(".")
    extensao = ".f90"
except:
    nomeArquivo = sys.argv[1]
    extensao = ".f90"

# Queremos pegar a tarefa relacionada ao arquivo
pastaArquivo = re.findall(r"([a-z]+-.)", nomeArquivo)[0]
pastaArquivo = pastaArquivo + "/"

if ( not os.path.isfile(pastaArquivo+nomeArquivo+extensao)):
    print(nomeArquivo+extensao)
    print("ERRO: Arquivo não existe")
    ValueError

subprocess.run(["gfortran", nomeArquivo + extensao, "-o", 
    "{}.exe".format(nomeArquivo)], cwd=pastaArquivo)
subprocess.run(["./{}.exe".format(nomeArquivo),], cwd=pastaArquivo)

