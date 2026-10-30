#!/bin/bash

# Verificar que se pasen exactamente los dos argumentos necesarios
if [ "$#" -lt 2 ]; then
    echo "Error: Faltan argumentos."
    echo "Uso: $0 \"<palabra_o_frase>\" \"<ruta_carpeta>\""
    echo "Ejemplo: $0 \"hola\" \"dia3\""
    exit 1
fi

# Asignar los argumentos a variables
cadena="$1"
carpeta="$2"

# Verificar si la carpeta existe
if [ ! -d "$carpeta" ]; then
    echo "Error: La carpeta '$carpeta' no existe o no es un directorio válido."
    exit 1
fi

# Inicializar el contador de archivos encontrados
total=0

echo ""
echo "Buscando: $cadena"
echo "Carpeta:  $carpeta"
echo "--------------------"

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
