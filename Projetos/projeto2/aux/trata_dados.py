import sys
from decimal import Decimal

inputHandle = open("tarefa-1/saida-1", 'r')
outputFile = sys.argv[1]
outputHandle = open("dados/{}".format(outputFile), 'w')

lines = inputHandle.readlines()
size_t = len(lines)
lines = [lines[i] for i in range(0, size_t, 10)]
dataInput = [[Decimal(value) for value in line.split()] for line in lines] 
size_x = len(dataInput[1])
dataOutput = [[str((dataInput[i][j]+i)*10) for i in range(size_t//10 + 1)] for j in range(size_x)]
for dataLine in dataOutput:
    outputHandle.write("  ".join(dataLine) + "\n")

inputHandle.close()
outputHandle.close()
    