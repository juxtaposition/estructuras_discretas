
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

  

## Actividades

  

### 1. ¿Cuál es la diferencia entre la compresión con perdida y compresión sin perdida?

A groso modo la compresión con perdida se utiliza cuando no importa tener un poco de perdida si no es perceptible

para los humanos, como imagenes o sonido.

La compresión sin perdida al contrario esta busca mantener los datos originales, y es usada para base de datos, codigos de programas.

  

### 2. Investiga como se lleva a cabo la compresión de texto, images, videos y audio.

En la compresión de información se pueden clasificar a los algoritmos en dos categorias:

#### Lossless (sin perdida)

Estos son algoritmos que buscan mantener la información original sin ninguna perdida y algunos de estos algoritmos pueden ser

-   Compresión general de archivos

        - Huffman Coding
        - Arithmetic Coding
        - LZ77
        - LZ78
        - PPM (Prediction by Partial Matching)

- Imágenes

      -  PNG
      - GIF
      - JPEG-LS

- Audio

      - FLAC
      - ALAC

- Video

      - FFV1

#### Lossy (con perdida) 

- Imágenes

      -   JPEG
      -   WebP Lossy
      -   JPEG
      -   HEIF / HEIC
      -   AVIF

- Audio

      -   MP3
      -   AAC
      -   Ogg Vorbis
      -   WMA

- Video

      -   H.264 / AVC
      -   H.265 / HEVC
      -   AV1
      -   MPEG-2
      -   MPEG-4 Part 2

### 3. ¿A que se refiere el enfoque para la compresión de datos, códigos de longitud variable?
Esencialmente se refiere a la asignación de codigos binarios a cada caracter (elemento), los elementos que se repiten mas
reciven codigos mas cortos y los menos frecuentes mas largos. 
Tal cual como esta hecho el árbo de huffman vas creando el arbol de los menos frecuentes a los más frecuentes.


### 4. Crea 2 archivos de texto donde:

a) Ingresa una frase que te guste de tu canción favorita SIN ESPACIOS y revisa su contenido binario mediante el comando xxd y su peso en bytes.
```shell
┗┅◉ doom@pc ━► xxd a.txt 
00000000: 4e6f 626f 6479 676f 6e6e 6174 616b 656d  Nobodygonnatakem
00000010: 7963 6172 2c49 276d 676f 6e6e 6172 6163  ycar,I'mgonnarac
00000020: 6569 7474 6f74 6865 6772 6f75 6e64 416e  eittothegroundAn
00000030: 646e 6f62 6f64 7967 6f6e 6e61 6265 6174  dnobodygonnabeat
00000040: 6d79 6361 722c 6974 2773 676f 6e6e 6162  mycar,it'sgonnab
00000050: 7265 616b 7468 6573 7065 6564 6f66 736f  reakthespeedofso
00000060: 756e 644f 6f68 2c69 7427 7361 6b69 6c6c  undOoh,it'sakill
00000070: 696e 676d 6163 6869 6e65 4974 2773 676f  ingmachineIt'sgo
00000080: 7465 7665 7279 7468 696e 674c 696b 6561  teverythingLikea
00000090: 6472 6976 696e 6770 6f77 6572 2c62 6967  drivingpower,big
000000a0: 6661 7474 6972 6573 616e 6465 7665 7279  fattiresandevery
000000b0: 7468 696e 670a                           thing.
```

```shell
┏━━ ~  (      13 file/s) 
┗┅◉ doom@pc━► stat -f%z a.txt 
182
```

b) Ingresa la misma frase ahora CON ESPACIOS y revisa su contenido binario mediante el comando xxd y su peso en bytes.
```shell
┗┅◉ doom@pc ━► xxd b.txt 
00000000: 4e6f 626f 6479 2067 6f6e 6e61 2074 616b  Nobody gonna tak
00000010: 6520 6d79 2063 6172 2c20 4927 6d20 676f  e my car, I'm go
00000020: 6e6e 6120 7261 6365 2069 7420 746f 2074  nna race it to t
00000030: 6865 2067 726f 756e 640a 416e 6420 6e6f  he ground.And no
00000040: 626f 6479 2067 6f6e 6e61 2062 6561 7420  body gonna beat 
00000050: 6d79 2063 6172 2c20 6974 2773 2067 6f6e  my car, it's gon
00000060: 6e61 2062 7265 616b 2074 6865 2073 7065  na break the spe
00000070: 6564 206f 6620 736f 756e 640a 4f6f 682c  ed of sound.Ooh,
00000080: 2069 7427 7320 6120 6b69 6c6c 696e 6720   it's a killing 
00000090: 6d61 6368 696e 650a 4974 2773 2067 6f74  machine.It's got
000000a0: 2065 7665 7279 7468 696e 670a 4c69 6b65   everything.Like
000000b0: 2061 2064 7269 7669 6e67 2070 6f77 6572   a driving power
000000c0: 2c20 6269 6720 6661 7420 7469 7265 7320  , big fat tires 
000000d0: 616e 6420 6576 6572 7974 6869 6e67 0a    and everything.
```
```shell
┗┅◉ dom@pc ━► stat -f%z b.txt 
223
```

¿Cuál es la diferencia respecto a contenido binario de los dos archivos?
La diferencia es un total de 41 bits.

### 5. Comprime la frase del anterior inciso y otra frase más (puede ser una frase de una de tus peliculas favoritas), usando los algoritmos vistos. Para el primer algoritmo adjunta su representación binaria de inicio y final despúes de utilizarlo.
Representacion en binario de la frase anterior:
`
010011100110111101100010011011110110010001111001001000000110011101101111011011100110111001100001001000000111010001100001011010110110010100100000011011010111100100100000011000110110000101110010001011000010000001001001001001110110110100100000011001110110111101101110011011100110000100100000011100100110000101100011011001010010000001101001011101000010000001110100011011110010000001110100011010000110010100100000011001110111001001101111011101010110111001100100001000000100000101101110011001000010000001101110011011110110001001101111011001000111100100100000011001110110111101101110011011100110000100100000011000100110010101100001011101000010000001101101011110010010000001100011011000010111001000101100001000000110100101110100001001110111001100100000011001110110111101101110011011100110000100100000011000100111001001100101011000010110101100100000011101000110100001100101001000000111001101110000011001010110010101100100001000000110111101100110001000000111001101101111011101010110111001100100001000000100111101101111011010000010110000100000011010010111010000100111011100110010000001100001001000000110101101101001011011000110110001101001011011100110011100100000011011010110000101100011011010000110100101101110011001010010000001001001011101000010011101110011001000000110011101101111011101000010000001100101011101100110010101110010011110010111010001101000011010010110111001100111001000000100110001101001011010110110010100100000011000010010000001100100011100100110100101110110011010010110111001100111001000000111000001101111011101110110010101110010001011000010000001100010011010010110011100100000011001100110000101110100001000000111010001101001011100100110010101110011001000000110000101101110011001000010000001100101011101100110010101110010011110010111010001101000011010010110111001100111
`

Después de la compresión:
`
11111101010101111101010101110111000010010101110111010010010001001011110110100011111011100011000110011111011000000110010111001101111100010010101110111010010011110100111000111010001101000001000101000100001010110100010011110101010110011110101110011001000111010111001110101011111010101011101110000100101011101110100100111110110110011000000111110111000110001100111110110000000110100011001101011000100101011101110100100111110111101101100101111000100001010110100010111011000110111011011100101010110100001011101010110011110101110011111101110100101011000000011010001100110101100100100011110011010110111011011011011100100000111111001110001010100110111011010011001011000110011010110001001010100000110111111111101111100111010000101001101110010000110010010110011110110100100100101111111001101111111011011100100001011000101011111100110111110110000001111100110010000101101010011000001000011011110110101011001001111010111001101111111111011111001110100001010011011100100
`

El ahorro fue de: 
`725 bits`

Nueva frase:
```
Pues bien, yo necesito decirte que te adoro, decirte que te quiero con todo el corazón; que es mucho lo que sufro, que es mucho lo que lloro, que ya no puedo tanto, y al grito que te imploro te imploro y te hablo en nombre de mi última ilusión. De noche cuando pongo mis sienes en la almohada, y hacia otro mundo quiero mi espíritu volver, camino mucho, mucho y al fin de la jornada las formas de mi madre se pierden en la nada, y tú de nuevo vuelves en mi alma a aparecer. Comprendo que tus besos jamás han de ser míos; comprendo que en tus ojos no me he de ver jamás; y te amo, y en mis locos y ardientes desvaríos bendigo tus desdenes, adoro tus desvíos, y en vez de amarte menos te quiero mucho más.
```

En binario oringal:
`
010100000111010101100101011100110010000001100010011010010110010101101110001011000010000001111001011011110010000001101110011001010110001101100101011100110110100101110100011011110010000001100100011001010110001101101001011100100111010001100101001000000111000101110101011001010010000001110100011001010010000001100001011001000110111101110010011011110010110000100000011001000110010101100011011010010111001001110100011001010010000001110001011101010110010100100000011101000110010100100000011100010111010101101001011001010111001001101111001000000110001101101111011011100010000001110100011011110110010001101111001000000110010101101100001000000110001101101111011100100110000101111010110000111011001101101110001110110010000001110001011101010110010100100000011001010111001100100000011011010111010101100011011010000110111100100000011011000110111100100000011100010111010101100101001000000111001101110101011001100111001001101111001011000010000001110001011101010110010100100000011001010111001100100000011011010111010101100011011010000110111100100000011011000110111100100000011100010111010101100101001000000110110001101100011011110111001001101111001011000010000001110001011101010110010100100000011110010110000100100000011011100110111100100000011100000111010101100101011001000110111100100000011101000110000101101110011101000110111100101100001000000111100100100000011000010110110000100000011001110111001001101001011101000110111100100000011100010111010101100101001000000111010001100101001000000110100101101101011100000110110001101111011100100110111100100000011101000110010100100000011010010110110101110000011011000110111101110010011011110010000001111001001000000111010001100101001000000110100001100001011000100110110001101111001000000110010101101110001000000110111001101111011011010110001001110010011001010010000001100100011001010010000001101101011010010010000011000011101110100110110001110100011010010110110101100001001000000110100101101100011101010111001101101001110000111011001101101110001011100010000001000100011001010010000001101110011011110110001101101000011001010010000001100011011101010110000101101110011001000110111100100000011100000110111101101110011001110110111100100000011011010110100101110011001000000111001101101001011001010110111001100101011100110010000001100101011011100010000001101100011000010010000001100001011011000110110101101111011010000110000101100100011000010010110000100000011110010010000001101000011000010110001101101001011000010010000001101111011101000111001001101111001000000110110101110101011011100110010001101111001000000111000101110101011010010110010101110010011011110010000001101101011010010010000001100101011100110111000011000011101011010111001001101001011101000111010100100000011101100110111101101100011101100110010101110010001011000010000001100011011000010110110101101001011011100110111100100000011011010111010101100011011010000110111100101100001000000110110101110101011000110110100001101111001000000111100100100000011000010110110000100000011001100110100101101110001000000110010001100101001000000110110001100001001000000110101001101111011100100110111001100001011001000110000100100000011011000110000101110011001000000110011001101111011100100110110101100001011100110010000001100100011001010010000001101101011010010010000001101101011000010110010001110010011001010010000001110011011001010010000001110000011010010110010101110010011001000110010101101110001000000110010101101110001000000110110001100001001000000110111001100001011001000110000100101100001000000111100100100000011101001100001110111010001000000110010001100101001000000110111001110101011001010111011001101111001000000111011001110101011001010110110001110110011001010111001100100000011001010110111000100000011011010110100100100000011000010110110001101101011000010010000001100001001000000110000101110000011000010111001001100101011000110110010101110010001011100010000001000011011011110110110101110000011100100110010101101110011001000110111100100000011100010111010101100101001000000111010001110101011100110010000001100010011001010111001101101111011100110010000001101010011000010110110111000011101000010111001100100000011010000110000101101110001000000110010001100101001000000111001101100101011100100010000001101101110000111010110101101111011100110011101100100000011000110110111101101101011100000111001001100101011011100110010001101111001000000111000101110101011001010010000001100101011011100010000001110100011101010111001100100000011011110110101001101111011100110010000001101110011011110010000001101101011001010010000001101000011001010010000001100100011001010010000001110110011001010111001000100000011010100110000101101101110000111010000101110011001110110010000001111001001000000111010001100101001000000110000101101101011011110010110000100000011110010010000001100101011011100010000001101101011010010111001100100000011011000110111101100011011011110111001100100000011110010010000001100001011100100110010001101001011001010110111001110100011001010111001100100000011001000110010101110011011101100110000101110010110000111010110101101111011100110010000001100010011001010110111001100100011010010110011101101111001000000111010001110101011100110010000001100100011001010111001101100100011001010110111001100101011100110010110000100000011000010110010001101111011100100110111100100000011101000111010101110011001000000110010001100101011100110111011011000011101011010110111101110011001011000010000001111001001000000110010101101110001000000111011001100101011110100010000001100100011001010010000001100001011011010110000101110010011101000110010100100000011011010110010101101110011011110111001100100000011101000110010100100000011100010111010101101001011001010111001001101111001000000110110101110101011000110110100001101111001000000110110111000011101000010111001100101110
`

Después de la compresión:
`
011010010111101000101000110101110001000100101110001010101110000100100111111100010111000101101110001100110011111111000110101011010000101111111101000010110100000111110011110110101110101110001100110011111111000110101011010000101111111101000010110100001011111111011000100110101110001111111110010000101101110110011110001001010000111111111011010011111111001011111001101001010111100101111111101000010001010011011111101111110110111110001010011100010111111110100000101111101010110011010111010111000101111111101000010001010011011111101111110110111110001010011100010111111110100001010010100111011010111010111000101111111101000010101001110001001110000110001111010011001111000101100111010010110111010111000101010000111101000010101101110101100010110111000101111111101000010110100001100011011011000101001110110101110001011010000110001101101100010100111011010111000101010001011010000011011011101101011010011100010001000001001110110110110101110101000011001100001101111000000110100010100101101100011011011100110001010011110010111000111110011010010101110000110100111100000100111011111101101110000111111111100111010011001111000011000111001001010110111100011011110000101000101110001000100100010100100010000101000111000111101001101111100110110111110010111101110001010100001101101111111111100001110011101011011010111000110111111001001100111100010111111110110001001101011100011011110000010001010110001111101111010110001011011110000110011110101000110011001101010111000111111011111011110000100111000110111111011111101101111101011100011011111101111110110111110001010100001111010000101011001100001000011001100001010001110011111010111011010010001111100101110010100011101010010101100111011010110110111010100110011000011011110000011011011111001110101000001011000001100011000100110101100110001000010001000010100011100010001111100101111011100010101000101100110100000110011000001001111010001100111100001100111110100101000110011000101001000100001101111000000111101001101101110001110001110110000111110101001111111001101010101110000110100110111011011011000110101000100110011110001011111111010000101101111001010001101011000101111001010011111010011111011111110000101000110110111010000110011000001011001101000110111111101111100101101011110011111111101101101100011010100010011001111000101111111101000010001000010110111100101001110111110101110010100010011100011011100000110111000011001100000110011001101000111110100111110111111100001011010111100101010001011010000011111011111010111000101010001000100001101111000010100101001110111111111001010010101000011111010110011100010001001011010001010011001100010101100101111101011111011111001010001101011000100110011100010101101111000101101111001010011001100010111001100010010001011011100001111100111101101011100010110111100101001100110001010110011111101111100101101110001010100010001000001100110011111001000110011000001111101101111101010110100001101110001001110010100101101000010111111110110001001101011100011011111101111110110111110001101111111000010110101110
`

El ahorro fue de: 
`2348 bits`

  
### 6. Dada la palabra ”Azarath Metrion Zinthos” diseña dos árboles de Huffman diferentes y calcula el tamaño promedio del código para cada árbol.
Tabla de frecuencias:
| Símbolo | Frecuencia |
|--------|------------|
| A      | 1          |
| M      | 1          |
| Z      | 1          |
| e      | 1          |
| s      | 1          |
| z      | 1          |
| (espacio) | 2       |
| a      | 2          |
| h      | 2          |
| i      | 2          |
| n      | 2          |
| o      | 2          |
| r      | 2          |
| t      | 3          |

`[('A',1),('M',1),('Z',1),('e',1),('s',1),('z',1),(' ',2),('a',2),('h',2),('i',2),('n',2),('o',2),('r',2),('t',3)]`

```
                  2      2     2
                 /\     /\    /\ 
                A  z   M  Z  e  s

```

```
                    4
                   /   \
                  /     \     2
                 /\     /\    /\ 
                A  z   M  Z  e  s

```

```                  4            4
                   /   \        /   \ 
                  /     \      /     \
                 /\     /\    /\      \
                A  z   M  Z  e  s     ' ' 

```

```
                     4            4           4            4           4
                   /   \        /   \        /  \        /  \        /  \
                  /     \      /     \      /    \      /    \      /    \
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```

```
                                                                         7
                                                                        / \   
                                                                       /   \   
                     4            4           4            4           _    t
                   /   \        /   \        /  \        /  \        /  \
                  /     \      /     \      /    \      /    \      /    \
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```

```

                                                                   11
                                                                 /    \
                                                                /      \
                                                               /        \
                                                              /           _
                                                             /           / \   
                                                            /           /   \   
                     4            4           4            4           _    t
                   /   \        /   \        /  \        /  \        /  \
                  /     \      /     \      /    \      /    \      /    \
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```

```

                                                                   11
                                                                 /    \
                                        8                       /      \
                                     /    \                    /        \
                                    /      \                  /           _
                                   /        \                /           / \   
                                  /          \              /           /   \   
                     4            _           _            4           _    t
                   /   \        /   \        /  \        /  \        /  \
                  /     \      /     \      /    \      /    \      /    \
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```

```
                                12
                              /     \
                             /       \
                            /         \                            11
                           /           \                         /    \
                          /            _                        /      \
                         /           /    \                    /        \
                        /           /      \                  /           _
                       /           /        \                /           / \   
                      /           /          \              /           /   \   
                     _            _           _            _           _    t
                   /   \        /   \        /  \        /  \        /  \
                  /     \      /     \      /    \      /    \      /    \
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```

```
                                                23
                                            /        \
                                           /          \     
                                          /            \
                                         /              \
                                        /                \
                                     0 /                  \ 1
                                      /                    \
                                     /                      \
                                    /                        \
                                   /                          \
                                  /                            \
                                 /                              \
                                _                                \ 
                              /     \                             \
                             /       \ 1                           \
                            /         \                            _
                         0 /           \                         /    \
                          /            _                        /      \ 1
                         /           /    \                  0 /        \
                        /         0 /      \ 1                /           _
                       /           /        \                /         0 / \ 1  
                      /           /          \              /           /   \   
                     _            _           _            _           _    t
                   /   \        /   \        /  \        /  \        /  \
                0 /     \ 1  0 /     \ 1  0 /    \ 1  0 /    \ 1  0 /    \ 1
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```


Por cada caracter le corresponde un codigo de huffman con el arbol de arriba: 

`[('i',"100"),('n',"101"),('a',"0110"),('h',"0111"),('t',"111"),('o',"1100"),('r',"1101"),('A',"0000"),('M',"0010"),(' ',"0101"),('s',"01001"),('z',"0001"),('Z',"0011"),('e',"01000")]`

Otro árbol es cambiar el order de los bits de 0 a 1 en el recorrido

```
                                                23
                                            /        \
                                           /          \     
                                          /            \
                                         /              \
                                        /                \
                                     1 /                  \ 0
                                      /                    \
                                     /                      \
                                    /                        \
                                   /                          \
                                  /                            \
                                 /                              \
                                _                                \ 
                              /     \                             \
                             /       \ 0                           \
                            /         \                            _
                         1 /           \                         /    \
                          /            _                        /      \ 0
                         /           /    \                  1 /        \
                        /         1 /      \ 0                /           _
                       /           /        \                /         1 / \ 0  
                      /           /          \              /           /   \   
                     _            _           _            _           _    t
                   /   \        /   \        /  \        /  \        /  \
                1 /     \ 0  1 /     \ 0  1 /    \ 0  1 /    \ 0  1 /    \ 0
                 /\     /\    /\      \    /      \    /      \    /      \
                A  z   M  Z  e  s     ' ' a       h   i        n  o        r

```
Por cada caracter le corresponde un codigo de huffman con el arbol de arriba: 

`[('i',"011"),('n',"010"),('a',"1001"),('h',"1000"),('t',"000"),('o',"0011"),('r',"0010"),('A',"111"),('M',"1101"),(' ',"1010"),('s',"10110"),('z',"1110"),('Z',"1100"),('e',"10111")]`


### 7. ¿Cómo se garantiza que este algoritmo no genere un árbol desbalanceado?
En general los arboles de huffman no son balanceados 

### 8. ¿Puede cambiar la altura de un árbol de acuerdo a su codificación?
Si y esto depende de la frecuencia de los caracteres o elementos, algunos puede quedar muy lejos aunque tengan poca frecuencia, por ejemplo en mi arbol de arriba la letra `t`quedo muy lejos por la manera en que lo construí, bien podría tener un solo bit para representarlo.

### 9. ¿Por qué es necesario tener un respectivo árbol de Huffman para decodificar una cadena de texto? ¿Qué pasa si no lo tengo?
Te pones llorar porque perdiste tu información XD. Como el árbol es la llave para poder construir el mensaje original si pierdes el árbol no hay manera en que puedas recuperarlo.

## References

Automation, I. a. N., & Del artículo, F. (n.d.). CODIFICACIÓN DE LA INFORMACIÓN (I). Venancioguntinas.com. Retrieved May 25, 2026, from https://www.venancioguntinas.com/_files/ugd/63ce8d_9dfc906cd2c24da681a9b002d06e5b95.pdf?index=true

de información tratable ). • En principio, •. La Compresión de Datos Consiste en la Reducción del Volumen, La misma información, C. la C. se P. T., & de espacio., P. E. M. C. (n.d.). Compresión de datos. Edu.Ar. Retrieved May 25, 2026, from https://cs.uns.edu.ar/~mlg/ed/downloads/Teorias/uns-ed-2019-clase-19-Procesamiento%20de%20textox2.pdf

Ferrier, A. (n.d.). A quick tutorial on generating a Huffman tree. Andrewferrier.com. Retrieved May 25, 2026, from https://www.andrewferrier.com/my-work/huffman_tutorial/

MIT OpenCourseWare. (n.d.). MIT OpenCourseWare. Retrieved May 25, 2026, from https://ocw.mit.edu/?utm_source=chatgpt.com

Overview. (n.d.). Stanford.edu. Retrieved May 25, 2026, from https://cs.stanford.edu/people/eroberts/courses/soco/projects/data-compression/overview/index.htm

University of Canterbury Computer Science Education Research Group. (n.d.). Huffman tree - computer science field guide. Org.Nz. Retrieved May 25, 2026, from https://www.csfieldguide.org.nz/en/interactives/huffman-tree/

(N.d.). Textfixer.com. Retrieved May 25, 2026, from https://www.textfixer.com/tools/remove-line-breaks.php