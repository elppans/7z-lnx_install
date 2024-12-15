#!/bin/bash
# https://github.com/ip7z/7zip/releases

# Verifica se o comando 7z existe
if ! command -v 7z &> /dev/null; then
    echo "O comando '7z' não foi encontrado. Iniciando a instalação..."

    # Define o diretório de instalação e a URL de download
    INSTALL_DIR="/opt/7zip"
    URL="https://github.com/ip7z/7zip/releases/download/24.09/7z2409-linux-x64.tar.xz"
    TAR_FILE="7z2409-linux-x64.tar.xz"

    # Cria o diretório de instalação
    mkdir -p "$INSTALL_DIR"

    # Navega para o diretório de instalação
    cd "$INSTALL_DIR" || exit 1

    # Faz o download do arquivo usando curl
    echo "Baixando o 7-Zip..."
    curl -JOLk "$URL"

    # Extrai o arquivo baixado
    echo "Extraindo o pacote..."
    tar -xJf "$TAR_FILE"

    # Cria o link simbólico para o comando 7z
    echo "Criando link simbólico para /usr/local/bin/7z..."
    ln -sf "$INSTALL_DIR/7zz" /usr/local/bin/7z

    echo "Instalação concluída! O comando '7z' está disponível."
 else
     echo "O comando '7z' já está instalado."

fi
