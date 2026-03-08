## Objetivo de la practica
En esta práctica 3 se  busca entender mejor los conceptos de recursio en haskell, ademas de tipos asi como tuplas y listas.

## Tiempo requerido en realizar la práctica completa

## Comentarios


## Actividades

### ¿Cuál es la diferencia entre Num e Int? realiza un ejemplo en, adjuntando una captura de pantalla. El ejemplo debe ser sencillo
Int es un alias para Integer[^1] el cual es un Type (tipo primitivo), pero Num es una Typeclasses las cuales definen comportamientos para los Type

Es decir fijemos en el operador `(+)`
```haskell
ghci> :t (+)
(+) :: Num a => a -> a -> a
```
Pra que tipos esta definido el operador suma en la clase de tipos Num? pues basta mirando su `info`

```haskell
ghci> :info Num
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
  	-- Defined in ‘GHC.Num’
instance Num Double -- Defined in ‘GHC.Float’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
```

Es decir que podemos usar suma como `3 + 3` sumando enteros, pero tambien podemos sumar enteros con Float `3 + 2.0` es decir que haskell internamente infiere el tipo para la suma y da como resultado `5.0` pero este quiere decir que haskell tiene type cohercion como en JS y Python?
`NO`

Mireos por ejemplo:

```haskell
ghci> (3 :: Int) + (4.0)

<interactive>:56:15: error:
    • No instance for (Fractional Int) arising from the literal ‘4.0’
    • In the second argument of ‘(+)’, namely ‘(4.0)’
      In the expression: (3 :: Int) + (4.0)
      In an equation for ‘it’: it = (3 :: Int) + (4.0)
```
a haskell no le gusto el segundo argumento, porque no cumple la regla de tipdo definido en el typeclasses de Num. 

ahora si deseamos poder sumar Int y Float tendriamos que crear nuestro propia funcion que pueda tomar Int y Float, luego hacer cast de Int a Float regresar la suma de ambos floats. Pero esto ya lo hace haskell internamente. 

Ejemplo sencillo:
```haskell
-- Esta funcion puede sumar SOLO Int y ya
sumaSoloInt :: Int -> Int -> Int
sumaSoloInt a b = a + b

-- Esta puede sumar todo lo que pertenezca a Num (typeclasses) es decir Double, Foat, Int
sumaNum :: Num a => a -> a -> a
sumaNum a b = a + b
```

```haskell

ghci> sumaSoloInt 3 4
7
ghci> sumaSoloInt 3 4.0

<interactive>:47:15: error:
    • No instance for (Fractional Int) arising from the literal ‘4.0’
    • In the second argument of ‘sumaSoloInt’, namely ‘4.0’
      In the expression: sumaSoloInt 3 4.0
      In an equation for ‘it’: it = sumaSoloInt 3 4.0
ghci> sumaNum 3 4.0
7.0
ghci> sumaNum 3.0 4.0
7.0
ghci> sumaNum 3.0 4
7.0
```

### Di si la siguiente definición hace su trabajo si crees que no, proporciona tu propia versión y justificala:
`allPairs =[( x , y ) | x <- [0..] , y <- [0..]]`

Es medido trickey la pregunta, porque la lista va a terminar con la memoría de la computadora asi que solo tendras

> Usually on 32-bit machines the maximum possible Int is 2147483647 and the minimum is -2147483648. 

Así pues "infinito" y representar "todos" nunca va a pasar, pero esa lista de compresión esta bien definada y creará parejas
de enteros hasta que se termine la memoria o haskell regrese cosas raras xD

[^1]: https://learnyouahaskell.github.io/types-and-typeclasses.html#typeclasses-101

