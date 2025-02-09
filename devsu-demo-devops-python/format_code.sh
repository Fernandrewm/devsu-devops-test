#!/bin/bash

# Instalar herramientas de formateo
echo "Instalando herramientas..."
pip install black isort

# Ordenar imports
echo "Ordenando imports..."
isort api/ demo/ --profile black --line-length 120

# Formatear código
echo "Formateando código..."
black --line-length 120 api/ demo/

echo "¡Formateo completado!" 