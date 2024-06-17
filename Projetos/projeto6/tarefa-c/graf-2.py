import numpy as np
from matplotlib import pyplot as plt

arquivo = open("tarefa-c/saida-vx")
data = arquivo.readlines()
lim = 2.5
v = np.arange(-lim,lim,0.01)
kT = 0.80
nBins = 10
p = 1/np.sqrt(2*np.pi*kT)*np.exp(-(v-0.5)**2/2/kT)
data = [[float(numeroStr) for numeroStr in data[i].split()] for i in range(len(data))]
plt.title("Distribuição de velocidades\nno eixo x")
plt.xlabel("$v_x$")
plt.ylabel("$P_v$")
plt.hist( data[0], bins=nBins, density=True, alpha=0.4, label="t = 0~20")
plt.hist( data[1], bins=nBins, density=True, alpha=0.5, label="t = 20~40")
plt.hist( data[2], bins=nBins, density=True, alpha=0.4, label="t = 41~60" )
plt.plot(v,p, label="Maxwell Boltzmann")
plt.xlim([-lim,lim])
plt.legend()
0
plt.savefig("tarefa-c/tarefa-c-graf-2-11820833.png") 