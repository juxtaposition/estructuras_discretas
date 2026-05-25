
## Objetivo de la practica

Proyecto Final de Laboratorio - Crear codigo de huffman coding and decoding.

## Uso del programa principal
Para poder codificar y decodifcar basta con escribir main en algun inteprete como ghci
```shell
┗┅◉ doom@pc ━► ghci Proyecto.hs 
```

Ahora baste con poner `main`

```shell
ghci> main
Inserta la cadena a encodear:
```
baste con hacer copy/paste del texto que quieres codificar. `OJO!! no acepta textos con SALTOS DE LINEA`

Ejemplo de uso:
```shell
ghci> main
Inserta la cadena a encodear:
Hola Mundo lindo y querido
Tabla de frecuencia con sus valores: 
[('H',1),('M',1),('a',1),('e',1),('q',1),('r',1),('y',1),('i',2),('l',2),('n',2),('u',2),('d',3),(' ',4),('o',4)]

Ahora utilizando el mapeo (table) de frecuencias contruiremos el arbol de huffman: 
BT (Nothing,26) (BT (Nothing,10) (BT (Just 'o',4) Void Void) (BT (Nothing,6) (BT (Nothing,3) (BT (Just 'y',1) Void Void) (BT (Nothing,2) (BT (Just 'q',1) Void Void) (BT (Just 'r',1) Void Void))) (BT (Just 'd',3) Void Void))) (BT (Nothing,16) (BT (Nothing,8) (BT (Nothing,4) (BT (Nothing,2) (BT (Just 'a',1) Void Void) (BT (Just 'e',1) Void Void)) (BT (Nothing,2) (BT (Just 'H',1) Void Void) (BT (Just 'M',1) Void Void))) (BT (Just ' ',4) Void Void)) (BT (Nothing,8) (BT (Nothing,4) (BT (Just 'n',2) Void Void) (BT (Just 'u',2) Void Void)) (BT (Nothing,4) (BT (Just 'i',2) Void Void) (BT (Just 'l',2) Void Void))))

Por cada caracter le corresponde un codigo de huffman (bit al recorrer el arbol izq o der): 
[('o',"00"),('y',"0100"),('q',"01010"),('r',"01011"),('d',"011"),('a',"10000"),('e',"10001"),('H',"10010"),('M',"10011"),(' ',"101"),('n',"1100"),('u',"1101"),('i',"1110"),('l',"1111")]

Y su represnetacion en binario queda como:
10010001111100001011001111011100011001011111111011000110010101001010101011011000101011111001100

Ahora usando el arbol de arriba y su representacion en binario obtendremos la cadena orinal:
Hola Mundo lindo y querido
################# ACTIVIDAD #################
Vamos a comparar el size de la cadena original en bits y de la generada con huffman:
Size de la cadena original en bits:
200

Ahora el size en bits de la cadena generada con huffman:
95

El ahorro fue de: 
105 bits
```

## Tiempo requerido en realizar la práctica completa

Me tomo un poco de tiempo algunos problemas con la recursion sobre algunas estructuras como un arbol con tipo de dato tupla, o character, aveces necesitaba poner un Null, entonces al investigar encontre Maybe (Just a, Nothing) y fue justo lo que me hacia falta.

Me tomo varias horas codear los método para poder encontrar la frecuencias, crear el arbol de huffman, pasar de un string a un binary porque aca depende de la codificación (Utf-8, etc) entonces fije la respuesta en 8bits para mayor facilidad.

La parte de decodificar no tomo mucho tiempo en realidad, porque si tienes al arbol de huffman bien construido y la nueva cadena de bits generada entonces no deberias de tener problema de poder volver a obtener la cadena original.

  
  

## Comentarios

Tal vez pude evitar usar un Map porque al final lo que necesitaba era un lista de tuplas [(k, v)] pero ya habia avanzado mucho entonces no quice cambiar el código, pero no hacia falta usar Maps. Una cosa mas que no me gusto fue que tuve que agregar el patter matching de cada caso para recorre el árbol de huffman y estoy seguro que se puedo crear de otra forma, pero al final no tengo mucha experiencia en haskell así fue como lo solucione.

La práctica esta muy bien documentada y explicada paso a paso si la vas siguiendo te va saliendo las funciones que necesitas crear y el árbol de huffman.
