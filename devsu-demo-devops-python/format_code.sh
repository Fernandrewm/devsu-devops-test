#!/bin/bash

# Instalar black
echo "Instalando black..."
pip install black

# Aplicar black con la configuración que coincide con nuestro pipeline
echo "Formateando código..."
black --line-length 120 api/ demo/

echo "¡Formateo completado!" 