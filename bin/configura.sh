# Configura diretório em computador que ainda não tem o bin no path 

echo "PATH=\$PATH:$(pwd)" >> $HOME/.zshrc
echo "PATH=\$PATH:$(pwd)" >> $HOME/.bashrc
