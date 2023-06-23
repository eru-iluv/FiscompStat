import numpy as np

def tarefad():
    caminhoDir = "saidas/tarefa-d/"
    dfArray = []
    
    for i in range(4, 11):
        caminhoSaida = caminhoDir + "saida-{}".format(i) 
        data = leData(caminhoSaida)
        dfArray.append(obtemDf(data))

    dfArray = np.array(dfArray)
    return (np.mean(dfArray), np.std(dfArray, ddof=1 ))

def obtemDf(data: np.array):
    # extract the log of the data
    radiusn = np.log(data[1,:])
    particlesn = np.log(data[0,:])

    # solve for A^T A x = A^T b
    # where A = [t, 1]
    # and b = r
    A = np.vstack([np.ones(len(radiusn)), radiusn]).T

    alpha = np.linalg.solve(np.dot(A.T, A), np.dot(A.T, particlesn))
    return alpha[1]

def leData(nomeDeArquivo: str):
    arquivo = open(nomeDeArquivo, "r")
    linhas = arquivo.readlines()        

    data = [[np.int16(linhas[i].split()[-2]) for i in range(len(linhas))],
             [np.float64(linhas[i].split()[-1]) for i in range(len(linhas))]]
    return np.array(data)


def main():
    resultado2 = tarefa2()
    resultado3 = tarefa3()
    resultado5 = tarefa5()
    print("Resultados da tarefa-2: ", resultado2)
    print("Resultados da tarefa-3: ", resultado3 )
    print("Resultados da tarefa-5: ", resultado5)

main()