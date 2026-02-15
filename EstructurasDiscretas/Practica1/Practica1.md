## ¿Cuáles son las principales diferencias entre Haskell y RACKET?
No soy experto en Racket pero por lo que entiendo Racket como Lips usa Symbolic Expressions, y todo en Racket es una lista. 
Por ejemplo para poder pintar un boolean:
```lisp
(display #f)
```
En cambio en haskell

```haskell
main = print True
```

tampoco soy experto en haskell pero entiendo que es puro funcional mientras Racket no.
aunque no es una diferencia, ambos puede ser compilado o interpretados, par haskell esta GCH y GHCi del lado de Racket es DrRacket para el interprete y para el compilador usa Raco.

## ¿Cuáles son las principales diferencias entre Haskell y Java?
Para estos dos si hay bastantes, para empezar java es un lenguage orientado a objectos aunque en sus últimas versiones saco algunas features funcionales como lambdas. Haskell por otro lado no implementa funcionaliades orientadas a objectos.
Ambos son interpretados y compilados. Además una gran diferencia y creo la mayor es que Java es aburrido y Haskel no :P entiendo que cada lenguaje tiene un proposito pero es he visto projectos de Java que tienen abstraciones para todo y se crean miles de clases por todas partes y herencia es casi imposible leer el stack cuando aparece un error, debes rastrear como miles de clases. Con haskell podras ver el error pero tal vez no lo entiendas xD 

## ¿Por qué Haskell no ha alcanzado una adopción significativa en la industria del software?
Esto puede ser muy a titulo personal, pero el nivel de abstración que necesitas para poder crear un programa a nivel funcional puede ser mayor que escribir uno a nivel imperativo porque vas paso a paso en el imperativo y es mas sencilla la abstracción,
y eso empuja otra problemantica a nivel de administración, si quieres prototipar una app o idea rápida usar haskell podrias tener varias desventajas como el personal, tardarias mas en buscar personas calificadas para poder hacer haskell. Por eso pienso que lenguajes como Python y Js son tan populares pues te permiten prototipar ideas o apps de manera muy sencilla y en este mundo que se mueve tan rapido nadie quiere esperar, además creo que la mayor parte del software que se crea hoy día es desechable, en un par de años queda caducado y toca migrar. A mi me gusto haskell la primera vez que lo utilice pero no encontre casi trabajos o los que encontre eran en europa con un nivel de master :/ 

## Si pudieras realizar un simple analogía entre Git y GitHub ¿Cuál se te vendría a la mente?
Git es el motor del vehículo llamado Github.

## Fuentes

3.1 Booleans. (n.d.). Racket-lang.org. Retrieved February 15, 2026, from https://docs.racket-lang.org/guide/booleans.html

Beta, D. (n.d.). Racket: un lenguaje similar a Lisp (Scheme y Clojure). Blogspot.com. Retrieved February 15, 2026, from https://alquimistadecodigo.blogspot.com/2025/04/racket-un-lenguaje-similar-lisp-scheme.html

Diehl, S. (2016, February 16). The joy and agony of Haskell in production. Stephen Diehl. https://www.stephendiehl.com/posts/production/

Haskell for all. (n.d.). Haskellforall.com. Retrieved February 15, 2026, from https://haskellforall.com/2013/07/statements-vs-expressions

Raco: Racket command-line tools. (n.d.). Racket-lang.org. Retrieved February 15, 2026, from https://docs.racket-lang.org/raco/index.html

(N.d.). Stackoverflow.com. Retrieved February 15, 2026, from http://stackoverflow.com/questions/74172158/what-is-an-s-expression

