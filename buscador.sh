#!/bin/bash

# Verificar que pasen 2 argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <palabra> <carpeta>"
    exit 1
fi

palabra=$1
dir=$2
contador=0

echo "Buscando '$palabra' en la carpeta '$dir'..."
echo "----------------------------------------"

for f in $(find "$dir" -type f); do
    n=$(grep -o "$palabra" "$f" 2>/dev/null | wc -l)
    
    if [ "$n" -gt 0 ]; then
        echo "Encontrado en: $f ($n veces)"
        contador=$((contador + 1))
    fi
done

echo "----------------------------------------"
echo "Total de archivos con coincidencias: $contador"
