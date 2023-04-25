# FiscompStat

Repositório da Matéria de Física Estatística Computacional (7600073 - 2023) com professor Alcaraz.

## Configurando pasta
Você pode configurar esse repositório para usar os comandos relacionados a 
gerar os gráficos e os executáveis no seu terminal bash ou zsh.
Para isso, basta executar no terminal:

``` sh
git clone https://github.com/eru-iluv/FiscompStat.git
cd FiscompStat/bin
sh configura.sh
```

Isso vai clonar o repositório e adicionar a pasta bin dele ao seu path local através do
.zshrc ou do .bashrc. Após isso, os arquivos bash e python nessa pasta poderão ser rodados
como executáveis

## Como são feitos os projetos

Os códigos são escritos em Fortran 90 e compilados usando gfortran.
Os gráficos são feitos em gnuplot. Os relatórios foram escritos em orgmode
e convertidos de html em pdf pelo navegador (Como um primata).

## Detalhes

Eu uso fortls. Infelizmente eu sou burro. Cabe a ressalva:
Para usar fortls, não devo estar usando VS Code instalado no flatpack
(Isso seria idiota no contexto do vscode, pois ele estaria
sandboxado de acessar as configurações do terminal).

Com esse primeiro passo, basta adicionar essa linha ao perfil do terminal
(.zshrc, .bashrc, o que estiver usando)

``` sh
PATH=$PATH:$HOME/.local/bin  # Local de instalação padrão dos executáveis do pip 
```

Isso se você estiver usando UNIX ao menos
