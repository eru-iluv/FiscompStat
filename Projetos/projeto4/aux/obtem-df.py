import numpy as np

def tarefa2():
    caminhoDir = "saidas/tarefa-2/"
    dfArray = []
    
    for i in range(50):
        caminhoSaida = caminhoDir + "saida-{}".format(i) 
        data = leData(caminhoSaida)
        dfArray.append(obtemDf(data))

    dfArray = np.array(dfArray)
    return (np.mean(dfArray), np.std(dfArray, ddof=1 ))

def tarefa3():
    caminhoDir = "saidas/tarefa-3/"
    dfArray = []
    
    for i in range(31):
        caminhoSaida = caminhoDir + "saida-{}".format(i) 
        data = leData(caminhoSaida)
        dfArray.append(obtemDf(data))

    dfArray = np.array(dfArray)
    return (np.mean(dfArray), np.std(dfArray, ddof=1 ))

def tarefa5_1():
    caminhoDir = "tarefa-5/"
    dfArray = []
    
    caminhoSaida = caminhoDir + "saida-5-11820833"
    data = leData(caminhoSaida)
    df = obtemDf(data)

    
    return df


def tarefa5():
    caminhoDir = "saidas/tarefa-5/"
    dfArray = []
    
    for i in range(1,10):
        caminhoSaida = caminhoDir + "saida-{}".format(i) 
        data = leData(caminhoSaida)
        dfArray.append(obtemDf(data))

    return dfArray


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