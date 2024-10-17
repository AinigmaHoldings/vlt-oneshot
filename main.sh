#!/bin/bash

# Paso 1: Instalar git y curl si no están instalados
echo "Verificando si git y curl están instalados..."

# Instalar git si no está presente
if ! [ -x "$(command -v git)" ]; then
  echo "Instalando git..."
  sudo apt-get update -y
  sudo apt-get install git -y
else
  echo "git ya está instalado."
fi

# Instalar curl si no está presente
if ! [ -x "$(command -v curl)" ]; then
  echo "Instalando curl..."
  sudo apt-get update -y
  sudo apt-get install curl -y
else
  echo "curl ya está instalado."
fi

# Paso 2: Clonar el repositorio
echo "Clonando el repositorio ahs-vlt-system..."
REPO_URL="https://github.com/AinigmaHoldings/ahs-vlt-system.git"

git clone $REPO_URL

# Paso 3: Ingresar al directorio y ejecutar install.sh
if [ -d "ahs-vlt-system" ]; then
  cd ahs-vlt-system
  if [ -f "install.sh" ]; then
    echo "Ejecutando install.sh..."
    bash install.sh
  else
    echo "El archivo install.sh no se encuentra en el repositorio."
    exit 1
  fi
else
  echo "Error al clonar el repositorio o el directorio ahs-vlt-system no existe."
  exit 1
fi
