#!/bin/bash

while true;
do
    read -p "Seleccione una opción de 1 2 3 4 o 5 " op
   
    case $op in
        [1]* ) echo "1";
            read -p "Introdueix el nom d'un usuari: " user
            totalLin=`cat usuarios.txt | wc -l`
            contador=1
            coincidencias=0
            while [ $contador -le $totalLin ];
            do
            usuarioLin=`cat usuarios.txt | head -$contador | tail -1 | awk '{print $1}'`
            if [ $user = $usuarioLin ];
                then
            coincidencias=$((coincidencias+1))
            fi
            contador=$((contador+1))
            done
            if [ $coincidencias -eq 0 ];
             then
            echo "$user no s'ha logejat"
            else
            echo "$user s'ha logejat $coincidencias veces"
            fi
            break;;
        
        [2]* ) echo "2";
            read -p "Introdueix un mes: " miMes
            totalLineas=`cat usuarios.txt | wc -l`
            cont=1
            while [ $cont -le $totalLineas ];
            do
            diaMes=`cat usuarios.txt | head -n$cont | tail -n1 | awk '{print $2}'`
            mes=`cat usuarios.txt | head -n$cont | tail -1 | awk '{print $3}'`
            if [ "$mes" == "$miMes" ]; 
            then
                echo "$diaMes"
            fi
            cont=$((cont+1))
            done

            break;;
        
        [3]* ) echo "3"; 
            read -p "Introdueix un mes: " mes
            read -p "Introdueix un dia: " dia
            totalLineas=`cat usuarios.txt | wc -l`
            cont=1
            a=0
            while [ $cont -le $totalLineas ];
            do
            meses=`cat usuarios.txt | head -$cont | tail -1 | awk '{print $3}'`
            diass=`cat usuarios.txt | head -$cont | tail -n1 | awk '{print $2}'`
            usuarios=`cat usuarios.txt | head -$cont | tail -1 | awk '{print $1}'`
            if [ $mes = $meses ]; then
            if [ $dia = $diass ]; then
            echo "El $dia de $mes se conectó:" $usuarios
            fi
            a=$((a+1))
            fi
            cont=$((cont+1))
            done
            if [ $a = 0 ]; then
            echo "Nadie se ha conectado en esa fecha."
            fi
            break;;
        
        [4]* ) echo "4"; 
            read -p "Introdueix el nom d'un usuari: " user
            totalLin=`cat usuarios.txt | wc -l`
            cont=1
            coincidencias=0
            
            while [ $cont -le $totalLin ];
            do
            usuarioLin=`cat usuarios.txt | head -$cont | tail -1 | awk '{print $1}'`
            meses=`cat usuarios.txt | head -$cont | tail -1 | awk '{print $3}'`
            diass=`cat usuarios.txt | head -$cont | tail -n1 | awk '{print $2}'`
            usuarios=`cat usuarios.txt | head -$cont | tail -1 | awk '{print $1}'`

            if [ $user = $usuarioLin ];
                then
            coincidencias=$((coincidencias+1))
            fi
            contador=$((contador+1))
            done
            if [ $coincidencias -eq 0 ];
             then
            echo "$user no s'ha logejat"
            else
            echo "$user s'ha logejat per ultima vegada en" $diass $meses
            fi
        
        
            break;;
        
        [5]* )  echo "Cerrar. Bye!";
            exit;; 
    esac
    
done