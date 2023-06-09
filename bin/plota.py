#! /usr/bin/python
import sys
import subprocess
import os
import re


shallConvert = False 
try:
    sys.argv[2]
    shallConvert = True
except:
    pass
try:
    nomeArquivo, extensao = sys.argv[1].split(".")
except:
    nomeArquivo = sys.argv[1]
    extensao = ".gp"

extensao = ".gp"
pastaArquivo = re.findall(r"(\w+-.)", nomeArquivo)[0]
pastaArquivo = pastaArquivo + "/"
if (not os.path.isfile("gnuplot/"+nomeArquivo+extensao)):
    print(nomeArquivo+extensao)
    print("ERRO: Arquivo não existe")
    ValueError

subprocess.run(["gnuplot", nomeArquivo + extensao], cwd="gnuplot/")
subprocess.run(["pdflatex", nomeArquivo+".tex"], cwd="gnuplot/")
subprocess.run(["limpa.sh"], cwd="gnuplot/")
subprocess.run(["moveGrafico.sh", pastaArquivo, nomeArquivo+".pdf"], cwd="gnuplot/")
subprocess.run(["evince", "{}.pdf".format(nomeArquivo)], cwd=pastaArquivo)
if (shallConvert): subprocess.run(["convert", "-density", "200", nomeArquivo+".pdf",
                                    nomeArquivo+".png"], cwd=pastaArquivo)