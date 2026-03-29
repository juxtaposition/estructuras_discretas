## Objetivo de la practica
En esta práctica 5 enfocado en recursividad y listas

## Tiempo requerido en realizar la práctica completa
No tuve muchos problemsa en implementar las funciones muchas de ellas intuitivas mirando el caso base y recursivo, en el que tuve que mirar un poco mas en detella fue en el ultimo ejercicio llamado extranio, porque este nos da un algoritom pero en las pruebas siempre se incluye el elemento al comienzo, asi que tuve que agregarlo al comienzo y paso las pruebas

## Comentarios
Me gustaron los ejercicios, y las actividades en general una buena practica, ademas los test fueron geniales te dan una ide de si funcion va bien o no, bueno idea lo de los test, lo complicado es que configurar Cabal en mi Linux Mint no fue tan sencillo me toco agregar un ghc.environment (para agregar las libs) en mi folder de la Practica5, los ejercicio los hice en mi otra computador y los bajaba en la Linux Mint para probar :D - pero fuera de eso todo genial.

## Actividades
### Responde en tu respectivo README las siguientes dos preguntas:

• ¿Qué es la Recursión de cola (tail recursion)?
La recursion de cola es una optimizacion de las llamadas recursivas de una funcion, la idea general es que la llamada recursiva sea la ultima, cabe resaltar que las tail recursion son una caso particular de las Continus Passing Style, [aca unos ejemplos usndo JavaScript](https://matt.might.net/articles/by-example-continuation-passing-style/)

Lazyness puede ser un problema en haskell, but why?

Para que la recursion de cola tenga efectividad se necesita que el lenguaje evalue estrictamente en cada llamad los parametros. Pero veamos un ejemplo para que quede un poco mejor entendido:

Imaginemos esta funcion en haskell:

```haskell
fn acc 0 = acc
fn acc n = fn (acc + 1) (n-1)
```

mirando la recursion:
`
fn 0 5 = fn ( (0 + 1) (5 - 1)) = fn ( fn (0 + 1) + 1 (5 - 1) - 1)
`

haskell no va a evaluar las sumas o restas hasta que las necesite esto es cuando la recusion inicia a salir del stack. 
y esto en la recusion de cola no se quiere, es decir al momento de llegar al ultimo caso de la recursion ya tenemos al resultado en nuestro
`acc` para forzar a haskell a evaluar en cada llamada se puede usar el [signo estricto](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/strict.html) `!` 

```haskell
fn !acc 0 = acc
fn !acc n = fn (acc + 1) (n-1)
```


• ¿Cuál es la relación entre las funciones de orden superior foldr y foldl con
este tipo de recursión?

Foldr y Foldl son funciones que reciven un acumuladro y una funcion aplicada a una lista, es decir aplica una funcion a cada elemento de la lista, pero lo va guardando en el acumulador

mirando nuestro ejemplo de arriba llamado `fn` usndo foldr

```haskell
foldr (+) 0 [1,1,1,1,1]
-- similar to foldl
foldl (+) 0 [1,1,1,1,1]
```

ayuda a realizar la recursion de cola para alguna funcion.