import numpy as np
from matplotlib import pyplot as plt

arquivo = open("tarefa-b/saida-vy")
data = arquivo.readlines()
lim = 2.5
v = np.arange(-lim,lim,0.01)
kT = 0.9
nBins = 15
p = 1/np.sqrt(2*np.pi*kT)*np.exp(-v**2/2/kT)
data = [[float(numeroStr) for numeroStr in data[i].split()] for i in range(len(data))]
plt.title("Distribuição de velocidades\nno eixo y")
plt.xlabel("$v_y$")
plt.ylabel("$P_v$")
plt.hist( data[0], bins=nBins, density=True, alpha=0.4, label="t = 0~20")
plt.hist( data[1], bins=nBins, density=True, alpha=0.5, label="t = 21~40")
plt.hist( data[2], bins=nBins, density=True, alpha=0.4, label="t = 41~60" )
plt.plot(v,p, label="Maxwell Boltzmann")
plt.xlim([-lim,lim])
plt.legend()

plt.savefig("tarefa-b/tarefa-b-graf-3-11820833.png") 