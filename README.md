# finger

## Contexto


El servicio "finger" se refiere a un protocolo y un servicio que solía utilizarse para obtener información sobre usuarios en un sistema Unix o Linux. El puerto 79/tcp es el puerto estándar en el que se ejecuta este servicio.

El servicio "finger" permite a los usuarios obtener información sobre otros usuarios en un sistema, como su nombre, dirección de correo electrónico, última hora de inicio de sesión, y en algunos casos, su plan o mensaje de estado. Solía ser útil para saber quién estaba conectado a un sistema o para obtener información sobre otros usuarios en una red Unix.

Sin embargo, a lo largo de los años, el servicio "finger" se ha vuelto menos común debido a preocupaciones de seguridad. Revelar información sobre usuarios a través del servicio "finger" podría ser explotado por atacantes para obtener información sobre posibles objetivos y realizar ataques dirigidos. Como resultado, en muchas distribuciones de Linux y sistemas Unix modernos, el servicio "finger" se desactiva de forma predeterminada o se deshabilita por motivos de seguridad.

## Finger en victima u objetivo

Si encontramos el servicio finger habilitado en un server o ip destino como vemos en la siguiente imagen podriamos intentar enumerar usuarios

![image](https://github.com/Anonimo501/finger/assets/67207446/321e7a16-dfc7-4d59-be83-af509428c436)

Posteriormente usar el siguiente script para enumerar dichos usuarios:

El diccionario que se usa en la prueba es el siguiente (https://github.com/Anonimo501/SecLists/blob/master/Usernames/Names/names.txt)

![image](https://github.com/Anonimo501/finger/assets/67207446/abc93d4a-26de-4b1e-903e-f9c7de1e1e0f)

## Descarga y Uso

git clone https://github.com/Anonimo501/finger.git

cd finger/

chmod +x finger.sh

./finger.sh

## Autoria:

El script se realizo tomando como base el codigo del siguiente writeup: https://d4t4s3c.medium.com/vulnyx-fing-bf3830219e00 
