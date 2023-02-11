#!/bin/bash

# Solicita o nome da conta a ser criada
echo "Digite o nome da conta a ser criada:"
read accountName

# Cria o usuário
useradd $accountName

# Define a senha do usuário
echo "$accountName:$accountName123" | chpasswd

# Adiciona o usuário ao grupo de convidados
usermod -a -G guest $accountName

# Configura o diretório inicial do usuário
mkdir /home/$accountName
chown $accountName:$accountName /home/$accountName

# Configura as permissões para o diretório inicial do usuário
chmod 755 /home/$accountName