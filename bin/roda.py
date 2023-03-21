#! /usr/bin/python
import sys
import subprocess
import os
import re

 

try:
    nomeArquivo, extensao = sys.argv[1].split(".")
except:
    nomeArquivo = sys.argv[1]
    extensao = ".f90"

if (extensao != ".f90"):
    extensao = ".f90"

if ( not os.path.isfile("fortran/"+nomeArquivo+extensao)):
    print(nomeArquivo+extensao)
    print("ERRO: Arquivo não existe")
    ValueError

subprocess.run(["gfortran", nomeArquivo + extensao, "-o", 
    "{}.exe".format(nomeArquivo)], cwd="fortran/")
subprocess.run(["./{}.exe".format(nomeArquivo),], cwd="fortran/")

