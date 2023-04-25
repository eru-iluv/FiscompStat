import sys
from decimal import Decimal

inputHandle = open("saidas/saida-onda", 'r')
outputFile = sys.argv[1]
outputHandle = open("saidas/{}".format(outputFile), 'w')

lines = inputHandle.readlines()
size_t = len(lines)
lines = [lines[i] for i in range(0, size_t//300 + 5, 5)]
dataInput = [[Decimal(value) for value in line.split()] for line in lines] 
size_x = len(dataInput[1])
dataOutput = [[str((dataInput[i][j]+i)) for i in range(size_t//1500+1)] for j in range(size_x)]
for dataLine in dataOutput:
    outputHandle.write("  ".join(dataLine) + "\n")

inputHandle.close()
outputHandle.close()
    