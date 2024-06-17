import numpy as np

arquivoB = open("tarefa-b/saida-temp")
arquivoC = open("tarefa-c/saida-temp")

dataB = arquivoB.readlines()
dataC = arquivoC.readlines()

dataB = np.array([np.float64(i) for i in dataB])
dataC = np.array([np.float64(i) for i in dataC])

dataB = dataB[100:]
dataC = dataC[100:]

print("MÉDIA TEMP B: {} +- {}".format(np.mean(dataB), np.std(dataB, ddof=1)))
print("MÉDIA TEMP C: {} +- {}".format(np.mean(dataC), np.std(dataC, ddof=1)))
