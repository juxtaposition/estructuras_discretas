## Objetivo de la practica
En esta práctica 4 se enfoco en el uso de data types de haskell y recursion. creando algunos operciones aritmenticas con estos nuevos tipos de datos. 

## Tiempo requerido en realizar la práctica completa
Creo que lo mas retador fueron los imports de data types (no sabia que se tenia que exportar e importra el constructor .. XD), otros ejercicios retadores tal vez fueron sin usar if then else y solo recursio, como potNat tuve que implementar la suma y multiplicacion para poder usara la potencia me gusto estuvieron buenos, me tomas unas hors terminar la practica.

## Comentarios
Me gustaron los ejercicios, y las actividades en general una buena practica!

## Actividades
Lee y analiza el código del archivo adjunto enteros.hs y comparalo con el archivo

entero.hs ubicado en el repositorio de trabajo, que puedes consultar [aquí](https://github.com/1rv1nn/lab-discretas/blob/main/recursion_haskell_4/entero.hs). Poste-
riormente responde a las siguientes preguntas en el respectivo README.

1. ¿Cuál es la diferencia de las operaciones implementadas en ambos archi-
vos? ¿Como se manejan todos los casos en cada implementación?

En el archivo s de enteros.hs hace uso de if then else ademas de un funcion para comparar mayor que, en el entero.hs solo hacen el uso de recursion y casos base.

2. ¿Por qué se tiene implementada la operación mayorEnt en el archivo
enteros.hs ?
Se usa especificamente para este caso:
```haskell
restaEnt (Suc n) (Suc m) = if ((Suc n) == (Suc m)) then Cero else if (mayorEnt (Suc n) (Suc m)) then restaEnt n m else Neg (restaEnt m n)
```
El cual son ifs anidados para manejador el caso cuando sen iguales cundo n > m y si no entonces Agregas un Neg porque la suma sera negativa, en entero.hs no hace falta agregar if anidados porque 
se agregan los casos base cuando algunos de los parametros es Neg.


3. Si pudieras quedarte con una sola implementación. ¿Cuál sería? Justifica tu
respuesta.
Me quedo sin dudarlo con el entero.hs porque es una implementacion mas limpia y facil de entender.
