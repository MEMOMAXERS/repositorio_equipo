#!/bin/bash

# Recorrer los archivos de la carpeta y sus subcarpetas
while IFS= read -r -d '' archivo; do  
    # Contar las apariciones exactas de la cadena
    cantidad=$(grep -oF -- "$cadena" "$archivo" 2>/dev/null | wc -l)

    # Mostrar solo los archivos que tienen coincidencias
    if (( cantidad > 0 )); then
        echo "Archivo: $archivo"
	echo "Apariciones: $cantidad"
	echo ""
		
	((total++))
    fi
	
done < <(find "$carpeta" -type f -print0)

# Mostrar el total de archivos encontrados
echo "-------------------"
echo "Total de archivos encontrados: $total"

